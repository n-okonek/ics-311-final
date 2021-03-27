import java.io.IOException;
import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.sql.DataSource;

/**
 * Servlet implementation class ads
 */
@WebServlet("/home")
public class ads extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ads() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		PrintWriter out;
		out = response.getWriter();
		String title = "Automatic Dispensing Systems";
		int machineId = 3;
		int floorNum = 2;
		
		out.print("<!DOCTYPE html>\r\n"
				+ "<!--[if lt IE 7]>      <html class='no-js lt-ie9 lt-ie8 lt-ie7'> <![endif]-->\r\n"
				+ "<!--[if IE 7]>         <html class='no-js lt-ie9 lt-ie8'> <![endif]-->\r\n"
				+ "<!--[if IE 8]>         <html class='no-js lt-ie9'> <![endif]-->\r\n"
				+ "<!--[if gt IE 8]>      <html class='no-js'> <!--<![endif]-->\r\n"
				+ "<html>\r\n"
				+ "  <head>\r\n"
				+ "    <meta charset='utf-8'>\r\n"
				+ "    <meta http-equiv='X-UA-Compatible' content='IE=edge'>\r\n"
				+ "    <title></title>\r\n"
				+ "    <meta name='description' content=''>\r\n"
				+ "    <meta name='viewport' content='width=device-width, initial-scale=1'>\r\n"
				+ "\r\n	   "
				+ "<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.15.3/css/all.css' integrity='sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk' crossorigin='anonymous'>"
				+ "<!-- JavaScript Bundle with Popper -->\r\n"
				+ "    <script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js' integrity='sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0' crossorigin='anonymous'></script>\r\n"
				+ "\r\n    "
				+ "    <!-- CSS only -->\r\n"
				+ "    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl' crossorigin='anonymous'>\r\n"
				+ "\r\n"
				+ "    <link href='./css/style.css' rel='stylesheet' />"
				+ "  </head>\r\n"
				+ "  <body>\r\n"
				+ "    <!--[if lt IE 7]>\r\n"
				+ "      <p class='browsehappy'>You are using an <strong>outdated</strong> browser. Please <a href='#'>upgrade your browser</a> to improve your experience.</p>\r\n"
				+ "    <![endif]-->\r\n"
				+ "    \r\n");
		out.print("<nav class='navbar navbar-expand-lg navbar-dark bg-dark'>");
			out.print("<div class='container-fluid ms-3'>");
				out.print("<a class='navbar-brand bg-light p-2 text-dark d-flex' href='#'>");
					out.print("<i class='fas fa-prescription'></i>&nbsp;"+ title);
				out.print("</a>");
				out.print("<div class='text-light flex-col me-2'>"
						+ "	<div>Machine: "+ machineId + "</div>"
						+ " <div>Floor: " + floorNum + "</div>"
						+ "</div>");
				out.print("<button class='navbar-toggler' type='button' data-bs-toggle='collapse' data-bs-target='#navbarNav' aria-controls='navbarNav' aria-expanded='false' aria-label='Toggle navigation'>\r\n"
						+ "      <span class='navbar-toggler-icon'></span>\r\n"
						+ "    </button>\r\n"
						+ "    <div class='collapse navbar-collapse' id='navbarNav'>\r\n"
						+ "      <ul class='navbar-nav'>\r\n"
						+ "        <li class='nav-item'>\r\n"
						+ "          <a class='nav-link active' aria-current='page' href='#'>Home</a>\r\n"
						+ "        </li>\r\n"
						+ "        <li class='nav-item'>\r\n"
						+ "          <a class='nav-link' href='#'>Log In</a>\r\n"
						+ "        </li>\r\n"
						+ "      </ul>"
						+ "    </div>");
				out.print("<form class='d-flex justify-content-end' action='home' method='post'>\r\n"
						+ "    <div class='form-floating me-4'>"
						+ "        <input class='form-control me-2' id='sTerm' name='sTerm' type='search' placeholder='Search for patient orders' aria-label='Search'>\r\n"
						+ "        <label for='sTerm'>Search for patient orders</label>"
						+ "    </div>"
						+ "    <button class='btn btn-outline-light me-3' type='submit'>Search</button>\r\n"
						+ "</form>");
			out.print("</div>");
		out.print("</nav>");
		out.print("<div class='bg-img'></div>");
		out.print("<div class='content-wrapper'>");
			out.print("<div class=''>");
			
			//Code in try/catch block will display all the patients on the floor where nurses can pull medication info from.
		
			try {
				Context initContext = new InitialContext();
				Context envContext = (Context) initContext.lookup("java:comp/env");
				DataSource ds = (DataSource) envContext.lookup("jdbc/ADS");
				Connection conn = ds.getConnection();
				
				Statement statement = conn.createStatement();
				String sql = "select * from ads.patient";
				ResultSet rs = statement.executeQuery(sql);
				ResultSetMetaData rsmd = rs.getMetaData();
				int colCount = rsmd.getColumnCount();

				while ( rs.next() ) {
					out.print("<i class='fas fa-procedures'></i>\r\n");
					for (int i = 1; i <= colCount; i++) {
						String attrName = rsmd.getColumnName(i);
						out.print("<td>\r\n");
						out.print( rs.getString(attrName) + "\r\n");
						out.print("</td>\r\n");
					}
					out.print("</tr>\r\n");
				}
				out.print("</table>\r\n");
				conn.close();
			}catch (SQLException | NamingException ex) {
				System.err.println(ex);
			}
		
		out.print("<script src='' async defer></script>\r\n"
				+ "\r\n"
				+ " 	</body>\r\n"
				+ "\r\n"
				+ "</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String searchParam = request.getParameter("sTerm");
		
		//TODO Write function that returns search results back to the page
	}

}
