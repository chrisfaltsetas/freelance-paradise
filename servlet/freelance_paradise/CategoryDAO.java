package freelance_paradise;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class CategoryDAO {

	public List<Category> getCategories() throws Exception {

		DB db = new DB();
		String sql = "SELECT * FROM Category";
		List<Category> categories = new ArrayList<Category>();

		try {

			Connection con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
	 			categories.add(new Category(rs.getString("title"), rs.getString("descr")));
			}

			rs.close();
			stmt.close();
			con.close();
			db.close();

		} catch (Exception e) {
			e.getMessage();

		} finally {
			try {
				db.close();
			} catch (Exception e) {

			}
		}
		return categories;
	}

	public Category findCategory(String title) throws Exception {

		DB db = new DB();
		String sql = "SELECT * FROM Category where title=?;";
		Category category = null;

		try {

			Connection con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, title);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				category = new Category(rs.getString("title"), rs.getString("descr"));
			}

			rs.close();
			stmt.close();
			con.close();
			db.close();

		} catch (Exception e) {
			e.getMessage();

		} finally {
			try {
				db.close();
			} catch (Exception e) {

			}
		}
		return category;
	}

	public void registerCategory(Category category) throws Exception {

		DB db = new DB();
		String sql = "INSERT INTO Category(title, descr) " + " VALUES (?, ?);";

		try {

			Connection con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, category.getTitle());
			stmt.setString(2, category.getDescr());
			stmt.executeUpdate();

			stmt.close();
			con.close();
			db.close();

		} catch (Exception e) {
			e.getMessage();
		} finally {
			try {
				db.close();
			} catch (Exception e) {

			}
		}
	}
}
