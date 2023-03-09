package freelance_paradise;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class ProjectDAO {

	public List<Project> getProjects() throws Exception {

		DB db = new DB();
		String sql = "SELECT * FROM Project;";
		List<Project> projects = new ArrayList<Project>();

		try {

			Connection con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				projects.add(new Project(rs.getInt("projectId"), rs.getString("title"), rs.getString("state"), rs.getString("descr"),
				 		rs.getString("budget"), rs.getString("categoryTitle"), rs.getString("username"), rs.getString("seller"), rs.getString("chat")));
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
		return projects;
	}

	public List<Project> getProjects(String dataType, String dataValue) throws Exception {

		DB db = new DB();
		String sql = "SELECT * FROM Project where " + dataType + "=?;";
		List<Project> projects = new ArrayList<Project>();

		try {

			Connection con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, dataValue);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				projects.add(new Project(rs.getInt("projectId"), rs.getString("title"), rs.getString("state"), rs.getString("descr"),
				 		rs.getString("budget"), rs.getString("categoryTitle"), rs.getString("username"), rs.getString("seller"), rs.getString("chat")));
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
		return projects;
	}

	public Project findProject(int projectId) throws Exception {

		DB db = new DB();
		String sql = "SELECT * FROM Project where projectId=?;";
		Project project = null;

		try {

			Connection con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, projectId);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				project = new Project(rs.getInt("projectId"), rs.getString("title"), rs.getString("state"), rs.getString("descr"),
						rs.getString("budget"), rs.getString("categoryTitle"), rs.getString("username"), rs.getString("seller"), rs.getString("chat"));
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
		return project;
	}

	public void registerProject(Project project) throws Exception {

		DB db = new DB();
		String sql = "INSERT INTO Project(projectId, title, state, descr, budget, categoryTitle, username, chat) "
				+ " VALUES (?, ?, ?, ?, ?,"
				+ "(SELECT title FROM Category WHERE title=?),"
				+ "(SELECT username FROM Users WHERE username=?), ?);";

		try {

			Connection con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, project.getProjectId());
			stmt.setString(2, project.getTitle());
			stmt.setString(3, project.getState());
			stmt.setString(4, project.getDescr());
			stmt.setString(5, project.getBudget());
			stmt.setString(6, project.getCategoryTitle());
			stmt.setString(7, project.getUsername());
			stmt.setString(8, "");
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


	public void updateProject(int projectId, String title, String state, String descr, String budget, String categoryTitle) throws Exception {

		DB db = new DB();
		String sql = "UPDATE Project SET title=?, state=?, descr=?, budget=?, categoryTitle=(SELECT title FROM Category WHERE title=?) WHERE projectId=?;";

		try {

			Connection con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, title);
			stmt.setString(2, state);
			stmt.setString(3, descr);
			stmt.setString(4, budget);
			stmt.setString(5, categoryTitle);
			stmt.setInt(6, projectId);
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

	public void updateChat(int projectId, String chat) throws Exception {

		DB db = new DB();
		String sql = "UPDATE Project SET chat=? WHERE projectId=?;";

		try {

			Connection con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, chat);
			stmt.setInt(2, projectId);
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

	public void updateSeller(int projectId, String seller) throws Exception {

		DB db = new DB();
		String sql = "UPDATE Project SET seller=(SELECT username FROM Users WHERE username=?) WHERE projectId=?;";

		try {

			Connection con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, seller);
			stmt.setInt(2, projectId);
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

	public void updateState(int projectId, String state) throws Exception {

		DB db = new DB();
		String sql = "UPDATE Project SET state=? WHERE projectId=?;";

		try {

			Connection con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, state);
			stmt.setInt(2, projectId);
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
