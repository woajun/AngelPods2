package com.angelPods.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.angelPods.dto.MImgDto;

public class MImgDao {

	DataSource dataSource;
	
	private static MImgDao instance = new MImgDao();
	
	private MImgDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/mysql");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public static MImgDao getInstance() {
		return instance;
	}
	
	public int add(String imageSystemName, String imageName, String userId) {
		int ri = -1;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String query ="insert into MIMAGES(IMAGESYSTEMNAME, IMAGENAME, USERID) values (?,?,?)";
		
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, imageSystemName);
			pstmt.setString(2, imageName);
			pstmt.setString(3, userId);
			ri = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	

	public int delete(String userId) {
		// TODO Auto-generated method stub
		int ri = -1;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = dataSource.getConnection();
			String query = "DELETE FROM MIMAGES WHERE userId like ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.executeUpdate();
			ri = 1;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return ri;
	}

	public MImgDto get(String userId) {
		// TODO Auto-generated method stub
		MImgDto dto = new MImgDto();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = dataSource.getConnection();
			String query = "select * FROM MIMAGES WHERE userId like ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String a = rs.getString("imageSystemName");
				System.out.println(a);
				dto.setImageSystemName(rs.getString("imageSystemName"));
				dto.setImageName(rs.getString("imageName"));
				dto.setUserId(userId);
				return dto;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return null;
	}
}
