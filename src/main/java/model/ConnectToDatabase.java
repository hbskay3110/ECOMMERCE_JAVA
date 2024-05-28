package model;


import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class ConnectToDatabase {
	String serverName  ="34.23.13.26";
	String dbName = "webbanhang";
	String portNumber = "3306";
	String cloudSql = "webbanhang-382203:us-east1:webbanhang";
	String socketFactory = "com.google.cloud.sql.mysql";

	/*USE BELOW METHOD FOR YOUR DATABASE CONNECTION FOR BOTH SINGLE AND MULTILPE SQL SERVER INSTANCE(s)*/
	/*DO NOT EDIT THE BELOW METHOD, YOU MUST USE ONLY THIS ONE FOR YOUR DATABASE CONNECTION*/
	public Connection getConnection()throws Exception {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://"+serverName+":"+portNumber+"/"+dbName;
			String user = "root";
			String pass = "123456789";
			return  DriverManager.getConnection(url,user,pass);

		} catch (ClassNotFoundException e) {
			System.out.println("Error");
			e.printStackTrace();
		}
		return null;
	}
	//      public String getImagePath() throws Exception {
//        return "image/";
//    }
	/*Insert your other code right after this comment*/
	/*Change/update information of your database connection, DO NOT change name of instance variables in this class*/
	public static void main(String[] args) throws Exception {
		ConnectToDatabase  c = new ConnectToDatabase();
		System.out.println(c.getConnection());
	}
	public  void excuteSql(String sql) throws Exception{
		Connection connect =getConnection();
		Statement stmt =  connect.createStatement();
		stmt.executeUpdate(sql);
	}
}
 