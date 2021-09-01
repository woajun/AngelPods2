package com.angelPods.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.angelPods.dto.MemberDto;

public class MemberDao {
	
	private static MemberDao instance = new MemberDao();
	
	private MemberDao() {
	}
	
	public static MemberDao getInstance(){
		return instance;
	}
	
	public int userCheck(String userId, String pw) {
		int ri = 0;
		String dbPw;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select pw from member where userId = ?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,userId);
			set = pstmt.executeQuery();
			
			if(set.next()) {
				dbPw = set.getString("pw");
				if(dbPw.equals(pw)) {
					ri = 1;
				} else {
					ri = 0;
				}
			} else {
				ri = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				set.close();
				pstmt.close();
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	
	public MemberDto getMember(String userId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from member where userId = ?";
		MemberDto dto = null;
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new MemberDto();
				dto.setUserId(rs.getString("userId"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.seteMail(rs.getString("eMail"));
				dto.setrDate(rs.getTimestamp("rDate"));
				dto.setAddr(rs.getString("addr"));
				dto.setRankId(rs.getInt("rankid"));
				dto.setLat(rs.getString("lat"));
				dto.setLon(rs.getString("lon"));
				dto.setProfilImage(rs.getString("profilImage"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dto;
		
	}
	
	
	
	private Connection getConnection() {
		//lookup을 쓰기위해 context를 만든다. lookup 메소드로 오라클의 경로에 있는 오라클을 찾아서 datasource에 경로를 알려준다.
		//datasource는 lookup이 알려준 경로를 필드로 갖고 있다가, getConnection 메소드로 오라클과 연결한다.
		//DB가 연결된 상태에서, 자유자재로 메소드를 사용해서 소통하기 위해 connection 인터페이스에 넣어준다.
		
		Context context = null;
		DataSource dataSource = null;
		Connection connection = null;
		try {
			context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
			connection = dataSource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return connection;
	}
	
	public int confirmUserId(String userId) {
		int ri = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select userId from member where userId = ?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			set = pstmt.executeQuery();
			if(set.next()) {
				ri = 1;
			} else {
				ri = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				set.close();
				pstmt.close();
				con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return ri;
	}
	
	public int insertMember(MemberDto dto) {
		int ri = 0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "insert into member "
				+ "(userId, pw, name, email, addr, lat, lon, profilImage) values (?,?,?,?,?,?,?,?)";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.geteMail());
			pstmt.setString(5, dto.getAddr());
			pstmt.setString(6, dto.getLat());
			pstmt.setString(7, dto.getLon());
			pstmt.setString(8, dto.getProfilImage());
			pstmt.executeUpdate();
			ri = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	
	public ArrayList<MemberDto> membersAll(){
		
		ArrayList<MemberDto> dtos = new ArrayList<MemberDto>();
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from member";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberDto dto = new MemberDto();
				dto.setUserId(rs.getString("userId"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.seteMail(rs.getString("eMail"));
				dto.setrDate(rs.getTimestamp("rDate"));
				dto.setAddr(rs.getString("addr"));
				dto.setRankId(rs.getInt("rankid"));
				dto.setLat(rs.getString("lat"));
				dto.setLon(rs.getString("lon"));
				dto.setProfilImage(rs.getString("profilImage"));
				dtos.add(dto);
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dtos;
		
	}
	
	public MemberDto contentView(String userId) {
		MemberDto dto = new MemberDto();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			
			String query = "select * from member where userId = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setUserId(rs.getString("userId"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.seteMail(rs.getString("eMail"));
				dto.setrDate(rs.getTimestamp("rDate"));
				dto.setAddr(rs.getString("addr"));
				dto.setRankId(rs.getInt("rankid"));
				dto.setLat(rs.getString("lat"));
				dto.setLon(rs.getString("lon"));
				dto.setProfilImage(rs.getString("profilImage"));
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
				e2.printStackTrace();
			}
		}
		return dto;
	}

	public int modify(String userId, String pw, String name, String eMail, String addr, 
			String lat, String lon, String profilImage) {
		// TODO Auto-generated method stub

		int ri = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			
			String query = "update member set pw = ?, name = ?, eMail = ?, addr = ?, lat = ?, lon = ?, profilImage = ? where userId = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, pw);
			pstmt.setString(2, name);
			pstmt.setString(3, eMail);
			pstmt.setString(4, addr);
			pstmt.setString(5, lat);
			pstmt.setString(6, lon);
			pstmt.setString(7, profilImage);
			pstmt.setString(8, userId);
			ri = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}

	public int delete(String userId) {
		int ri = -1;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			String query = "delete from member where userId = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			ri = pstmt.executeUpdate();
			
		} catch (Exception e) {
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
}
