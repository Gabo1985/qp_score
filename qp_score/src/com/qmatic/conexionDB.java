package com.qmatic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conexionDB {

	// TODO Auto-generated method stub
	  //String connectionUrl = "jdbc:sqlserver://<server>:<port>;databaseName=AdventureWorks;user=<user>;password=<password>";
	private static String url = "jdbc:sqlserver://localhost:1433;databaseName=qp_calificacionbd";
	private static String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static String username = "qp_calificacion";
	private static String password = "qp_calificacion";
	private static Connection con;


	public static Connection getConnection() {
		try {
			Class.forName(driverName);
			try {
				con = DriverManager.getConnection(url, username, password);
			} catch (SQLException ex) {

				System.out.println("Error en conectarse a la base");
			}
		} catch (ClassNotFoundException ex) {

			System.out.println("No hay driver.");
		}
		
		return con;
	}

}
