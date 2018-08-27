package com.techelevator.model;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

public class JDBCCoffeeDAO implements CoffeeDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCCoffeeDAO(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	
	@Override
	public List<Coffee> getCoffeeOffered(String googlePlaceId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addNewCoffee(Coffee coffee, String googlePlaceId) {
		// TODO Auto-generated method stub
		
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
