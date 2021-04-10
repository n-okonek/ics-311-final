

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.json.simple.JSONArray;
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
		int floorNum = Integer.parseInt(request.getParameter("floor"));
		
		//MOCK DATA INFO:
		String drugName = "DrugName1";
		String drugStrength = "10mg";
		String orderedDose = "1 pill twice daily";
		String doctorFirstName = "Don";
		String doctorLastName = "Corleon";
		//String doctorName = doctorFirstName + " " + doctorLastName;
		int drawerNumber = 3;
		int qty = 10;
		String lastAuditFirstName = "Jay";
		String lastAuditLastName = "Hoover";
		int orderId = 3;
		//String lastAuditBy = lastAuditFirstName + " " + lastAuditLastName;
		LocalDate today = LocalDate.now();
		DateTimeFormatter formatDate = DateTimeFormatter.ofPattern("E, MMM dd yyyy");
		String lastAuditDate = today.format(formatDate);
		//END MOCK DATA INFO
		
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/ADS");
			Connection conn = ds.getConnection();
			
			String sql = "SELECT ads.medication.name as medication,"
					+ "		    ads.medication.strength as med_strength,"
					+ "			ads.order.id as orderID,"
					+ "		    ads.order.dosage as med_dosage,"
					+ "		    ads.inventory.drawer as drawer_location,"
					+ "		    ads.inventory.qty as drawer_qty,"
					+ "		    ads.user.fname as last_audit_fname,"
					+ "		    ads.user.lname as last_audit_lname,"
					+ "		    ads.inventory.audit_date as last_audit,"
					+ "		    ads.doctor.fname as doctor_fname,"
					+ "		    ads.doctor.lname as doctor_lname"
					+ "		FROM ads.patient"
					+ "		JOIN ads.order ON ads.patient.id = ads.order.patient"
					+ "		JOIN ads.doctor ON ads.order.doctor = ads.doctor.id"
					+ "		JOIN ads.medication ON ads.order.medication = ads.medication.id"
					+ "		JOIN ads.inventory on ads.medication.id = ads.inventory.medication"
					+ "		JOIN ads.user on ads.inventory.last_audited_by = ads.user.id"
					+ "		WHERE building_floor =" + floorNum 
					+ " 		AND ads.patient.bed = " + bedNumber
					+ "			AND ads.order.status = 1;";

			Statement statement = conn.createStatement();
			
			ResultSet rs = statement.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();

			//create the JSON object
			JSONObject patientInfo = new JSONObject();
			JSONArray orderInfo = new JSONArray();
			JSONObject order = new JSONObject();
			JSONObject inventoryInfo = new JSONObject();
			JSONObject data = new JSONObject();
			
			patientInfo.put("name", patientName);
			patientInfo.put("bed", bedNumber);
			
			data.put("patient", patientInfo);
						
			while (rs.next() ) {
				order.put("orderId", rs.getString("orderID"));
				order.put("drug", rs.getString("medication"));
				order.put("strength", rs.getString("med_strength"));
				order.put("dose", rs.getString("med_dosage"));
				
				String doctorName = rs.getString("doctor_fname") + " " + rs.getString("doctor_lname");
				order.put("doctor", doctorName);
				
				inventoryInfo.put("drawer", rs.getInt("drawer_location"));
				inventoryInfo.put("qty", rs.getInt("drawer_qty"));
				String lastAuditBy = rs.getString("last_audit_fname") + " " + rs.getString("last_audit_lname");
				inventoryInfo.put("lastAuditBy", lastAuditBy);
				inventoryInfo.put("lastAuditDate", rs.getString("last_audit"));
				
				order.put("inventory", inventoryInfo);
				
				orderInfo.add(order);
			}
			
			data.put("orders", orderInfo);
			
			
			// put result code here...
			PrintWriter out = response.getWriter();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			out.print(data);
			
			conn.close();
		}catch (SQLException | NamingException ex) {
			System.err.println(ex);
		}
		
	}

}
