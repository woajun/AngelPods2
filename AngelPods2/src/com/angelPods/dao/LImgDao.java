package com.angelPods.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.angelPods.dto.FImgDto;
import com.angelPods.dto.LImgDto;

public class LImgDao {

	DataSource dataSource;
	
	private static LImgDao instance = new LImgDao();
	
	private LImgDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public static LImgDao getInstance() {
		return instance;
	}
	
	public int imageSetDB(String imageSystemName, String imageName, int imageIndex, int boardNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String query = "insert into LIMAGES values (?,?,?,?)";

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
			System.out.println("LImageDao - DB에 이미지를 넣는것을 실패했습니다.");
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

	public ArrayList<LImgDto> getImgs(int lbNum) {
		// TODO Auto-generated method stub
		ArrayList <LImgDto> dtos = new ArrayList <LImgDto>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			String query = "select * from LImages where lbnum = ? order by idx asc"; 
					
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, lbNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String imageSystemName = rs.getString("imageSystemName");
				String imageName = rs.getString("imageName");
//				int lbNum = rs.getInt("lbnum");
				int idx = rs.getInt("idx");

				LImgDto dto = new LImgDto(imageSystemName,imageName,lbNum,idx);
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

	public int clear(int lbNum) {
		// TODO Auto-generated method stub
		int ri = -1;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = dataSource.getConnection();
			String query = "DELETE FROM LIMAGES WHERE LBNUM = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, lbNum);
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
}
