package com.angelPods.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.angelPods.dto.LbDto;

public class LbDao {
	
	DataSource dataSource;
	
	private static LbDao instance = new LbDao();
	
	private LbDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static LbDao getInstance() {
		return instance;
	}
	
	public int write(String userId, int cNum, int cdNum,
			String sido, String gue, String dong , String addrDetail, String title, String contents, String sn, String lat, String lng) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		//TODO 쭌 : select와 insert를 함께 사용해서 트랜잭션으로 문제 생길 수 있고 해답은 to 트랜잭션 공부할 것
		int lbNum = -1;
		try {
			con = dataSource.getConnection();
			String sqlIdentifier = "select FIND_BOARD_SEQ.NEXTVAL from dual";
			pstmt = con.prepareStatement(sqlIdentifier);
			ResultSet rsNum = pstmt.executeQuery();
			if (rsNum.next()) {
				lbNum = rsNum.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
			
		//TODO 0905 추가함 테스트필요.================
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		//===============================
		
		try {
			con = dataSource.getConnection();
			String query = "insert into lost_board "
					+ "(lbnum, userid, cnum, cdnum, sido, gue, dong, addrdetail, title, contents, sn, lat, lng) values"
					+ "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, lbNum);
			pstmt.setString(2, userId);
			pstmt.setInt(3, cNum);
			pstmt.setInt(4, cdNum);
			pstmt.setString(5, sido);
			pstmt.setString(6, gue);
			pstmt.setString(7, dong);
			pstmt.setString(8, addrDetail);
			pstmt.setString(9, title);
			pstmt.setString(10, contents);
			pstmt.setString(11, sn);
			pstmt.setString(12, lat);
			pstmt.setString(13, lng);
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
		return lbNum;
	}
	
	public ArrayList<LbDto> list() {
		ArrayList<LbDto> dtos = new ArrayList <LbDto>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			//TODO 행정동을 기준으로 리스트를 불러오는 것 구현 -> JSON으로 주소정보를 받아서 저장할 FIND_BOARD_ADDR 테이블 만들고, 두 테이블로 뷰를 만드는 방법 학습
			//TODO 자신의 위치를 기준으로 행정동을 찾아내는 것 구현 "성동구 응봉동의 <습득물>을 찾습니다" 왼쪽 상단 표시, 행정동으로 정렬
			String query = "select " + 
					"    L.lbnum, L.userId, C.name CNAME , CD.name CDNAME, " + 
					"    L.timestamp, L.sido, L.gue, L.dong , L.addrDetail, L.title, L.contents, L.sn, L.lat, L.lng, L.chathit, " + 
					"    L.hit, L.lstate, L.cnum, L.cdnum, LImg.imagesystemname thumbnailImage " + 
					"from lost_board L " + 
					"    left outer join CATEGORY C on C.c_Num = L.cnum " + 
					"    left outer join category_detail CD on cd.cd_num = L.cdnum " + 
					"    left outer join limages LImg on Limg.lbnum = L.lbnum AND Limg.idx = 1 " + 
					"order by L.lbnum desc";
					
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int lbNum = rs.getInt("lbnum");
				String userId = rs.getString("userId");
				int cNum = rs.getInt("cnum");
				int cdNum = rs.getInt("cdnum");
				Timestamp timestamp = rs.getTimestamp("timestamp");
				String sido = rs.getString("sido");
				String gue = rs.getString("gue");
				String dong = rs.getString("dong");
				String addrDetail = rs.getString("addrDetail");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				String sn = rs.getString("sn");
				String lat = rs.getString("lat");
				String lng = rs.getString("lng");
				int chatHit = rs.getInt("hit");
				int hit = rs.getInt("chathit");
				int fState = rs.getInt("lstate");
				String cName = rs.getString("cname");
				String cdName = rs.getString("cdname");
				String thumbnailImage = rs.getString("thumbnailImage");
				
				LbDto dto = new LbDto(
						 lbNum,  userId,  cNum,  cdNum, timestamp,
						 sido, gue, dong,  addrDetail,  title,  contents,  sn,  lat,  lng,
						 chatHit,  hit,  fState, cName, cdName, thumbnailImage);
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

	public LbDto getContent(int lbNum) {
		LbDto dto = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select " + 
					"    L.lbnum, L.userId, C.name C_NAME , CD.name CD_NAME, " + 
					"    L.timestamp, L.sido, L.gue, L.dong , L.addrDetail, L.title, L.contents, L.sn, L.lat, L.lng, L.chathit, " + 
					"    L.hit, L.lstate, L.cnum, L.cdnum, LImg.imagesystemname thumbnailImage " + 
					"from lost_board L " + 
					"    left outer join CATEGORY C on C.c_Num = L.cnum " + 
					"    left outer join category_detail CD on cd.cd_num = L.cdnum " + 
					"    left outer join limages LImg on LImg.lbnum = L.lbnum AND LImg.idx = 1 " + 
					"where L.lbnum = ?";
//			String query = "select * from lost_board where lb_num = ?";
			ps = con.prepareStatement(query);
			ps.setInt(1, lbNum);
			rs = ps.executeQuery();
			if (rs.next()) {
				String userId = rs.getString("userId");
				int cNum = rs.getInt("cnum");
				int cdNum = rs.getInt("cdnum");
				Timestamp timestamp = rs.getTimestamp("timestamp");
				String sido = rs.getString("sido");
				String gue = rs.getString("gue");
				String dong = rs.getString("dong");
				String addrDetail = rs.getString("addrDetail");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				String sn = rs.getString("sn");
				String lat = rs.getString("lat");
				String lng = rs.getString("lng");
				int chatHit = rs.getInt("hit");
				int hit = rs.getInt("chathit");
				int lState = rs.getInt("lstate");
				String cName = rs.getString("c_name");
				String cdName = rs.getString("cd_name");
				String thumbnailImage = rs.getString("thumbnailImage");
				
				dto = new LbDto(
						 lbNum,  userId,  cNum,  cdNum, timestamp,
						 sido, gue, dong ,  addrDetail,  title,  contents,  sn,  lat,  lng,
						 chatHit,  hit,  lState, cName, cdName, thumbnailImage);
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
	
	
	
	public int delete (int lbNum) {
		int ri = -1;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			
			con = dataSource.getConnection();
			String query = "delete from lost_board where lb_num = ?";
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

	public int modify(int lbNum, int cNum, int cdNum, String sido, String gue, String dong, String addrDetail,
			String title, String contents, String sn, String lat, String lng) {
		// TODO Auto-generated method stub
		int ri = -1;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = dataSource.getConnection();
			String query = "update lost_board set cnum=?, cdnum=?, sido=?, gue=?, dong=?, addrdetail=?, title=?, contents=?, sn=?, lat=?, lng=? where lbnum = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cNum);
			pstmt.setInt(2, cdNum);
			pstmt.setString(3, sido);
			pstmt.setString(4, gue);
			pstmt.setString(5, dong);
			pstmt.setString(6, addrDetail);
			pstmt.setString(7, title);
			pstmt.setString(8, contents);
			pstmt.setString(9, sn);
			pstmt.setString(10, lat);
			pstmt.setString(11, lng);
			pstmt.setInt(12, lbNum);
			pstmt.executeUpdate();
			ri = 1;
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
		
		return ri;
	}
}
