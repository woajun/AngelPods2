package com.angelPods.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.angelPods.dto.FindBoardDto;

public class FindBoardDao {
	
	DataSource dataSource;
	
	private static FindBoardDao instance = new FindBoardDao();
	
	private FindBoardDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static FindBoardDao getInstance() {
		return instance;
	}
	
	public int write(String userId, int cNum, int cdNum,
			String addr, String addrDetail, String title, String contents, String sn, String lat, String lon) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		//TODO 쭌 : select와 insert를 함께 사용해서 트랜잭션으로 문제 생길 수 있고 해답은 to 트랜잭션 공부할 것
		int fbNum = -1;
		try {
			con = dataSource.getConnection();
			String sqlIdentifier = "select FIND_BOARD_SEQ.NEXTVAL from dual";
			pstmt = con.prepareStatement(sqlIdentifier);
			ResultSet rsNum = pstmt.executeQuery();
			if (rsNum.next()) {
				fbNum = rsNum.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		try {
			con = dataSource.getConnection();
			String query = "insert into find_board "
					+ "(fb_num, userid, c_num, cd_num, addr, addrdetail, title, contents, sn, lat, lon) values"
					+ "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, fbNum);
			pstmt.setString(2, userId);
			pstmt.setInt(3, cNum);
			pstmt.setInt(4, cdNum);
			pstmt.setString(5, addr);
			pstmt.setString(6, addrDetail);
			pstmt.setString(7, title);
			pstmt.setString(8, contents);
			pstmt.setString(9, sn);
			pstmt.setString(10, lat);
			pstmt.setString(11, lon);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return fbNum;
	}
	
	public ArrayList<FindBoardDto> list() {
		ArrayList<FindBoardDto> dtos = new ArrayList <FindBoardDto>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			//TODO 행정동을 기준으로 리스트를 불러오는 것 구현 -> JSON으로 주소정보를 받아서 저장할 FIND_BOARD_ADDR 테이블 만들고, 두 테이블로 뷰를 만드는 방법 학습
			//TODO 자신의 위치를 기준으로 행정동을 찾아내는 것 구현 "성동구 응봉동의 <습득물>을 찾습니다" 왼쪽 상단 표시, 행정동으로 정렬
			String query = "select "
					+ "fb_num, userId, c_num, cd_num, thumbnailImage, timestamp, addr, addrDetail, title, contents, sn, lat, lon, chat_hit, hit, f_state from find_board order by fb_num desc";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int fbNum = rs.getInt("fb_num");
				String userId = rs.getString("userId");
				int cNum = rs.getInt("c_num");
				int cdNum = rs.getInt("cd_num");
				String thumbnailImage = rs.getString("thumbnailImage");
				Timestamp timestamp = rs.getTimestamp("timestamp");
				String addr = rs.getString("addr");
				String addrDetail = rs.getString("addrDetail");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				String sn = rs.getString("sn");
				String lat = rs.getString("lat");
				String lon = rs.getString("lon");
				int chatHit = rs.getInt("hit");
				int hit = rs.getInt("chat_hit");
				int fState = rs.getInt("f_state");
				
				FindBoardDto dto = new FindBoardDto(
						 fbNum,  userId,  cNum,  cdNum,  thumbnailImage, timestamp,
						 addr,  addrDetail,  title,  contents,  sn,  lat,  lon,
						 chatHit,  hit,  fState);
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

	public FindBoardDto contentView(int fbNum) {
		// TODO Auto-generated method stub

//		upHit(strID);
		FindBoardDto dto = null;
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select * from find_board where fb_num = ?";
			ps = con.prepareStatement(query);
			ps.setInt(1, fbNum);
			rs = ps.executeQuery();
			if (rs.next()) {
				String userId = rs.getString("userId");
				int cNum = rs.getInt("c_num");
				int cdNum = rs.getInt("cd_num");
				String thumbnailImage = rs.getString("thumbnailImage");
				Timestamp timestamp = rs.getTimestamp("timestamp");
				String addr = rs.getString("addr");
				String addrDetail = rs.getString("addrDetail");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				String sn = rs.getString("sn");
				String lat = rs.getString("lat");
				String lon = rs.getString("lon");
				int hit = rs.getInt("hit");
				int chatHit = rs.getInt("chat_hit");
				int fState = rs.getInt("f_state");
				
				dto = new FindBoardDto(
						 fbNum,  userId,  cNum,  cdNum,  thumbnailImage, timestamp,
						 addr,  addrDetail,  title,  contents,  sn,  lat,  lon,
						 chatHit,  hit,  fState);
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
				e2.printStackTrace();
			}
		}
		return dto;
	}
	
	public void delete (int fbNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			
			con = dataSource.getConnection();
			String query = "delete from find_board where fb_num = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, fbNum);
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
	}

	public void setThumbnailImage(int boardNum, String imageSystemName) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = dataSource.getConnection();
			String query = "update find_board set thumbnailimage = ? where fb_num = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, imageSystemName);
			pstmt.setInt(2, boardNum);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	public void modify(int fbNum, int cNum, int cdNum, String imageSystemName, String addr, String addrDetail,
			String title, String contents, String sn, String lat, String lon) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = dataSource.getConnection();
			String query = "update find_board set c_num=?, cd_num=?, thumbnailimage=?, addr=?, addrdetail=?, title=?, contents=?, sn=?, lat=?, lon=? where fb_num = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cNum);
			pstmt.setInt(2, cdNum);
			pstmt.setString(3, imageSystemName);
			pstmt.setString(4, addr);
			pstmt.setString(5, addrDetail);
			pstmt.setString(6, title);
			pstmt.setString(7, contents);
			pstmt.setString(8, sn);
			pstmt.setString(9, lat);
			pstmt.setString(10, lon);
			pstmt.setInt(11, fbNum);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

}
