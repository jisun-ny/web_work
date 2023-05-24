package test.guest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.guest.dto.GuestDto;
import test.util.DbcpBean;


/*
 *  Application 전역에서 MemberDao 객체는 오직 한개만 생성해서 사용하도록 구조를 만들어야 한다.
 *  
 *  1. 외부에서 객체 생성하지 못하도록 생성자의 접근 지정자는 private 
 *  2. 자신의 참조값을 저장할수 있는 static 필드 만들기
 *  3. 자신의 참조값을 리턴해주는 public static 메소드 만들기
 */
 

public class GuestDao {
	//필드
	private static GuestDao dao;
	//생성자
	private GuestDao () {};
	//메소드
	public static GuestDao getInstance() {
		if(dao == null) {
			dao = new GuestDao();
		} 
		return dao; 
	}
	
	
	//***회원정보 가져오기 select
	public List<GuestDto> getList() {
		List<GuestDto> list = new ArrayList<>();
		//필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT num, writer, content, regdate"
					+ " FROM board_guest"
					+ " ORDER BY num";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet 에 담긴 내용 추출
			while(rs.next()) {
				GuestDto dto = new GuestDto();

				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));

				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close(); //Connection 이 Connection Pool 에 반납된다.
			}catch(Exception e) {}
		}
		return list;
		}
	
	//**회원 정보 추가
	public boolean insert(GuestDto dto) {
		Connection conn= null;
		PreparedStatement pstmt = null;
		int rowCount =0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO board_guest"
					+ " (num, writer, content, pwd, regdate)"
					+ " VALUES(board_guest_seq.NEXTVAL, ?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			//실행할 sql문이 미완성이라면 여기서 완성
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getPwd());
			//sql문을 수행하고 변화된(추가, 수정, 삭제된) row의 갯수 리턴 받기
			rowCount = pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		//만일 변화된 row 의 갯수가 0 보다 크면 작업 성공
		if(rowCount>0) {
			return true;
		}else {
			return false;
		}
	}
		
		//**정보 수정
		public boolean update(GuestDto dto) {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			int rowCount = 0;
			try {
				conn = new DbcpBean().getConn();
				String sql = "UPDATE board_guest"
						+ " SET writer= ?, content = ?, pwd=?"
						+ " WHERE num = ?";
				
				pstmt = conn.prepareStatement(sql);
				//실행할 sql문이 미완성이라면 여기서 완성
				pstmt.setString(1, dto.getWriter());
				pstmt.setString(2, dto.getContent());
				pstmt.setString(3, dto.getPwd());
				pstmt.setInt(4, dto.getNum());

				//sql문을 수행하고 변화된(추가, 수정, 삭제된) row의 갯수 리턴 받기
				rowCount = pstmt.executeUpdate();
			} catch (SQLException se) {
				se.printStackTrace();
			} finally {
				try {
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
				}
			}
			//만일 변화된 row 의 갯수가 0 보다 크면 작업 성공
			if (rowCount > 0) {
				return true;
			} else {
				return false;
			}
		
		}
	

}



