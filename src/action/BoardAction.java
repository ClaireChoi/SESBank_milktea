package action;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import dao.BoardDAO;
import seschool.bank.util.FileService;
import seschool.bank.util.PageNavigator;
import vo.Board;

public class BoardAction extends ActionSupport implements SessionAware {
	Board board ;					/** 게시글 정보 */
	int boardno;					/** 게시글 보기, 삭제 시 글번호 */
	
	List<Board> boardlist;			/** 게시물 목록 */
	PageNavigator pagenavi;			/** 페이징 관련 정보 */
	int currentPage = 1;			/** 게시물 목록의 현재 페이지 */
	String searchField ;				/** 검색 대상 필드 기본값 널 */
	String searchText ;				
	private File upload;					/** 업로드할 파일. Form의 <file> 태그의 name. */
	private String uploadFileName;			/** 업로드할 파일의 파일명 (File타입 속성명 + "FileName") */
	private String uploadContentType;		/** 업로드할 파일의 컨텐츠 타입 (File타입 속성명 + "ContentType") */
	private String replytext;
	/** 검색어 기본 값 널*/
	/*
	 *null 일 경우에는 전부 다 보겠다. 검색어가 있을 때는 그대로 
	 커렌트페이지가 바뀌어서 올경우 
	 
	 */
	BoardDAO dao = new BoardDAO();
	Map<String, Object> session;			/** 세션 정보 */

	//board 첫 화면의 리스트를 띄워온다. 
	public String boardlist(){
		//user.properties에서 지정한 페이징 관련 상수들 읽기
		int countPerPage = Integer.parseInt(getText("board.countperpage")); // 페이지당 글목록 수
		int pagePerGroup = Integer.parseInt(getText("board.pagepergroup")); // 그룹당 페이지 수

		BoardDAO dao = new BoardDAO();
		
		System.out.println("검색필드:" + searchField + ",검색어:" + searchText);

		//전체 글수 구하기
		int total = dao.getTotal(searchField, searchText);
		
		//PageNavigator 객체 생성 (페이지당 글수, 그룹당 페이지 수, 현재 페이지, 전체 글수)
		pagenavi = new PageNavigator(countPerPage, pagePerGroup, currentPage, total);
		
		//현재 페이지에 해당하는 글 목록 읽기 (전체 레코드 중 보여줄 첫번째 글의 위치, 페이지당 글 수 )
		boardlist = dao.listBoard(searchField, searchText, pagenavi.getStartRecord(), pagenavi.getCountPerPage());
		
		System.out.println(boardlist);
		return SUCCESS;

	}
	
	public String boardWrite(){
		System.out.println("boardWrite====================");
		String custid = (String) session.get("loginId");
		board = new Board();
		board.setCustid(custid);
		return SUCCESS;
	}
	
	public String writeAction() throws IOException{
	System.out.println("writeAction==============");
	String custid = (String) session.get("loginId");
	System.out.println(uploadFileName+uploadContentType);
	board.setCustid(custid);
	
	//첨부파일 저장 처리
	if(upload != null){
		FileService fs = new FileService();
		String basePath = getText("board.uploadpath"); //user.properties에 저장된 파일 경로
		String savedfile = fs.saveFile(upload, basePath, uploadFileName);
		
		board.setSavedfile(savedfile);
		board.setOriginalfile(uploadFileName);
	}
	
	dao.insertBoard(board);
		return SUCCESS;
	}
	
	public String boardRead(){
		System.out.println("boardRead=================");
		System.out.println(boardno);
		board = dao.getBoard(boardno);
		System.out.println(board);
		return SUCCESS;
	}
	
	public String searchText(){
		System.out.println("searchText================");
		int countPerPage = Integer.parseInt(getText("board.countperpage")); // 페이지당 글목록 수
		int pagePerGroup = Integer.parseInt(getText("board.pagepergroup")); // 그룹당 페이지 수

		BoardDAO dao = new BoardDAO();
		
		System.out.println("검색필드:" + searchField + ",검색어:" + searchText);

		//전체 글수 구하기
		int total = dao.getTotal(searchField, searchText);
		
		//PageNavigator 객체 생성 (페이지당 글수, 그룹당 페이지 수, 현재 페이지, 전체 글수)
		pagenavi = new PageNavigator(countPerPage, pagePerGroup, currentPage, total);
		
		//현재 페이지에 해당하는 글 목록 읽기 (전체 레코드 중 보여줄 첫번째 글의 위치, 페이지당 글 수 )
		boardlist = dao.listBoard(searchField, searchText, pagenavi.getStartRecord(), pagenavi.getCountPerPage());
		
		return SUCCESS;
	}

	/*
	 * @param baordno, replytext 
	 * dao 에서 업데이트 replytext, replydate
	 */
	public String reply(){
		System.out.println("reply======================");
		System.out.println(boardno+replytext);
		board=new Board();
		board.setBoardno(boardno);
		board.setReplytext(replytext);
		System.out.println(board);
		dao.insertReply(board);
		board = dao.getBoard(boardno);
		return SUCCESS;
	}
	/*
	 * boardno 받아와서 파일 삭제하고 DB에서 지움
	 */
	public String deleteBoard(){
		System.out.println("deleteBoard================");
		System.out.println(boardno);
		FileService fs = new FileService();
		Board bb = dao.getBoard(boardno);
		String basePath = getText("board.uploadpath"); 
		String fullpath = basePath + bb.getSavedfile();
				//basePath + "/" + savedFilename + ext;
		fs.fileDelete(fullpath);
		dao.deleteBoard(boardno);
		this.boardlist();
		
		return SUCCESS;
	}
/* boardno 받아와서 해당 보드 정보 띄움
 * 	
 */
	public String updateBoard(){
		System.out.println("updateBoard==================");
		System.out.println(boardno);
		board = dao.getBoard(boardno);
		return SUCCESS;
	}
	
	public String updateAction(){
		System.out.println("updateAction==================");
		System.out.println(board);
		dao.updateBoard(board);
		this.boardlist();

		return SUCCESS;
	}
	public Board getBoard() {
		return board;
	}

	public void setBoard(Board board) {
		this.board = board;
	}

	public int getBoardno() {
		return boardno;
	}

	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}

	public List<Board> getBoardlist() {
		return boardlist;
	}

	public void setBoardlist(List<Board> boardlist) {
		this.boardlist = boardlist;
	}

	public PageNavigator getPagenavi() {
		return pagenavi;
	}

	public void setPagenavi(PageNavigator pagenavi) {
		this.pagenavi = pagenavi;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getSearchField() {
		return searchField;
	}

	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public BoardDAO getDao() {
		return dao;
	}

	public void setDao(BoardDAO dao) {
		this.dao = dao;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;		
	}

	public String getReplytext() {
		return replytext;
	}

	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}


}
