package com.sangita.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sangita.bo.Doctor;

/**
 * Servlet implementation class getDoctorTimingController
 */
public class getDoctorTimingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getDoctorTimingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get the required attribute
		HttpSession session = request.getSession();
		List<Doctor> doctorList =(List<Doctor>)session.getAttribute("doctorList");
		
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
			
		
			
			
		
			for(Doctor d: doctorList){
				
				//Storing the timing logic
				//It will create new list for every doctor
				ArrayList<String> day_list = new ArrayList<String>();
				ArrayList<Integer> start_list = new ArrayList<Integer>();
				ArrayList<Integer> end_list = new ArrayList<Integer>();
				
				//fetching the id of the current doctor
				long id=d.getId();
				
				//sql query to fetch timings of current user
				String sql="select  * from  doctor_timing where doctor_id="+id+"" ;
				rs = stmt.executeQuery(sql);
				
				while(rs.next()){
					//store corresponding day, start and end time
					String day = rs.getString("day_name");
					Integer start_time = rs.getInt("start_time");
					Integer end_time = rs.getInt("end_time");
					
					//store this in arrayList
					day_list.add(day);
					start_list.add(start_time);
					end_list.add(end_time);	
				}
				
				//After storing all data of a current doctor
				//set the arrayList in current doctors object 
				d.setDayList(day_list);
				d.setStart_time(start_list);
				d.setEnd_time(end_list);
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
		
		/*if(doctorList != null){
			HttpSession session = request.getSession();
			session.setAttribute("doctorList", doctorList);
			response.sendRedirect("home.jsp");
		}else{
			errorCode.append("Unable to get doctor information..");
			response.sendRedirect("results.jsp?viewError=" + errorCode);
		}*/
		response.sendRedirect("viewAll.jsp");
		
	}
}
