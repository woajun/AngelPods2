package com.angelPods.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.angelPods.dto.DevDto;

public class DevDao {
	
	DataSource dataSource;
	private static DevDao instance = new DevDao();
	
	private DevDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public static DevDao getInstance(){
		return instance;
	}

	public int add(String userId, int cdNum, String sn) {

		Connection con = null;
		PreparedStatement pstmt = null;
		int devNum = -1;
		
		try {
			String query = "select DEVICE_SEQ.NEXTVAL from DUAL";
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(query);
			ResultSet rsNum = pstmt.executeQuery();
			if (rsNum.next()) {
				devNum = rsNum.getInt(1);
			}
			
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
		
		try {
			String query = "insert into DEVICE "
					+ "(DevNum, userid, cd_num, sn) "
					+ "values (?,?,?,?)";
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, devNum);
			pstmt.setString(2, userId);
			pstmt.setInt(3, cdNum);
			pstmt.setString(4, sn);
			pstmt.executeUpdate();
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
		return devNum;
	}
	
	public ArrayList<DevDto> list(String userId){
		ArrayList<DevDto> dtos = new ArrayList<DevDto>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String query ="select D.DevNum, D.userid, D.cd_num, D.sn, D.timestamp, I.imagesystemname thumbnail "
					+ "from DEVICE D "
					+ "	left outer join DEVIMG I on D.devnum = I.devnum and I.idx = 1 "
					+ "where USERID like ? "
					+ "order by TIMESTAMP desc";
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int devNum = rs.getInt("devnum");
//				String userId = rs.getString("userId");
				int cdNum = rs.getInt("cd_Num");
				String sn = rs.getString("sn");
				Timestamp timestamp = rs.getTimestamp("timestamp");
				String thumbnail = rs.getString("thumbnail");
				DevDto dto = new DevDto(devNum, userId, cdNum, sn, timestamp, thumbnail);
				dtos.add(dto);
			}
			
		} catch (Exception e) {
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
	
	public DevDto view(int devNum) {
		DevDto dto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String query = "select * from DEVICE where DEVNUM = ?";
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, devNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
//				int devNum = rs.getInt("devnum");
				String userId = rs.getString("userId");
				int cdNum = rs.getInt("cdNum");
				String sn = rs.getString("sn");
				Timestamp timestamp = rs.getTimestamp("timestamp");
				dto = new DevDto(devNum, userId, cdNum, sn, timestamp);
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
	
	public int delete (int devNum) {
		int ri = -1;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			String query = "delete from DEVICE where DEVNUM = ?";
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, devNum);
			ri = pstmt.executeUpdate();
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
		if(ri == -1) {System.out.println("삭제하지 못했습니다");}
		return ri ;
	}
	
}
