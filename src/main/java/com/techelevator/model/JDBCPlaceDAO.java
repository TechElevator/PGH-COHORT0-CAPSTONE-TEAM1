package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;


@Component
public class JDBCPlaceDAO implements PlaceDAO{

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCPlaceDAO(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	@Override
	public Place getPlaceById(String googlePlaceId) {
		Place place = new Place();
		String sqlGetPlaceById = "SELECT *\n" + 
				"FROM place\n" + 
				"WHERE google_place_id = ?;";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetPlaceById, googlePlaceId);
		if (!results.next()) {
			return null;
			//throw new Error("Did not find expected result");
		}
		place = mapRowToPlace(results);
		if (results.next()) {
			
			throw new Error("Found too many results");	
		}
		
		return place;
	}

	@Override
	public List<Place> getPlacesSellingCoffeeById(long coffeeId) {
		ArrayList<Place> places = new ArrayList<Place>();
		String sqlFindPlacesById = "SELECT place.*\n" + 
				"FROM place\n" + 
				"JOIN place_coffee ON place.google_place_id = place_coffee.google_place_id\n" + 
				"JOIN coffee ON place_coffee.coffee_id = coffee.coffee_id\n" + 
				"WHERE coffee.coffee_id = ?;";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlFindPlacesById, coffeeId);
		while (results.next()) {
			Place thePlace = mapRowToPlace(results);
			places.add(thePlace);
		}	
		return places;	
	}

	@Override
	public void addPlace(Place place) {
		String sqlAddPlace = "INSERT INTO place\n" + 
				"(google_place_id, coffee_shop_name, address, photo_reference)\n" + 
				"VALUES (?,?,?,?);";
		jdbcTemplate.update(sqlAddPlace, place.getGooglePlaceId(), place.getCoffeeShopName(), 
				place.getAddress(), place.getPhotoReference());
		
	}

	@Override
	public void updatePlace(Place place) {
		String sqlUpdatePlace = "UPDATE place\n" + 
				"SET coffee_shop_name = ?, address = ?, photo_reference = ?\n" + 
				"WHERE google_place_id = ?;";
		jdbcTemplate.update(sqlUpdatePlace, place.getCoffeeShopName(), 
				place.getAddress(), place.getPhotoReference(), place.getGooglePlaceId());
		
	}
	
	public List<Place> getAllPlacesByUserName(String userName) {
		List<Place> allPlaces = new ArrayList<>();
		String sql = "SELECT place.* FROM place\n" + 
				"JOIN user_place on place.google_place_id = user_place.google_place_id\n" + 
				"JOIN app_user on user_place.user_id = app_user.id WHERE app_user.user_name = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userName);
		while (results.next()) {
			Place place = mapRowToPlace(results);
			allPlaces.add(place);
		}
		return allPlaces;
	}

	private Place mapRowToPlace(SqlRowSet results) {
		Place placeRow = new Place();
		placeRow.setGooglePlaceId(results.getString("google_place_id"));
		placeRow.setCoffeeShopName(results.getString("coffee_shop_name"));
		placeRow.setAddress(results.getString("address"));
		placeRow.setPhotoReference(results.getString("photo_reference"));
		return placeRow;
	}
	
	
	
}
