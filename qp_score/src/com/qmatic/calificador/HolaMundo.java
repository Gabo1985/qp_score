package com.qmatic.calificador;

import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.xml.ws.Response;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.qmatic.conexionDB;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import com.qmatic.conexionDB;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@WebServlet("/HolaMundo")
//@WebServlet("/consulta1")
public class HolaMundo{
	
	 @GET
	    @Path("/saludo")
	    @Produces(MediaType.TEXT_PLAIN)
	    public String holaMundo()
	    {
	        String saludo = "Hola Mundo!!!";        
	        return saludo;  
	    }
	 
	/*private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	
	//-----------------------------------------------------------------------------

	@GET
	@Path("/listamarcas")
	public String info() 
	{
		return "hola";
	}
		/*public String getPlain() {

			try {
				
				String id_marca;
				String nombre_marca;
				String id_tipo_marca;
				String fecha_creacion;
				String estado;
				
				con = conexionDB.getConnection();
				stmt = con.createStatement();
				
				rs = stmt.executeQuery("select id_marca,nombre_marca,id_tipo_marca,fecha_creacion,estado from qp_marca");
				
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

		}*/
		
		
		
		
		//---------------------------------------------------------------------------------

}
