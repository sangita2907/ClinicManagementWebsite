package com.sangita.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteDoctorTimingController
 */
public class DeleteDoctorTimingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteDoctorTimingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//fetch required parameters
		String  d_idStr= request.getParameter("d_id");
		String dayName = request.getParameter("dayName");
		
		//parse required parameters
		Long d_id = Long.parseLong(d_idStr);
		
		//Create variables for error code and message
		StringBuilder errorCode = new StringBuilder();
		String deleteMsg="";
		int result = 0;
		
		//deletion logic in the database
		
		Connection con = null;
		PreparedStatement pstmt  =null;
		

		//declare required type 
		String dbuser="system";
		String dbpassword="root";
		String url  = "jdbc:oracle:thin:@localhost:1521:XE";	

		try{
			//establish database connection
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con  = DriverManager.getConnection(url,dbuser,dbpassword);

			String sql="delete from doctor_timing where doctor_id=? and day_name=?" ; 
			pstmt  = con.prepareStatement(sql);
			
			//set the data
			pstmt.setLong(1, d_id);
			pstmt.setString(2, dayName);

			result  = pstmt.executeUpdate();
		   
		}catch(ClassNotFoundException e){
		  errorCode.append("Driver Not Loaded....." + e.getMessage()+"</h1>");
		}catch(SQLException e){
		  errorCode.append("DB ERROR : " +e.getMessage()+"</h1>");
		  e.printStackTrace();
		}catch(Exception e){
		  errorCode.append("Other ERROR " + e.getMessage()+"</h1>");
		}finally{
		    //release resource
		     if(con!=null){
		    	try{
		    		con.close();  
		    	}catch(SQLException e){
					errorCode.append("DB Con CLosing ERROR : "+ e.getMessage());
		    	}
			 }
		}
		
		
		if(result ==1){
		     deleteMsg = " Time slot deleted Successfuly... ";
		     response.sendRedirect("results.jsp?deleteTimingMessage=" + deleteMsg);
		}else{
			deleteMsg = " Record  Not Deleted ";
			response.sendRedirect("DeleteDoctorTimingForm.jsp?d_id="+d_id+"&deleteTimingError=" + errorCode +"Unable to delete..<br />Please fill the form properly..");
		}
	}
}
