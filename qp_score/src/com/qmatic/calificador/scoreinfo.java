package com.qmatic.calificador;

import java.io.*;
import java.nio.charset.StandardCharsets;
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
import static java.nio.charset.StandardCharsets.*;

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
	
	//------------------------------------------------------------------------------------------------------------
	
	@GET
	@Path("/listaEncuesta")
	public String getPlain2() {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {

			String id_marca;
			String nombre_marca;
			String opcion_pregunta;
			String id_encuesta;
			String pregunta_encuesta;
			String id_marca_opcion_1;
			String id_marca_opcion_2;
			String id_marca_opcion_3;
			String id_marca_opcion_4;
			String id_marca_opcion_5;
			String estado;

			con = conexionDB.getConnection();
			stmt = con.createStatement();

			rs = stmt.executeQuery("SELECT qp_marca.id_marca,qp_marca.nombre_marca,qp_marca.opcion_pregunta,qp_encuesta.id_encuesta, qp_encuesta.pregunta_encuesta,"+
									"qp_encuesta.id_marca_opcion_1,qp_encuesta.id_marca_opcion_2,qp_encuesta.id_marca_opcion_3,qp_encuesta.id_marca_opcion_4"+
									",qp_encuesta.id_marca_opcion_5,qp_encuesta.estado FROM qp_encuesta INNER JOIN qp_marca ON qp_encuesta.id_encuesta = qp_marca.id_pregunta;");

			String result = "";

			result += "[";
			while (rs.next()) {

				id_marca = rs.getString(1);
				nombre_marca = rs.getString(2);
				opcion_pregunta = rs.getString(3);
				id_encuesta = rs.getString(4);
				pregunta_encuesta= rs.getString(5);
				//byte [] b = pregunta_encuesta.getBytes(StandardCharsets.UTF_8);
				//pregunta_encuesta=new String(b);
				id_marca_opcion_1 = rs.getString(6);
				id_marca_opcion_2 = rs.getString(7);
				id_marca_opcion_3 = rs.getString(8);
				id_marca_opcion_4 = rs.getString(9);
				id_marca_opcion_5 = rs.getString(10);
				estado = rs.getString(11);

				result += "{";

				result += "\"id_marca\":";

				result += "\"" + id_marca + "\",";

				result += "\"nombre_marca\":";
				result += "\"" + nombre_marca + "\",";

				result += "\"opcion_pregunta\":";
				result += "\"" + opcion_pregunta + "\",";

				result += "\"id_encuesta\":";
				result += "\"" + id_encuesta + "\",";

				result += "\"pregunta_encuesta\":";
				result += "\"" + pregunta_encuesta + "\",";

				result += "\"id_marca_opcion_1\":";
				result += "\"" + id_marca_opcion_1 + "\",";

				result += "\"id_marca_opcion_2\":";
				result += "\"" + id_marca_opcion_2 + "\",";

				result += "\"id_marca_opcion_3\":";
				result += "\"" + id_marca_opcion_3 + "\",";

				result += "\"id_marca_opcion_4\":";
				result += "\"" + id_marca_opcion_4 + "\",";

				result += "\"id_marca_opcion_5\":";
				result += "\"" + id_marca_opcion_5 + "\",";

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
