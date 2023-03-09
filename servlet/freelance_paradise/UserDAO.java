package freelance_paradise;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class UserDAO {

	public List<User> getUsers() throws Exception {

		DB db = new DB();
		String sql = "SELECT * FROM Users";
		List<User> users = new ArrayList<User>();

		try {

			Connection con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				users.add( new User(rs.getString("name"), rs.getString("surname"), rs.getString("email"), 
						rs.getString("username"), rs.getString("password"), rs.getString("type"), rs.getString("about")));
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
		return users;
	}

	public User findUser(String username) throws Exception {

		DB db = new DB();
		String sql = "SELECT * FROM Users where username=?;";
		User user = null;

		try {

			Connection con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, username);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				user = new User(rs.getString("name"), rs.getString("surname"), rs.getString("email"), rs.getString("username"), 
						rs.getString("password"), rs.getString("type"), rs.getString("about") );
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
		return user;
	}

	public User findUserEmail(String email) throws Exception {

		DB db = new DB();
		String sql = "SELECT * FROM Users where email=?;";
		User user = null;

		try {

			Connection con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, email);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				user = new User(rs.getString("name"), rs.getString("surname"), rs.getString("email"), rs.getString("username"), 
						rs.getString("password"), rs.getString("type"), rs.getString("about") );
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
		return user;
	}

	public boolean authenticate(String username, String password) throws Exception {

		boolean isAuthenticated = false;

		DB db = new DB();
		String sql = "SELECT * FROM Users where username=? and password=?;";

		try {

			Connection con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();

			if (!rs.next()) {
				isAuthenticated = false;
				throw new Exception("Wrong username or password");				
			} else {
				isAuthenticated = true;
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
		return isAuthenticated;
	}

	public void registerUser(User user) throws Exception {

		DB db = new DB();
		String sql = "INSERT INTO Users(username, name, surname, email, password, type, about) " + " VALUES (?, ?, ?, ?, ?, ?, ?);";

		try {

			Connection con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, user.getUsername());
			stmt.setString(2, user.getName());
			stmt.setString(3, user.getSurname());
			stmt.setString(4, user.getEmail());
			stmt.setString(5, user.getPassword());
			stmt.setString(6, user.getType());
			stmt.setString(7, user.getAbout());
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

	public void updateAbout(String username, String about) throws Exception {

		DB db = new DB();
		String sql = "UPDATE users SET about=? WHERE username=?;";

		try {

			Connection con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, about);
			stmt.setString(2, username);
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
