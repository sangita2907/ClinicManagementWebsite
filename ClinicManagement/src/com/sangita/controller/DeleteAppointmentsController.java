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
 * Servlet implementation class DeleteAppointmentsController
 */
public class DeleteAppointmentsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAppointmentsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		StringBuilder errorCode = new StringBuilder();
		String deleteMsg="";
		String  idStr= request.getParameter("a_id");

		long id  = Long.parseLong(idStr);
		
		Connection con = null;
		PreparedStatement pstmt  =null;
		int result = 0;

		//declare required type 
		String dbuser="system";
		String dbpassword="root";
		String url  = "jdbc:oracle:thin:@localhost:1521:XE";	

		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con  = DriverManager.getConnection(url,dbuser,dbpassword);

			String sql="delete from clinic_appointment where id=?" ; 
			pstmt  = con.prepareStatement(sql);
			//set 
			pstmt.setLong(1, id);

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
		     deleteMsg = "Appointment canceled Successfully ";
		     request.setAttribute("appointmentCancelMsg", deleteMsg);
		     request.getRequestDispatcher("results.jsp").forward(request, response);
		}else{
			deleteMsg = "Unable to canceled appointment ";
			 request.setAttribute("appointmentCancelMsg", deleteMsg);
		     request.getRequestDispatcher("showAppointment.jsp").forward(request, response);
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
