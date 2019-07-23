package com.qmatic.calificador;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
			

			int fecha_creacion = 1072019;
			int hora_creacion = 230;
			int id_encuesta = 2;
			int id_marca = Integer.parseInt(request.getParameter("ValCal"));
			int id_marca2=0;
			//String parametro = request.getParameter("ValCal");
			
			if(request.getParameter("EXCELENTE") != null)
			{
				id_marca2= Integer.parseInt(request.getParameter("EXCELENTE"));
			}else
				if(request.getParameter("MUY_BUENO") != null)
				{
					id_marca2= Integer.parseInt(request.getParameter("MUY_BUENO"));
				}else
					if(request.getParameter("BUENO") != null)
					{
						id_marca2= Integer.parseInt(request.getParameter("BUENO"));
					}else
						if(request.getParameter("REGULAR") != null)
						{
							id_marca2= Integer.parseInt(request.getParameter("REGULAR"));
						}else
							if(request.getParameter("MALO") != null)
							{
								id_marca2= Integer.parseInt(request.getParameter("MALO"));
							}
			
			
			stmt.executeUpdate("INSERT INTO [dbo].[qp_score]([id_marca],[id_encuesta],[fecha_creacion],[hora_creacion]) VALUES('" + id_marca+ "','" + id_encuesta+ "','" + fecha_creacion+ "','" +  hora_creacion+"')");
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
