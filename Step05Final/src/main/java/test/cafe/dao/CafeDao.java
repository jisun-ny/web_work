package test.cafe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.cafe.dto.CafeDto;
import test.util.DbcpBean;

public class CafeDao {
	private static CafeDao dao;
	//외부에서 객체를 생성할 수 없도록
	private CafeDao() {}
	//참조값을 리턴해주는 static method
	public static CafeDao getInstance() {
		if(dao == null) {
			dao = new CafeDao();
		}
		return dao;
	}
	
	public boolean insert(CafeDto dto){ 
		Connection conn= null;
		PreparedStatement pstmt = null;
		int rowCount =0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 
			String sql=" INSERT INTO board_cafe"
					+" (num, writer, title, viewCount, regdate)"
					+" VALUES(board_cafe_seq, ?, ?, ?, SYSDATE)";
			pstmt=conn.prepareStatement(sql);
			//sql 문이 미완성이라면 여기서 완성
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setInt(3, dto.getViewCount());
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

	public List<CafeDto> getList( ){  
		//글 목록을 담을 ArrayList 객체 생성
		List<CafeDto> list = new ArrayList<CafeDto>();
		
		//필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//DbcpBean 객체를 이용해서 Connection 객체를 얻어온다(Connection Pool 에서 얻어오기)
			conn=new DbcpBean().getConn();
			//실행할 sql 문 
			String sql=" SELECT num, writer, title, viewCount, regdate"
					+ " FROM board_cafe"
					+ " order by num DESC";
			pstmt=conn.prepareStatement(sql);
			//sql 문이 미완성이라면 여기서 완성
			
			//select 문 수행하고 결과값 받아오기
			rs=pstmt.executeQuery();
			//반복문 돌면서 ResultSet 에 담긴 내용 추출
			while(rs.next()) {
				CafeDto tmp = new CafeDto();
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setTitle(rs.getString("title"));		
				tmp.setViewCount(rs.getInt("viewCount"));
				tmp.setRegdate(rs.getString("regdate"));
				list.add(tmp);
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
		return list;
		}
	
	
//	public boolean update(CafeDto dto){ }
//	public boolean delete(int num){ }
//	public CafeDto getData(int num){ }
//	public List<CafeDto> getList( ){  }
//	public boolean addViewCount(int num){  }  //글 조회수 올리는 메소드 

}
