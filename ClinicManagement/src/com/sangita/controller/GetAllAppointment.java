package com.sangita.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sangita.bo.Appointment;


/**
 * Servlet implementation class GetAllAppointment
 */
public class GetAllAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAllAppointment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//list to store all Appointment info
		List<Appointment> list = new ArrayList<Appointment>();
				
		// to store the error messages
		StringBuilder errorCode = new StringBuilder();
				
		//validate database
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
				
		//Declared required types
		String user = "system";
		String password = "root";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
				
		try{
			//Establish database Connection
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
			stmt = con.createStatement();
					
			String sql = "Select * from clinic_appointment";
			rs = stmt.executeQuery(sql);
					
			while(rs.next()){
				long id = rs.getLong("id");
				String name = rs.getString("name");
				String gender = rs.getString("gender");
				int age = rs.getInt("age");
				long phone = rs.getLong("phoneNumber");
				long userId = rs.getLong("userID");
				long doctorId = rs.getLong("doctorID");
				Date date = rs.getDate("appointment_date");
				String symptoms = rs.getString("symptoms");
				String status = rs.getString("status");
						
				//create Appointment object
				Appointment app = new Appointment();
						
				//fill data
				app.setId(id);
				app.setName(name);
				app.setGender(gender);
				app.setAge(age);
				app.setPhone(phone);
				app.setUserId(userId);
				app.setDoctorId(doctorId);
				app.setDate(date);
				app.setSymptoms(symptoms);
				app.setStatus(status);
				
						
						
				//add doctor into the list
				list.add(app);	
						
			}
					
		}catch(ClassNotFoundException e){
			errorCode.append("Driver not found.." + e.getMessage());
		}catch(SQLException e){
			errorCode.append("Database Error.." + e.getMessage());
			e.printStackTrace();
		}catch(Exception e){
			errorCode.append("Other error.."  + e.getMessage());
		}finally{
			//release resources
			if(con != null){
				try{
					con.close();
				}catch(SQLException e){
					errorCode.append("Database Connection error.." + e.getMessage());
				}
			}
					
		}
				
		//add attributes for presentation or view
		HttpSession session = request.getSession();
		session.setAttribute("appointment_list", list);
		request.setAttribute("errorCode", errorCode.toString());
				
		request.getRequestDispatcher("showAppointment.jsp").forward(request, response);
				
	}
}
