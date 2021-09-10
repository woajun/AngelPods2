package com.angelPods.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.angelPods.dto.CdDto;

public class CdDao {
	
	DataSource dataSource;
	
	private static CdDao instance = new CdDao();
	
	private CdDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static CdDao getInstance(){
		return instance;
	}

	public ArrayList<CdDto> list() {
		ArrayList<CdDto> dtos = new ArrayList <CdDto>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			String query = "select "
					+ "cd_num, c_num, name, need_sn, idx from CATEGORY_DETAIL order by idx asc";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int cdNum = rs.getInt("cd_num");
				int cNum = rs.getInt("c_num");
				String name= rs.getString("name");
				String needSn= rs.getString("need_sn");
				int idx = rs.getInt("idx");
				
				CdDto dto = new CdDto(cdNum, cNum, name, needSn, idx);
				dtos.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return dtos;
	}
	
	public ArrayList<CdDto> list(int cNum) {
		ArrayList<CdDto> dtos = new ArrayList <CdDto>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			String query = "select "
					+ "cd_num, c_num, name, need_sn, idx from CATEGORY_DETAIL where c_num = ? order by idx asc";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int cdNum = rs.getInt("cd_num");
//				int cNum = rs.getInt("c_num");
				String name= rs.getString("name");
				String needSn= rs.getString("need_sn");
				int idx = rs.getInt("idx");
				
				CdDto dto = new CdDto(cdNum, cNum, name, needSn, idx);
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

	public ArrayList<CdDto> snList() {
		// TODO Auto-generated method stub
		ArrayList<CdDto> dtos = new ArrayList <CdDto>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			String query = "select "
					+ "cd_num, c_num, name, need_sn, idx from CATEGORY_DETAIL where NEED_SN like 'y' order by idx asc";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int cdNum = rs.getInt("cd_num");
				int cNum = rs.getInt("c_num");
				String name= rs.getString("name");
				String needSn= rs.getString("need_sn");
				int idx = rs.getInt("idx");
				
				CdDto dto = new CdDto(cdNum, cNum, name, needSn, idx);
				dtos.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return dtos;
	}
	
}
