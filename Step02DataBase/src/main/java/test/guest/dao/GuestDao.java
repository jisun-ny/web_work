package test.guest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.guest.dto.GuestDto;
import test.member.dto.MemberDto;
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
	private GuestDao () {};/*외부에서 객체 생성하지 못하게*/
	//메소드
	public static GuestDao getInstance() { /*자신의 참조값을 리턴해주는 메소드*/
		if(dao == null) {
			dao = new GuestDao();
		} 
		return dao; 
	}
	
	
	//***전체 글의 목록을 리턴해주는 메소드
	// 아무것도 전달받지 않고 전체를 selectg해서 return해주는 메소드
	public List<GuestDto> getList() {
		//글 목록을 담을 객체를 미리 생성  --> 여기에 add, add, add해줘서 리턴해주면 됨.
		
		List<GuestDto> list = new ArrayList<>();
		//필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT num, writer, content, pwd, regdate"
					+ " FROM board_guest"
					+ " ORDER BY num desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet 에 담긴 내용 추출
			while(rs.next()) {
				//반복문 돌때마다 dto 하나씩 생성. 여기 안에다가 생성해야함.
				GuestDto dto = new GuestDto();

				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
				dto.setPwd(rs.getString("pwd"));
				dto.setRegdate(rs.getString("regdate")); //날짜도 getString()으로 읽어온다.
				//글 정보가 담긴 dto를 ArrayList 객체에 누적시킨다.
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
	
	
	//회원 한명의 정보를 리턴하는 메소드 // 글 하나의 정보를 리턴하는 메소드 --> 번호 하나 전달받아서 dto 리턴
			public GuestDto getData(int num) {
				GuestDto dto = null; //일단 변수 만들어 놓고 객체 생성은 while문 안에서
				//필요한 객체의 참조값을 담을 지역변수 미리 만들기
				Connection conn=null;
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				try {
					//DbcpBean 객체를 이용해서 Connection 객체를 얻어온다(Connection Pool 에서 얻어오기)
					conn=new DbcpBean().getConn();
					//실행할 sql 문 
					String sql = "SELECT num, writer, content, pwd, regdate"
				               + " FROM board_guest"
				               + " WHERE num=?";
				    pstmt = conn.prepareStatement(sql);

					//sql 문이 미완성이라면 여기서 완성
					pstmt.setInt(1, num);
					//select 문 수행하고 결과값 받아오기
					rs=pstmt.executeQuery();
					//반복문 돌면서 ResultSet 에 담긴 내용 추출
					while(rs.next()) { //이건 while 반복문을 돌 필요는 없음. 어차피 num은 프라이머리 키라 하나니까. while --> if로 바꿔도 됨. 어파피 와일 써도 한번밖에 안도니까 그냥 와일  써도 되고...
						
					    dto=new GuestDto();
					    dto.setNum(num);// 번호는 지역 변수에 있는 값을 담고
						//이름과 주소는 ResultSet으로부터 얻어내서 담는다.
					    dto.setWriter(rs.getString("writer"));
			            dto.setContent(rs.getString("content"));
			            dto.setPwd(rs.getString("pwd"));
			            dto.setRegdate(rs.getString("regdate"));

					}
				}catch(SQLException se) {
					se.printStackTrace();
				}finally {
					try {
						if(rs!=null)rs.close();
						if(pstmt!=null)pstmt.close();
						if(conn!=null)conn.close(); //Connection 이 Connection Pool 에 반납된다.
					}catch(Exception e) {}
				}
				return dto;
				}
	
	//**회원 정보 추가 -> 글 하나의 정보를 DB에 저장하는 메소드
	public boolean insert(GuestDto dto) {
		Connection conn= null;
		PreparedStatement pstmt = null;
		int rowCount =0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO board_guest"
					+ " (num, writer, content, pwd, regdate)"
					+ " VALUES(board_guest_seq.NEXTVAL, ?, ?, ?, SYSDATE)";
												// ?는 dto의 매개변수에 들어있음.
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
		
		//**글 하나의 정보를 수정반영하는 메소드 (비밀번호가 일치해야 수정이 된다.)
		public boolean update(GuestDto dto) {
			// dto하나에 여러 정보를 전달할 수 잇다!! dto의 필요성... 후..
			Connection conn = null;
			PreparedStatement pstmt = null;
			int rowCount = 0;
			try {
				conn = new DbcpBean().getConn();
				String sql = "UPDATE board_guest"
						+ " SET writer= ?, content = ?"
						+ " WHERE num = ? AND pwd = ?";
				
				pstmt = conn.prepareStatement(sql);
				//실행할 sql문이 미완성이라면 여기서 완성
				pstmt.setString(1, dto.getWriter());
				pstmt.setString(2, dto.getContent());				
				pstmt.setInt(3, dto.getNum());
				pstmt.setString(4, dto.getPwd());

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
	
		//삭제
		public boolean delete(GuestDto dto) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int rowCount = 0;
			try {
				conn = new DbcpBean().getConn();
				String sql = "DELETE FROM board_guest"
						+ " WHERE num=? AND pwd=?";
				pstmt = conn.prepareStatement(sql);
				//실행할 sql 문이 미완성이라면 여기서 완성
				pstmt.setInt(1, dto.getNum());
				pstmt.setString(2, dto.getPwd());
				//sql 문을 수행하고 변화된(추가, 수정, 삭제된) row 의 갯수 리턴 받기
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




