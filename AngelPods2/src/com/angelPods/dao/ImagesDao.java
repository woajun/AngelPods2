package com.angelPods.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ImagesDao {

	DataSource dataSource;
	
	private static ImagesDao instance = new ImagesDao();
	
	private ImagesDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public static ImagesDao getInstance() {
		return instance;
	}
	
	public int imageSetDB(String imageSystemName, String imageName, int imageIndex, int boardNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String query = "insert into find_image values (?,?,?,?)";

		int ri = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, imageSystemName);
			pstmt.setString(2, imageName);
			pstmt.setInt(3, imageIndex);
			pstmt.setInt(4, boardNum);
			pstmt.executeUpdate();
			ri = 1;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("FImageDao - DB에 이미지를 넣는것을 실패했습니다.");
			e.printStackTrace();
			ri = -1;
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
}
