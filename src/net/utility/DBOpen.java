package net.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBOpen { //데이터베이스 연결
  
  public Connection getConnection() {
    //1) Oracle DB 정보------------------------------
    String url      = "jdbc:oracle:thin:@localhost:1521:xe";
    String user     = "java1113";
    String password = "1234";
    String driver   = "oracle.jdbc.driver.OracleDriver";

    //2) MySQL DB 정보-------------------------------
    /*
    String url      = "jdbc:mysql://localhost:3306/soldesk?useUnicode=true&characterEncoding=utf8";
    String user     = "root";
    String password = "1234";
    String driver   = "org.gjt.mm.mysql.Driver"; 
    */
    
    Connection con = null;
    
    try {

        Class.forName(driver);
        con = DriverManager.getConnection(url, user, password);

    }catch (Exception e) {
        System.out.println("DB연결 실패 : " + e);
    }//try end   
    
    return con;
    
  }//end

}//class end
