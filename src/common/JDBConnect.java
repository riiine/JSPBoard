package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBConnect {
    public Connection con;
    public Statement stmt;
    public PreparedStatement psmt;
    public ResultSet rs;
    
    public JDBConnect() {
    	try {
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		String url = "jdbc:oracle:thin:@localhost:1521:xe";
    		String id = "musthave";
    		String pwd = "1234";
    		con = DriverManager.getConnection(url,id,pwd);
    		System.out.println("DB연결성공");
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    }
    
    public JDBConnect(String driver, String url, String id, String pwd) {
    	try {
    		// JDBC 드라이버 로드
    		Class.forName(driver);
    		
    		// DB에 연결
    		con = DriverManager.getConnection(url,id,pwd);
    		
    		System.out.println("DB연결성공(인수 생성자 1)");
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    }
    
    public JDBConnect(ServletContext application) {
    	try {
    		// JDBC 드라이버 로드
    		String driver = application.getInitParameter("OracleDriver");
    		Class.forName(driver);
    		
    		// DB에 연결
    		String url = application.getInitParameter("OracleURL");
    		String id = application.getInitParameter("OracleId");
    		String pwd = application.getInitParameter("OraclePwd");
    		con = DriverManager.getConnection(url, id, pwd);
    		
    		System.out.println("DB 연결 성공(인수 생성자 2)");
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    }
    
    public void close() {
    	try {
    		if(rs!=null) rs.close();
    		if(stmt!=null) stmt.close();
    		if(psmt!=null) psmt.close();
    		System.out.println("자원해제");		
    	}catch(Exception e) {
    	    e.printStackTrace();	
    	}
    	
    }
    
}