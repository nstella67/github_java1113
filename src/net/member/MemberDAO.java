package net.member;

import java.sql.*;
import java.util.ArrayList;

import net.member.MemberDTO;
import net.utility.*;

public class MemberDAO {
	
	private DBOpen dbopen=null;
	private DBClose dbclose=null;
	
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private StringBuilder sql=null;
	
	public MemberDAO() {
		dbopen=new DBOpen();
		dbclose=new DBClose();
	}
	
	public int duplecateID(String id) {
		ResultSet rs=null;
		int cnt=0;
		
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			
			sql.append(" SELECT COUNT(id) AS cnt");
			sql.append(" FROM MEMBER "); 
			sql.append(" WHERE id=?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt("cnt");
			}
		}catch(Exception e) {
			System.out.println("아이디 중복조회 실패 : "+e);
		}finally {
			dbclose.close(con, pstmt, rs);
		}//try end
		
		return cnt;
		
	}//duplecateID() end
	
	public int duplecateEmail(String email) {
		ResultSet rs=null;
		int cnt=0;
		
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			
			sql.append(" SELECT COUNT(email) AS cnt "); 
			sql.append(" FROM MEMBER "); 
			sql.append(" WHERE email=? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt("cnt");
			}
		}catch(Exception e) {
			System.out.println("아이디 중복조회 실패 : "+e);
		}finally {
			dbclose.close(con, pstmt, rs);
		}//try end
		
		return cnt;
		
	}//duplecateID() end
	
	public int insert(MemberDTO dto) {
		int res=0;
		try {
			con=dbopen.getConnection();	//DB연결
			
			sql = new StringBuilder();
			sql.append(" insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate) ");
			sql.append(" values(?, ?, ?, ?, ?, ?, ?, ?, ?, 'D1', sysdate)");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getMname());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getAddress1());
			pstmt.setString(8, dto.getAddress2());
			pstmt.setString(9, dto.getJob());
			
			res=pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("추가실패 : "+e);
		}finally {
			dbclose.close(con, pstmt);
		}//try end
		
		return res;
	}
	
	public String loginProc(MemberDTO dto) {
		ResultSet rs=null;
		String mlevel=null;
		
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			
			sql.append(" SELECT mlevel");
			sql.append(" FROM member");
			sql.append(" WHERE id=? AND passwd=?"); 
			sql.append(" AND mlevel in('A1', 'B1', 'C1', 'D1')");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				mlevel=rs.getString("mlevel");
			}
		}catch(Exception e) {
			System.out.println("로그인 실패 : "+e);
		}finally {
			dbclose.close(con, pstmt, rs);
		}//try end
		
		return mlevel;
	}//login() end

	//회원관리
	public int recordCount() {
		ResultSet rs=null;
		int cnt=0;
		
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			
			sql.append(" SELECT COUNT(id) cnt");
			sql.append(" FROM MEMBER");
			
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt("cnt");
			}else {
				
			}
		}catch(Exception e) {
			System.out.println("회원 조회 실패 : "+e);
		}finally {
			dbclose.close(con, pstmt, rs);
		}//try end
		
		return cnt;
	}
	
	public ArrayList<MemberDTO> list(String col) {
		ResultSet rs=null;
		StringBuilder sql=null;
		ArrayList<MemberDTO> list=null;
		
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" SELECT id, passwd, mname, tel, email, mdate, mlevel");
			sql.append(" FROM MEMBER");
			
			if(col.equals("id")||col.equals("")) {
				sql.append(" ORDER BY id ASC");
			}else if(col.equals("mname")) {
				sql.append(" ORDER BY mname ASC");
			}else if(col.equals("mdate")) {
				sql.append(" ORDER BY mdate DESC");
			}//if end
			
			pstmt=con.prepareStatement(sql.toString());
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				list=new ArrayList<>();		//전체저장
				do {
					MemberDTO dto=new MemberDTO();	//한줄저장
					dto.setId(rs.getString("id"));
					dto.setPasswd(rs.getString("passwd"));
					dto.setMname(rs.getString("mname"));
					dto.setTel(Utility.checkNull(rs.getString("tel")));
					dto.setEmail(rs.getString("email"));
					dto.setMdate(rs.getString("mdate"));
					dto.setMlevel(rs.getString("mlevel"));
					list.add(dto);
				}while(rs.next());
			}//if end
			
		}catch(Exception e) {
			System.out.println("목록실패 : "+e);
		}finally {
			dbclose.close(con, pstmt, rs);
		}//try end
		
		return list;
		
	}//list() end
	
	
	public int updateM(String id, String mlevel) {
		int res=0;
		
		try {
			con=dbopen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" UPDATE MEMBER"); 
			sql.append(" SET mlevel=?"); 
			sql.append(" WHERE id=?");
				
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, mlevel);
			pstmt.setString(2, id);

			res=pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("수정실패 : "+e);
		}finally {
			dbclose.close(con, pstmt);
		}//try end
		
		return res;
	}//updateM() end
	
	
	public int memDel(String id) {
		int res=0;
		
		try {
			con=dbopen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" DELETE FROM MEMBER");
			sql.append(" WHERE id=?");
				
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);

			res=pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("삭제실패 : "+e);
		}finally {
			dbclose.close(con, pstmt);
		}//try end
		
		return res;
		
	}
	
	
	
}//class end
