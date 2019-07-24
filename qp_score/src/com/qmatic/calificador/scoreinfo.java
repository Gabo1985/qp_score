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

import com.google.gson.Gson;
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

@Path("/consultas")
//@WebServlet("/consulta1")
public class scoreinfo {

	@GET
	@Path("/listaMarcas")
	public String getPlain1() {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {

			String id_marca;
			String nombre_marca;
			String id_tipo_marca;
			String fecha_creacion;
			String estado;
			String opcion_pregunta;

			con = conexionDB.getConnection();
			stmt = con.createStatement();

			rs = stmt.executeQuery("select id_marca,nombre_marca,id_tipo_marca,fecha_creacion,opcion_pregunta,estado from qp_marca");

			String result = "";

			result += "[";
			while (rs.next()) {

				id_marca = rs.getString(1);
				nombre_marca = rs.getString(2);
				id_tipo_marca = rs.getString(3);
				fecha_creacion = rs.getString(4);
				opcion_pregunta= rs.getString(5);
				estado = rs.getString(6);

				result += "{";

				result += "\"id_marca\":";

				result += "\"" + id_marca + "\",";

				result += "\"nombre_marca\":";
				result += "\"" + nombre_marca + "\",";

				result += "\"id_tipo_marca\":";

				result += "\"" + id_tipo_marca + "\",";

				result += "\"fecha_creacion\":";
				result += "\"" + fecha_creacion + "\",";

				result += "\"opcion_pregunta\":";
				result += "\"" + opcion_pregunta + "\",";

				result += "\"estado\":";
				result += "\"" + estado + "\"";

				result += "}";

				result += ",";
			}
			result = result.substring(0, result.length() - 1);
			result += "]";

			return result;

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;

	}
}
