

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
		
		out.print("<!DOCTYPE html>\r\n"
				+ "<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\r\n"
				+ "<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\r\n"
				+ "<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\r\n"
				+ "<!--[if gt IE 8]>      <html class=\"no-js\"> <!--<![endif]-->\r\n"
				+ "<html>\r\n"
				+ "  <head>\r\n"
				+ "    <meta charset=\"utf-8\">\r\n"
				+ "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n"
				+ "    <title></title>\r\n"
				+ "    <meta name=\"description\" content=\"\">\r\n"
				+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n"
				+ "\r\n	   "
				+ "<!-- JavaScript Bundle with Popper -->\r\n"
				+ "    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0\" crossorigin=\"anonymous\"></script>\r\n"
				+ "\r\n    "
				+ "    <!-- CSS only -->\r\n"
				+ "    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl\" crossorigin=\"anonymous\">\r\n"
				+ "\r\n"
				+ "  </head>\r\n"
				+ "  <body>\r\n"
				+ "    <!--[if lt IE 7]>\r\n"
				+ "      <p class=\"browsehappy\">You are using an <strong>outdated</strong> browser. Please <a href=\"#\">upgrade your browser</a> to improve your experience.</p>\r\n"
				+ "    <![endif]-->\r\n"
				+ "    \r\n");
		out.print("<header>[REPLACE ME WITH A PROPERTY]</header>");

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
						
			out.print("<table>\r\n");
				out.print("<tr>\r\n");
					for (int i = 1; i <= colCount; i++) {
						String colName = rsmd.getColumnName(i);
						out.print("<th>");
						out.print(colName);
						out.print("</th>\r\n");
					}
				out.print("</tr>\r\n");
			while ( rs.next() ) {
				out.print("<tr>\r\n");
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
		
		out.print("<script src=\"\" async defer></script>\r\n"
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
	}

}
