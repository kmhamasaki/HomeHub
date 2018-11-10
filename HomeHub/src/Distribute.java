
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Distribute
 */
@WebServlet("/Distribute")
public class Distribute extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Distribute() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("in Distribute doPost()...");
		Connection conn = null;
		Statement st = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		PreparedStatement ps2 = null;
		ResultSet rs2 = null;
		// extract info from headers
		String temp = request.getHeader("name");
		if (temp == null) {
			System.out.println("Something went wrong...");
			return;
		}
		String name = temp.replace(" ", "_");
		try {
			// connect to database
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/HomeHub?user=root&password=password&useSSL=false");
			st = conn.createStatement();
			// get the list of users in that house
			String sql = "SELECT email FROM " + name + ";";
			System.out.println(sql);
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<String> users = new ArrayList<String>();
			while (rs.next()) {
				String email = rs.getString("email");
				users.add(email);
			}
			// get the list of tasks for that house
			sql = "SELECT taskDesc FROM " + name + "_tasks;";
			System.out.println(sql);
			ps2 = conn.prepareStatement(sql);
			rs2 = ps2.executeQuery();
			ArrayList<String> tasks = new ArrayList<String>();
			while (rs2.next()) {
				String taskDesc = rs2.getString("taskDesc");
				tasks.add(taskDesc);
			}
			// distribute tasks in a round-robin fashion
			int numUsers = users.size();
			int numTasks = tasks.size();
			ArrayList<String> tempTasks = new ArrayList<String>();
			if (numUsers == numTasks) {
				System.out.println("One task per user!");
			} else if (numUsers > numTasks) {
				int diff = numUsers - numTasks;
				for (int i = 0; i < diff; i++) {
					tasks.add("No task!");
				}
				System.out.println("Some users don't have a task");
			} else if (numUsers < numTasks){
				System.out.println("Some users will get multiple tasks!");
				for (int i = 0; i < numUsers; i++) {
					tempTasks.add("");
				}
				for (int i = 0; i < numTasks; i++) {
					int u = i % numUsers;
					String ut = tempTasks.get(u);
					ut += tasks.get(i) + ", ";
					tempTasks.remove(u);
					tempTasks.add(u, ut);
				}
				tasks = tempTasks;
			}
			System.out.println("Tasks: ");
			for (int i = 0; i < tasks.size(); i++) {
				System.out.println(i + " " + tasks.get(i));
			}
			// update database
			for (int i = 0; i < numUsers; i++) {
				if (i < tasks.size()) {
					String update = "UPDATE " + name + " SET currTask='" + tasks.get(i) + "' WHERE email='" + users.get(i) + "';";
					System.out.println(update);
					st.executeUpdate(update);
					update = "UPDATE " + name + " SET nextTask='" + tasks.get((i+1)%tasks.size()) + "' WHERE email='" + users.get(i) + "';";
					System.out.println(update);
					st.executeUpdate(update);
				}
			}
			System.out.println("Distribute POST successful!");
		} catch (SQLException sqle) {
			System.out.println("SQLException: " + sqle.getMessage());
		} catch (ClassNotFoundException cnfe) {
			System.out.println("ClassNotFoundException: " + cnfe.getMessage());
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (st != null) {
					st.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException sqle) {
				System.out.println("sqle: " + sqle.getMessage());
			}
		}
	}

}
