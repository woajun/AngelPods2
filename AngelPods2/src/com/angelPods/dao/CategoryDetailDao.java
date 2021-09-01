package com.angelPods.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.angelPods.dto.CategoryDetailDto;
import com.angelPods.dto.CategoryDto;

public class CategoryDetailDao {
	
	DataSource dataSource;
	
	private static CategoryDetailDao instance = new CategoryDetailDao();
	
	private CategoryDetailDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static CategoryDetailDao getInstance(){
		return instance;
	}

	public ArrayList<CategoryDetailDto> list() {
		ArrayList<CategoryDetailDto> dtos = new ArrayList <CategoryDetailDto>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			String query = "select "
					+ "cd_num, c_num, name, need_sn from CATEGORY_DETAIL order by cd_num asc";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int cdNum = rs.getInt("cd_num");
				int cNum = rs.getInt("c_num");
				String name= rs.getString("name");
				String needSn= rs.getString("need_sn");
				
				CategoryDetailDto dto = new CategoryDetailDto(cdNum, cNum, name, needSn);
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
