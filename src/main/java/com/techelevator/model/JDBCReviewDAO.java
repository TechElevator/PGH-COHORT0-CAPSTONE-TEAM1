package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

public class JDBCReviewDAO implements ReviewDAO{
	
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCReviewDAO(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}

	@Override
	public List<Review> getReviewsByUserId(long userId) {
		ArrayList<Review> reviews = new ArrayList<Review>();
		String sqlFindReviewsById = "SELECT review.*\n" + 
				"FROM review \n" + 
				"JOIN user_review on user_review.review_id = review.review_id\n" + 
				"JOIN app_user on user_review.user_id = app_user.id\n" + 
				"WHERE app_user.id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlFindReviewsById, userId);
		while (results.next()) {
			Review theReview = mapRowToReview(results);
			reviews.add(theReview);
		}	
		return reviews;	
	}

	@Override
	public void addNewReview(int rating, String detail, long coffeeId, long userId) {
		String sqlAddReview = "INSERT INTO review (rating, detail) VALUES\n" + 
				"(?, ?)\n" + 
				"RETURNING review_id";
		long reviewId = jdbcTemplate.queryForObject(sqlAddReview, Long.class, rating, detail);
		
		String sqlAddReviewUser = "INSERT INTO user_review(user_id, review_id) VALUES(?,?)";
		jdbcTemplate.update(sqlAddReviewUser, userId, reviewId);
		
		String sqlAddCoffeeReview = "INSERT INTO coffee_review(coffee_id, review_id) VALUES(?,?)";
		jdbcTemplate.update(sqlAddCoffeeReview, coffeeId, reviewId);				
	}
	
	private Review mapRowToReview(SqlRowSet results) {
		Review reviewRow = new Review();
		reviewRow.setReviewId(results.getLong("review_id"));
		reviewRow.setRating(results.getInt("rating"));
		reviewRow.setDetail(results.getString("detail"));
		reviewRow.setReviewDate(results.getDate("review_date").toLocalDate());
		return reviewRow;
	}
	
}
