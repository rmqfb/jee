package com.hompage.web.util;
 
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
// sql import
 
import oracle.jdbc.OracleDriver;
// 드라이버 들어가는거는 옛날거라고 함
 
public class JdbcTest {
    public static void main(String[] args) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String user = "system";
        String pass = "oracle";
        String memberId="", password="", name="", email="", address="";
        
        OracleDriver od = new OracleDriver();
        Properties info = new Properties();
        
        
        info.put("user", user);
        info.put("password", pass);
        
        try {
            conn = od.connect(url,info);
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from member");
            
            while (rs.next()) {
                memberId = rs.getString("ID");
                password = rs.getString("PASS");
                name = rs.getString("NAME");
                email = rs.getString("EMAIL");
                address = rs.getString("ADDRESS");
                
                System.out.print(memberId+"\t");
                System.out.print(password+"\t");
                System.out.print(name+"\t");
                System.out.print(email+"\t");
                System.out.print(address+"\t");
                System.out.println();
            }
        }catch (SQLException e) {
            e.printStackTrace();
            
        }finally {
            
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        
        }
        
    }
}