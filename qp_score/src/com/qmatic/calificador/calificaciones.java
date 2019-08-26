package com.qmatic.calificador;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qmatic.conexionDB;

/**
 * Servlet implementation class calificaciones
 */
@WebServlet("/calificaciones")

public class calificaciones extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public calificaciones() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			con = conexionDB.getConnection();
			// System.out.println("exito");
			stmt = con.createStatement();
			
			
			SimpleDateFormat f = new SimpleDateFormat("ddMMyyyy");
			int fecha_creacion = Integer.parseInt(f.format(new Date()));;
			
			Calendar calendario = new GregorianCalendar();
			int hora =calendario.get(Calendar.HOUR_OF_DAY);
			hora=hora*60;
			int minutos = calendario.get(Calendar.MINUTE);

			int hora_creacion = hora+minutos;
			int id_marca_encuesta = 0;
			
			// DATOS DE HTML CALIFICACION
			int id_marca = Integer.parseInt(request.getParameter("ValCal"));
			int rquestion = Integer.parseInt(request.getParameter("rquestion"));
			int rbtrespuesta1 = Integer.parseInt(request.getParameter("rbtrespuesta1"));
			int rbtrespuesta2 = Integer.parseInt(request.getParameter("rbtrespuesta2"));
			int rbtrespuesta3 = Integer.parseInt(request.getParameter("rbtrespuesta3"));
			int rbtrespuesta4 = Integer.parseInt(request.getParameter("rbtrespuesta4"));
			int rbtrespuesta5 = Integer.parseInt(request.getParameter("rbtrespuesta5"));
			 if(rbtrespuesta1 > 0)
			 {
				 id_marca_encuesta= Integer.parseInt(request.getParameter("rbtrespuesta1"));
			 }
			 else
				 if(rbtrespuesta2 > 0)
				 {
					 id_marca_encuesta= Integer.parseInt(request.getParameter("rbtrespuesta2"));
				 } 
				 else
					 if(rbtrespuesta3 > 0)
					 {
						 id_marca_encuesta= Integer.parseInt(request.getParameter("rbtrespuesta3"));
					 }
					 else
						 if(rbtrespuesta4 > 0)
						 {
							 id_marca_encuesta= Integer.parseInt(request.getParameter("rbtrespuesta4"));
						 }
						 else
							 if(rbtrespuesta5 > 0)
							 {
								 id_marca_encuesta= Integer.parseInt(request.getParameter("rbtrespuesta5"));
							 }
			 

			
			stmt.executeUpdate("INSERT INTO [dbo].[qp_score]([id_marca],[id_encuesta],[id_marca_encuesta],[fecha_creacion],[hora_creacion]) VALUES('" + id_marca+ "','" + rquestion+ "','" +id_marca_encuesta +"','" + fecha_creacion+ "','" +  hora_creacion+"')");
			response.sendRedirect("index.html");
			//para los GET
			//rs = stmt.executeQuery("select * from dbo.calificaciones  where id = ");
			//rs = stmt.executeQuery("select * from dbo.qp_encuesta  where modulo ='1' and estado = '0'");
			//if (rs.next()) {
			 //   do {
			 //   	response.getWriter().append("0");
			 //   } while(rs.next());
			//} else {
				//stmt.executeUpdate("INSERT INTO qp_marca (nombre_marca,ruta_objeto_marca,id_tipo_marca,fecha_creacion,hora_creacion,estado) VALUES ('" + nombre_marca+ "','" + ruta_objeto_marca+ "','" + id_tipo_marca+ "','" + fecha_creacion+ "','" + hora_creacion+ "','" + estado+"')");
				
			//	response.getWriter().append("1");
			//}
			//para los POST

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			response.sendRedirect("error.html");
			e.printStackTrace();
			//System.out.println("{Error ["+e.getErrorCode()+"]} : "+e.getMessage().toString());
		}
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
