package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCCoffeeDAO implements CoffeeDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCCoffeeDAO(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	
	@Override
	public List<Coffee> getCoffeeOffered(String googlePlaceId) {
		ArrayList<Coffee> coffees = new ArrayList<Coffee>();
		String sqlFindCoffeesById = "SELECT coffee.*\n" + 
				"FROM coffee\n" + 
				"JOIN place_coffee ON coffee.coffee_id = place_coffee.coffee_id\n" + 
				"JOIN place ON place_coffee.google_place_id = place.google_place_id\n" + 
				"WHERE place.google_place_id = ?;";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlFindCoffeesById, googlePlaceId);
		while (results.next()) {
			Coffee theCoffee = mapRowToCoffee(results);
			coffees.add(theCoffee);
		}	
		return coffees;	
	}

	@Override
	public void addNewCoffee(Coffee coffee, String googlePlaceId) {
		String sqlAddReview = "INSERT INTO coffee (coffee_name, origin, roaster, detail) VALUES \n" + 
				"(?, ?, ?, ?)\n" + 
				"RETURNING coffee_id;";
		long coffeeId = jdbcTemplate.queryForObject(sqlAddReview, Long.class, coffee.getCoffeeName(), coffee.getOrigin(),
				coffee.getRoaster(), coffee.getDetail());		
		
		addExistingCoffeeToPlace(coffeeId, googlePlaceId);		
	}

	@Override
	public void deleteCoffeeFromPlace(long coffeeId, String googlePlaceId) {
		String sqlDeleteCoffee = "DELETE FROM place_coffee WHERE google_place_id = ? AND coffee_id = ?;";
		jdbcTemplate.update(sqlDeleteCoffee, googlePlaceId, coffeeId);
		
	}

	@Override
	public void addExistingCoffeeToPlace(long coffeeId, String googlePlaceId) {
		String sqlAddCoffee = "INSERT INTO place_coffee (google_place_id, coffee_id) VALUES (?,?);";
		jdbcTemplate.update(sqlAddCoffee, googlePlaceId, coffeeId);	
		
	}

	private Coffee mapRowToCoffee(SqlRowSet results) {
		Coffee coffeeRow = new Coffee();
		coffeeRow.setCoffeeId(results.getLong("coffee_id"));
		coffeeRow.setCoffeeName(results.getString("coffee_name"));
		coffeeRow.setOrigin(results.getString("origin"));
		coffeeRow.setRoaster(results.getString("roaster"));
		coffeeRow.setDetail(results.getString("detail"));
		return coffeeRow;
	}
	
	
}
