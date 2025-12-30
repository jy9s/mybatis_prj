package kr.co.sist.board;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;

public class BoardService {
	private static BoardService bs;
	
	private BoardService() {
		
	}
	
	
	public static BoardService getInstance() {
		if(bs==null) {
			bs=new BoardService();
		}
		
		return bs;
	}
	
	/**
	 * 제목 20자로 생략하기
	 * @param list
	 */
	public void titleSubStr(List<BoardDomain> boardList) {
		String title="";
		for(BoardDomain bDTO : boardList){
			if(bDTO.getTitle()!=null) {
				title = bDTO.getTitle();
				if(title.length()>19){
					bDTO.setTitle(title.substring(0,20)+"...");
				}//end if
			}
		}//end for
	}
	
	
	/**
	 * 전체 레코드의 수
	 * @param rDTO
	 * @return
	 */
	public int totalCnt(RangeDTO rDTO) {
		int totalCnt=0;
		
		BoardDAO bDAO = BoardDAO.getInstance();
		
		
		try {
			totalCnt = bDAO.selectBoardTotalCnt(rDTO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return totalCnt;
	}
	
	/**
	 * 한 화면에 보여줄 페이지의 수
	 * @return
	 */
	public int pageScale() {
		return 10;
	}//pageScale
	
	/**
	 * 총 페지이수
	 * @param totalCount 전체 게시물 수
	 * @param pageScale 한 화면에 보여줄 게시물 수
	 * @return
	 */
	public int totalPage(int totalCount, int pageScale) {
		return (int)Math.ceil((double)totalCount/pageScale);
	}//totalPage
	
	
	/**
	 * 페이지의 시작번호 구하기
	 * @param pageScale 한 화면에 보여줄 게시물 수
	 * @param currentPage 현재 페이지
	 * @return
	 */
	public int startNum (int pageScale, int currentPage) {
		return pageScale*(currentPage-1)+1;
	}
	
	/**
	 * @param startNum 시작 번호
	 * @param pageScale 한 화면에 보여줄 게시물 수
	 * @return
	 */
	public int endNum(int startNum, int pageScale) {
		return startNum + pageScale -1;
	}
	
	public boolean addBoard(BoardDTO bDTO) {
		boolean flag = false;
		
		BoardDAO bDAO = BoardDAO.getInstance();
		try {
			bDAO.insertBoard(bDTO);
			flag=true;
		}catch(PersistenceException pe){
			pe.printStackTrace();
		}
		return flag;
	}
	
	
	/**
	 * 시작번호, 끝번호, 검색필드, 검색키워드를 사용한 게시글 검색
	 * @param rDTO
	 * @return
	 */
	public List<BoardDomain> searchBoardList(RangeDTO rDTO){
		List<BoardDomain> list = null;
		BoardDAO bDAO = BoardDAO.getInstance();
		try {
			list = bDAO.selectRangeBoard(rDTO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return list;
	}
	
	/**
	 * 글 상세 보기
	 * @param num
	 * @return
	 */
	public BoardDomain searchOneBoard(int num) {
		BoardDomain bDTO = null;
		BoardDAO bDAO = BoardDAO.getInstance();
		
		try {
			bDTO = bDAO.selectBoardDetail(num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return bDTO;
	}
	
	
	
	public void modifyBoardCnt(int num) {
		BoardDAO bDAO = BoardDAO.getInstance();
		
		try {
			bDAO.updateBoardCnt(num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
	/**
	 * 페이지 네이션 << 1 2 3 4 5 >>
	 * @param rDTO
	 * @return
	 */
	public String pagination(RangeDTO rDTO) {
		StringBuilder pagination = new StringBuilder();
		//1. 한 화면에 보여줄 pagination의 수
		int pageNumber=3;
		//2. 화면에 보여줄 시작페이지 번호 설정 1,2,3 -> 1 / 4,5,6 -> 2
		int startPage=((rDTO.getCurrentPage()-1)/pageNumber)*pageNumber+1;
		//3. 화면에 보여줄 마지막 페이지 번호
		int endPage = (((startPage-1)+pageNumber)/pageNumber)*pageNumber;
		//456인 경우 > 4로 설정
		if(rDTO.getTotalPage()<=endPage) {
			endPage=rDTO.getTotalPage();
		}
		//5. 첫페이지가 인덱스 화면 (1페이지) 가 아닌경우
		int movePage=0;
		StringBuilder prevMark = new StringBuilder();
		prevMark.append("[&lt;&lt;]");
		//prevMark.append("<li class='page-item'><a class='page-link' href='#'>Previous</a></li>");
		if(rDTO.getCurrentPage() > pageNumber) { //시작페이지 번호가 3보다 크면 
			movePage=startPage-1; // 4,5,6 -> 3  7,8,9 -> 6
			prevMark.delete(0, prevMark.length()); //이전에 링크가 없는 [<<] 삭제 
			prevMark.append("[ <a href='").append(rDTO.getUrl())
			.append("?currentPage=").append(movePage);
			//검색 키워드가 있다면 검색 키워드를 붙인다.
			if(rDTO.getKeyword()!= null && !rDTO.getKeyword().isEmpty()) { 
				prevMark.append("&field=").append(rDTO.getField())
				.append("&keyword=").append(rDTO.getKeyword());
			}// end if
			prevMark.append("' class='prevMark'>&lt;&lt;</a> ]");			
		}
		
		//6. 시작페이지 번호부터 끝 번호까지 화면에 출력
		StringBuilder pageLink = new StringBuilder();
		movePage=startPage;
		while(movePage <= endPage) {
			if(movePage==rDTO.getCurrentPage()) {
				pageLink.append("[ <span class='currentPage'>")
				.append(rDTO.getCurrentPage())
				.append("</span> ]");				
			}else {
				pageLink.append("[ <a class='notCurrentPage' href='").append(rDTO.getUrl())
				.append("?currentPage=").append(movePage);
				//검색 키워드가 있다면 검색 키워드를 붙인다.
				if(rDTO.getKeyword()!= null && !rDTO.getKeyword().isEmpty()) { 
					pageLink.append("&field=").append(rDTO.getField())
					.append("&keyword=").append(rDTO.getKeyword());
				}// end if
				pageLink.append("'>").append(movePage).append("</a> ]");								
			}
			movePage++;
		}
		
		//7. 뒤에 페이지가 더 있음.
		StringBuilder nextMark = new StringBuilder("[&gt;&gt;]");
		
		if(rDTO.getTotalPage() > endPage) { //뒤에 페이지가 더 있다.
			movePage = endPage + 1;
			nextMark.delete(0, nextMark.length());
			nextMark.append("[ <a class='nextMark' href='").append(rDTO.getUrl())
			.append("?currentPage=").append(movePage);
			
			if(rDTO.getKeyword()!= null && !rDTO.getKeyword().isEmpty()) { 
				nextMark.append("&field=").append(rDTO.getField())
				.append("&keyword=").append(rDTO.getKeyword());
			}// end if
			
			nextMark.append("'>&gt;&gt;</a> ]");
			
					
		}
		
		
		
		pagination.append(prevMark).append(" ... ").append(pageLink).append(" ... ").append(nextMark);
		
		return pagination.toString();
	}//pagination
	
	
	public boolean modifyBoard(BoardDTO bDTO) {
		boolean flag=false;
		
		BoardDAO bDAO = BoardDAO.getInstance();
		try {
			flag = bDAO.updateBoard(bDTO)==1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	
	public boolean removeBoard(BoardDTO bDTO) {
		boolean flag=false;
		
		BoardDAO bDAO = BoardDAO.getInstance();
		try {
			flag = bDAO.deleteBoard(bDTO)==1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	
}
