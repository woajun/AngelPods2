package com.angelPods.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.angelPods.dto.CategoryDto;

public class CategoryDao {
	
	DataSource dataSource;
	
	private static CategoryDao instance = new CategoryDao();
	
	private CategoryDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static CategoryDao getInstance(){
		return instance;
	}

	public ArrayList<CategoryDto> list() {
		ArrayList<CategoryDto> dtos = new ArrayList <CategoryDto>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			String query = "select "
					+ "c_num, name from CATEGORY order by ORDERNUM asc";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int cNum = rs.getInt("c_num");
				String name= rs.getString("name");
				
				CategoryDto dto = new CategoryDto(cNum, name);
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
