package com.angelPods.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.angelPods.dto.CDto;

public class CDao {
	
	DataSource dataSource;
	
	private static CDao instance = new CDao();
	
	private CDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static CDao getInstance(){
		return instance;
	}

	public ArrayList<CDto> list() {
		ArrayList<CDto> dtos = new ArrayList <CDto>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			String query = "select "
					+ "c_num, name, idx from CATEGORY order by idx asc";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int cNum = rs.getInt("c_num");
				String name= rs.getString("name");
				int idx= rs.getInt("idx");
				
				CDto dto = new CDto(cNum, name, idx, null);
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
