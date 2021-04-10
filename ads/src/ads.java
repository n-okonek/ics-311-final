import java.io.IOException;
import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.ResultSet;
//import java.sql.ResultSetMetaData;
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
		
		//Start HTML document header
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
				+ "<script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js\" integrity=\"sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==\" crossorigin=\"anonymous\"></script>"
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
		//end HTML document header
		//Start Navigation panel header
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
				//start search form
				out.print("<form class='d-flex justify-content-end' action='home' method='post'>\r\n"
						+ "    <div class='form-floating me-4'>"
						+ "        <input class='form-control me-2' id='sTerm' name='sTerm' type='search' placeholder='Search for patient orders' aria-label='Search'>\r\n"
						+ "        <label for='sTerm'>Search for patient orders</label>"
						+ "    </div>"
						+ "    <button class='btn btn-outline-light me-3' type='submit'>Search</button>\r\n"
						+ "</form>");
				//end search form
			out.print("</div>");
		out.print("</nav>");
		//end navigation panel header
		// background image panel
		out.print("<div class='bg-img'></div>");
		//begin content
		out.print("<div class='content-wrapper'>");
			//start beds panel - this panel will hold the patient beds and names of patients in beds
			out.print("<div class='bed-content'>");
			
			//Code in try/catch block will display all the patients on the floor where nurses can pull medication info from.
		
			try {
				Context initContext = new InitialContext();
				Context envContext = (Context) initContext.lookup("java:comp/env");
				DataSource ds = (DataSource) envContext.lookup("jdbc/ADS");
				Connection conn = ds.getConnection();
				
				Statement statement = conn.createStatement();
				
				//TODO: SQL needs to be written to pull patient names and their given beds on the given floor from floorNum
				String sql = "select * from ads.patient where building_floor = " + floorNum;
				ResultSet rs = statement.executeQuery(sql); //This pulls the result set
				
				//ResultSetMetaData rsmd = rs.getMetaData(); //This pulls metadata from the table (i.e. column names, etc)
				//int colCount = rsmd.getColumnCount(); // gets the number of columns in the result set, not used in its current form

				while ( rs.next() ) {
					out.print("<div class='bed-wrapper btn'>");
						out.print("<div class='bed'>");
							out.print("<i class='fas fa-procedures'></i>\r\n");
							out.print("<div class='bed-number'>");
								out.print(rs.getString("bed"));
							out.print("</div>");
							String patientName = rs.getString("fname") + " " + rs.getString("lname");
							out.print("<div class='p-name'>" + patientName + "</div>");
						out.print("</div>");
					out.print("</div>");
					}
				
				conn.close();
			}catch (SQLException | NamingException ex) {
				System.err.println(ex);
			}
		
			out.print("</div>");
			// end bed panel
			// start medication info panel
			out.print("<div class='med-info'></div>");

			//Javascript template for med-info panel
			out.print("<script type='text/html' id='med-info-template'>"
					+ "<div class='close'><i class='far fa-window-close'></i></div>"
					+ "<div class='med-info-header'></div>"
					+ "	<div class='order-info'>"
					+ "		<div class='order-num'></div>"
					+ "		<div class='drug-info'>"
					+ "			<div class='drug-name'></div>"
					+ "			<div class='drug-strength'></div>"
					+ "			<div class='drug-dose'></div>"
					+ "			<div class='doctor'></div>"
					+ "		</div>"
					+ "		<div class='inventory-info'>"
					+ "			<div class='drawer'></div>"
					+ "			<div class='qty'></div>"
					+ "			<div class='audit-by'></div>"
					+ "			<div class='last-audited'></div>"
					+ "		</div>"
					+ "	</div>"
					+ "</script>");
			//end medication info panel
			
		out.print("<script src='./js/site.js' ></script>\r\n"
				+ "</body>\r\n"
				+ "</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		//TODO Write function that returns search results back to the page
	}

}
