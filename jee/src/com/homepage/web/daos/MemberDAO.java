package com.homepage.web.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.homepage.web.beans.MemberBean;
import com.hompage.web.util.DBmanager;

public class MemberDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
    Statement stmt = null;
    ResultSet rs = null;
    String sql = "";
    
	
	/* 
	 * 지금 보시는 내용이 싱글톤 + DBCP 정석입니다.
	 * 다만, 이것만 해서는 단위별 서버 실행에서
	 * DB접속이 안됩니다.
	 * 그래서 DBmanager 를 만들었고
	 * 당분간은 DBmanager 를 사용하다가
	 * 프로젝트가 완성되면 철거하는 방식으로 하겠습니다.
	*/
	private static MemberDAO memberDAO = new MemberDAO();
	private MemberDAO() {
		// 단위 테스트가 끝나고 프로젝트가 완성되면 걷어 낼 부분
		conn = DBmanager.getConnection();
	} 
	public static MemberDAO getInstance(){
		return memberDAO;
	}
	// 현재는 작동하지 않지만 위 DBmaneger 를 걷어내는 순간
	// 작동함. 미리 설정함.
	public Connection getConnection() throws Exception{
		Connection conn = null;
		Context initContext = new InitialContext();
		Context envContext  = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
		conn = ds.getConnection();
		return conn;
	}
	public List<MemberBean> getList(){
		List<MemberBean> list = new ArrayList<MemberBean>();
		try{
			stmt = conn.createStatement();
			sql = "select * from member";
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				MemberBean bean = new MemberBean();  // 맨위에 올리면 같은 값만 출력 함
				bean.setId(rs.getString("MEMBERID"));
				bean.setAge(rs.getString("AGE"));
				bean.setPassword(rs.getString("PASSWORD"));
				bean.setName(rs.getString("NAME"));
				bean.setEmail(rs.getString("EMAIL"));
				
				list.add(bean);
			}
		}catch (SQLException e) {
			   e.printStackTrace();
			   
		  }finally {
		   try {
		    rs.close();
		    stmt.close();
		    conn.close();
		   } catch (SQLException e) {
		    // 트로우 말고 트라이캐치를 주고 stmt, conn을 똑같은 위치에 잘라내기 해주었다
		    e.printStackTrace();
		   }
		  }
		return list;
	}
	public int join(MemberBean bean) {
		int result = 0;
		sql = "insert into member (MEMBERID, PASSWORD, NAME, EMAIL, AGE)"+
				"values(?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getId()); // 여기서 1은 맨처음 ? 를 가리킨다
			pstmt.setString(2, bean.getPassword());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getEmail());
			pstmt.setString(5, bean.getAge());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("MemberDAO-join()에서 에러발생");
		}
		return result;
	}
}
