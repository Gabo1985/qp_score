package com.qmatic.calificador;
import java.awt.PageAttributes.MediaType;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.xml.ws.Response;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.qmatic.conexionDB;



@Path("/consultas")
public class scoreinfo {
	
	
	private Connection con = null;
	private Statement stmt = null;
	
	//-----------------------------------------------------------------------------
	
		@GET
		@Path("/listamarcas")
		public String getPlain() {

			String login_user = "sa";
			String login_password = "123";
			String url = "jdbc:sqlserver://localhost:1433;databaseName=qp_calificacionbd";
			Connection con = null;
			
			try {
					//con = conexionDB.getConnection();
					//stmt = con.createStatement();
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				Connection conn = DriverManager.getConnection(url, login_user,login_password);
				System.out.println("connected");
				
				String id_marca;
				String nombre_marca;
				String id_tipo_marca;
				String fecha_creacion;
				String estado;
				
				Statement stmt = conn.createStatement();
				
				ResultSet rs = stmt.executeQuery("select id_marca,nombre_marca,id_tipo_marca,fecha_creacion,estado from qp_marca");
				
				String result = "";
				
				
				result+= "[";
				while (rs.next()) {
				
					 id_marca = rs.getString(1);
					 nombre_marca = rs.getString(2);
					 id_tipo_marca = rs.getString(3);
					 fecha_creacion = rs.getString(4);
					 estado = rs.getString(5);
					
					result += "{";
					
					result += "\"id_marca\":";

					result += "\"" + id_marca + "\",";

					result += "\"nombre_marca\":";
					result += "\"" + nombre_marca + "\",";

					result += "\"id_tipo_marca\":";

					result += "\"" + id_tipo_marca + "\",";

					result += "\"fecha_creacion\":";
					result += "\"" + fecha_creacion + "\",";
					
					result += "\"estado\":";
					result += "\"" + estado + "\"";
					
					result += "}";

					result += ",";
				}
				result = result.substring(0, result.length() - 1);
				result += "]";
				
				
				return result;

			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;

		}
		
		//---------------------------------------------------------------------------------
		
}
