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
import com.angelPods.dto.MyBDto;

public class MyBDao {
	
	DataSource dataSource;
	private static MyBDao instance = new MyBDao();
	
	private MyBDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public static MyBDao getInstance(){
		return instance;
	}

	public ArrayList<MyBDto> list(String userId){
		ArrayList<MyBDto> dtos = new ArrayList<MyBDto>();
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
//				dtos.add(dto);
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
	
}
