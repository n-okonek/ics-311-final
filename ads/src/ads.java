

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
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out;
		out = response.getWriter();
		out.print("<html>");
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
						
			out.print("<table>");
				out.print("<tr>");
					for (int i = 1; i <= colCount; i++) {
						String colName = rsmd.getColumnName(i);
						out.print("<th>");
						out.print(colName);
						out.print("</th>");
					}
				out.print("</tr>");
			while (rs.next()) {
				out.print("<tr>");
				for (int i = 1; i <= colCount; i++) {
					String attrName = rsmd.getColumnName(i);
					out.print("<td>");
					out.print( rs.getString(attrName));
					out.print("</td>");
				}
				out.print("</tr>");
			}
			out.print("</table>");
			conn.close();
		}catch (SQLException | NamingException ex) {
			System.err.println(ex);
		}
		
		out.print("</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
