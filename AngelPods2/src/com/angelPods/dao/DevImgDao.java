package com.angelPods.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.angelPods.dto.DevImgDto;
import com.angelPods.dto.FImgDto;

public class DevImgDao {

	DataSource dataSource;
	
	private static DevImgDao instance = new DevImgDao();
	
	private DevImgDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public static DevImgDao getInstance() {
		return instance;
	}
	
	public int add(String imageSystemName, String imageName, int devNum, int imageIndex) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String query = "insert into DEVIMG values (?,?,?,?)";

		int ri = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, imageSystemName);
			pstmt.setString(2, imageName);
			pstmt.setInt(3, devNum);
			pstmt.setInt(4, imageIndex);
			pstmt.executeUpdate();
			ri = 1;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("DB에 이미지를 넣는것을 실패했습니다.");
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

	public DevImgDto getThumbnail(int DevNum) {
		// TODO Auto-generated method stub
		DevImgDto dto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			String query = "select * from DEVIMG where DEVNUM = ? order by idx asc"; 
					
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, DevNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String imageSystemName = rs.getString("imageSystemName");
				String imageName = rs.getString("imageName");
				int idx = rs.getInt("idx");
				dto = new DevImgDto(imageSystemName,imageName,DevNum,idx);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return dto;
	}
	
	public ArrayList<DevImgDto> getList(int DevNum) {
		// TODO Auto-generated method stub
		ArrayList <DevImgDto> dtos = new ArrayList <DevImgDto>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			String query = "select * from DEVIMG where DEVNUM = ? order by idx asc"; 
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, DevNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String imageSystemName = rs.getString("imageSystemName");
				String imageName = rs.getString("imageName");
//				int fbNum = rs.getInt("fb_num");
				int idx = rs.getInt("idx");
				
				DevImgDto dto = new DevImgDto(imageSystemName,imageName,DevNum,idx);
				dtos.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return dtos;
	}

	public int clear(int DevNum) {
		// TODO Auto-generated method stub
		int ri = -1;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = dataSource.getConnection();
			String query = "DELETE FROM DEVIMG WHERE DEVNUM = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, DevNum);
			pstmt.executeUpdate();
			ri = 1;
		} catch (Exception e) {
			// TODO: handle exception
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
}
