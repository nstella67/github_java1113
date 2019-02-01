package net.notice;

import java.sql.*;
import java.util.ArrayList;

import net.utility.*;

public class NoticeDAO {
	private DBOpen dbopen=null;
	private DBClose dbclose=null;
	
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private StringBuilder sql=null;
	
	public NoticeDAO() {
		dbopen=new DBOpen();
		dbclose=new DBClose();
	}
	
	public int count(String col, String word) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" SELECT COUNT(*) AS CNT ");
			sql.append(" FROM tb_notice ");
			
			if(word.length()>=1) {	//검색어가 있는지?
				String search="";
				if(col.equals("subject")) {
					search += " WHERE subject LIKE '%"+word+"%'";
				}else if(col.equals("content")) {
					search += " WHERE content LIKE '%"+word+"%'";
				}
				else if(col.equals("subject_content")) {
					search += " WHERE subject LIKE '%"+word+"%'";
					search += " OR content LIKE '%"+word+"%'";
				}
				sql.append(search);
			}//if end
			
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt("cnt");
			}
		}catch(Exception e) {
			System.out.println("글갯수 실패 : "+e);
		}finally {
			dbclose.close(con, pstmt, rs);
		}//try end
		return cnt;
		
	}//count() end
	
	public ArrayList<NoticeDTO> list(String col, String word, int nowPage, int recordPerPage) {
	    ArrayList<NoticeDTO> list = null;

	    int startRow = ((nowPage-1) * recordPerPage) + 1;
	    int endRow = nowPage * recordPerPage;
	    try {
	    	con=dbopen.getConnection();
			sql=new StringBuilder();
			word = word.trim();
			if (word.length() == 0){ // 검색을 안하는 경우
		        sql.append(" SELECT noticeno, subject, nid, regdt, r");
		        sql.append(" FROM(");
		        sql.append("      SELECT noticeno, subject, nid, regdt,  rownum as r");
		        sql.append("      FROM (");
		        sql.append("           SELECT noticeno, subject, nid, regdt");
		        sql.append("           FROM tb_notice ");
		        //sql.append("           WHERE indent=0 ");
		        sql.append("           ORDER BY noticeno DESC");
		        sql.append("      )");
		        sql.append(" )     ");
		        sql.append(" WHERE r >= "+startRow+" AND r <= "+endRow);
		        
		        pstmt = con.prepareStatement(sql.toString());
			}else{ // 검색을 하는 경우
		        sql.append(" SELECT noticeno, subject, nid, regdt,  r");
		        sql.append(" FROM(");
		        sql.append("      SELECT noticeno, subject, nid, regdt, rownum as r");
		        sql.append("      FROM (");
		        sql.append("           SELECT noticeno, subject, nid, regdt");
		        sql.append("           FROM tb_notice ");
		        
		        //검색
		        if(word.length()>=1){
		        	String search=" WHERE "+col+" LIKE '%"+word+"%' ";	// AND indent=0
		        	sql.append(search);
		        }
		        sql.append("           ORDER BY noticeno DESC");
		        sql.append("      )");
		        sql.append(" )     ");
		        sql.append(" WHERE r >= "+startRow+" AND r <= "+endRow);
		        pstmt = con.prepareStatement(sql.toString());
			}//if end
	      
			rs=pstmt.executeQuery();
			if(rs.next()) {
		        list=new ArrayList<NoticeDTO>();
		        NoticeDTO dto=null; //레코드 1개보관
		        do {
		          dto=new NoticeDTO();
		          dto.setNoticeno(rs.getInt("noticeno"));
		          dto.setSubject(rs.getString("subject"));
		          dto.setNid(rs.getString("nid"));
		          dto.setRegdt(rs.getString("regdt"));
		          list.add(dto);
		        }while(rs.next());
			}//if end
	    } catch (Exception e) {
	      System.out.println(e.toString());
	    } finally {
	      dbclose.close(con, pstmt, rs);
	    }
	    return list;
	} // list() end////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	

	public int insert(NoticeDTO dto) {
		int res=0;
		try {
			con=dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" INSERT INTO  tb_notice(noticeno, subject, content, passwd, nid, regdt)");
			sql.append(" VALUES((SELECT NVL(MAX(noticeno), 0)+1 FROM tb_notice), ?, ?, ?, ?, sysdate)");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getPasswd());
			pstmt.setString(4, dto.getNid());
			res=pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("추가실패 : "+e);
		}finally {
			dbclose.close(con, pstmt);
		}//try end
		return res;
	}//insert() end////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	public NoticeDTO read(int noticeno) {
		NoticeDTO dto=null;
		
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" SELECT noticeno, nid, subject, content, regdt");
			sql.append(" FROM tb_notice");
			sql.append(" WHERE noticeno=?");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, noticeno);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto=new NoticeDTO();
				dto.setNoticeno(rs.getInt("noticeno"));
				dto.setNid(rs.getString("nid"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegdt(rs.getString("regdt"));
			}
		}catch(Exception e) {
			System.out.println("상세보기 실패 : "+e);
		}finally {
			dbclose.close(con, pstmt, rs);
		}//try end
		
		return dto;
		
	}//read() end////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	public NoticeDTO ntcUpdateform(NoticeDTO dto) {
		try {
			con=dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" SELECT noticeno, nid, subject, content, passwd");
			sql.append(" FROM tb_notice");
			sql.append(" WHERE passwd=? AND noticeno=?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getPasswd());
			pstmt.setInt(2, dto.getNoticeno());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto=new NoticeDTO();
				dto.setNoticeno(rs.getInt("noticeno"));
				dto.setNid(rs.getString("nid"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPasswd(rs.getString("passwd"));
			}else {
				dto=null;
			}
		}catch(Exception e) {
			System.out.println("실패 : "+e);
		}finally {
			dbclose.close(con, pstmt, rs);
		}//try end
			
		return dto;
	
	}//ntcUpdateform() end/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	public int noticeupdate(NoticeDTO dto) {
		int res=0;
		try {
			con=dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" UPDATE tb_notice");
			sql.append(" SET nid=?, subject=?, content=?, passwd=?");
			sql.append(" WHERE noticeno=?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getNid());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setInt(5, dto.getNoticeno());
			res=pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("수정실패 : "+e);
		}finally {
			dbclose.close(con, pstmt);
		}//try end
		return res;
	}//update() end/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	public int noticeDel(NoticeDTO dto) {
		int res=0;
		try {
			con=dbopen.getConnection();	//DB연결
				
			sql = new StringBuilder();
			sql.append(" DELETE FROM tb_notice");
			sql.append(" WHERE passwd=? AND noticeno=?");
				
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getPasswd());
			pstmt.setInt(2, dto.getNoticeno());
				
			res=pstmt.executeUpdate();
				
		}catch(Exception e) {
			System.out.println("삭제실패 : "+e);
		}finally {
			dbclose.close(con, pstmt);
		}//try end
			
		return res;
	}//delete() end//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
}//class end
