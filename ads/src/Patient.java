

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.json.simple.JSONObject;

/**
 * Servlet implementation class Patient
 */
@WebServlet("/Patient")
public class Patient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Patient() {
        super();        
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String firstName = request.getParameter("fName");
		String lastName = request.getParameter("lName");
		String patientName = firstName + " " + lastName;
		int bedNumber = Integer.parseInt(request.getParameter("bed"));
		
		//MOCK DATA INFO:
		String drugName = "DrugName1";
		String drugStrength = "10mg";
		String orderedDose = "1 pill twice daily";
		String doctorFirstName = "Don";
		String doctorLastName = "Corleon";
		String doctorName = doctorFirstName + " " + doctorLastName;
		int drawerNumber = 3;
		int qty = 10;
		String lastAuditFirstName = "Jay";
		String lastAuditLastName = "Hoover";
		String lastAuditBy = lastAuditFirstName + " " + lastAuditLastName;
		LocalDate today = LocalDate.now();
		DateTimeFormatter formatDate = DateTimeFormatter.ofPattern("E, MMM dd yyyy");
		String lastAuditDate = today.format(formatDate);
		//END MOCK DATA INFO
		
		//create the json object
		JSONObject obj = new JSONObject();
		obj.put("patient", patientName);
		obj.put("bed", bedNumber);
		obj.put("drug", drugName);
		obj.put("strength", drugStrength);
		obj.put("dose", orderedDose);
		obj.put("doctor", doctorName);
		obj.put("drawer", drawerNumber);
		obj.put("qty", qty);
		obj.put("lastAuditBy", lastAuditBy);
		obj.put("lastAuditDate", lastAuditDate);
		
		
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/ADS");
			Connection conn = ds.getConnection();
			
			Statement statement = conn.createStatement();
			//String sql = "select * from ads.order where ";
			
			//ResultSet rs = statement.executeQuery(sql);
			
			// put result code here...
			PrintWriter out = response.getWriter();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			out.print(obj);
			
			conn.close();
		}catch (SQLException | NamingException ex) {
			System.err.println(ex);
		}
		
	}

}
