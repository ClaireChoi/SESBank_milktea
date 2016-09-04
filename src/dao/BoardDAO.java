package dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import vo.Board;


/**
 * 문의게시판 관련 DAO
 */
public class BoardDAO {
	private SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory(); 
	SqlSession ss = null;

	/**
	 * 고객이 작성한 문의글 저장
	 * @param board 작성글 내용
	 */
	public void insertBoard(Board board) {
		try {
			ss = factory.openSession();	
			ss.insert("boardMapper.insertBoard", board);
			ss.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if (ss != null) ss.close();
		}
	}

	/**
	 * 전체 게시물 수 가져오기
	 * @param searchField 검색대상 필드
	 * @param searchText 검색어
	 * @return 게시물 수 
	 */
	public int getTotal(String searchField, String searchText) {
		int total = 0;
		
		//쿼리로 전달할 Parameter들
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchField", searchField);
		map.put("searchText", searchText);

		try {
			ss = factory.openSession();
			total = ss.selectOne("boardMapper.getTotal", map);
			ss.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if (ss != null) ss.close();
		}
		return total;
	}
	
	/**
	 * 현재 페이지의 글목록 가져오기
	 * @param searchField 검색대상 필드
	 * @param searchText 검색어
	 * @return 한 페이지에 보여줄 게시물 목록  
	 */
	public List<Board> listBoard(String searchField, String searchText, int startRecord, int countPerPage) {
		List<Board> boardlist = null;
		
		//쿼리로 전달할 Parameter들
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchField", searchField);
		map.put("searchText", searchText);
		
		//결과 레코드 중 읽을 위치와 개수
		RowBounds bound = new RowBounds(startRecord, countPerPage);
		
		try {
			ss = factory.openSession();
			boardlist = ss.selectList("boardMapper.listBoard", map, bound);
			ss.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			ss.close();
		}
		return boardlist;
	}	
	
	/**
	 * 하나의 글 읽기
	 * @param boardno 글번호
	 * @return 해당 게시물의 상세 정보
	 */	
	public Board getBoard(int boardno) {
		Board board = null;
		
		try {
			ss = factory.openSession();
			ss.update("boardMapper.hitcount", boardno); //조회수 증가
			board = ss.selectOne("boardMapper.getBoard", boardno);
			ss.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			ss.close();
		}
		return board;
	}	
	
	/**
	 * 하나의 글 삭제
	 * @param boardno 삭제할 글번호
	 * @return 삭제된 레코드 개수
	 */	

	public int deleteBoard(int boardno) {
		int result = 0;
		try {
			ss = factory.openSession();	
			result = ss.delete("boardMapper.deleteBoard", boardno);
			ss.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if (ss != null) ss.close();
		}
		return result;
	}
	
	/**
	 * 관리자가 문의글 답변 달기
	 * @param 답변 내용과 글 번호가 저장된 게시글 정보
	 * @return 수정된 레코드 개수
	 */
	public int insertReply(Board board) {
		int result = 0;
		try {
			ss = factory.openSession();	
			result = ss.update("boardMapper.insertReply", board);
			ss.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if (ss != null) ss.close();
		}
		return result;		
	}
	
	/**
	 * 글 수정
	 * @param board 수정할 글의 정보
	 * @return 수정된 레코드 개수
	 */	
	public int updateBoard(Board board) {

		int result = 0;
		try {
			ss = factory.openSession();	
			result = ss.update("boardMapper.updateBoard", board);
			ss.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if (ss != null) ss.close();
		}
		return result;
	}
	
}
