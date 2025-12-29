package kr.co.sist.board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.dao.MyBatisHandler;


public class BoardDAO {
	private static BoardDAO bDAO;
	
	private BoardDAO() {
		
	}
	
	public static BoardDAO getInstance() {
		if(bDAO==null) {
			bDAO = new BoardDAO();
		}
		return bDAO;
	}
	
	
	public int selectBoardTotalCnt(RangeDTO rDTO) throws SQLException {
		int totalCnt = 0;
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);
		totalCnt = ss.selectOne("kr.co.sist.board.selectBoardTotalCnt",rDTO);
		
		if(ss!=null) {ss.close();}
		return totalCnt;
	}
	
	
	public List<BoardDomain> selectRangeBoard(RangeDTO rDTO) throws SQLException{
		List<BoardDomain> list = new ArrayList<BoardDomain>();
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);
		list = ss.selectList("kr.co.sist.board.selectRangeBoard",rDTO);
		
		if(ss!=null) {ss.close();}
		
		return list;
		
	}
	
	public void insertBoard(BoardDomain bDTO) throws PersistenceException {
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);		
		int cnt = ss.insert("kr.co.sist.board.insertBoard", bDTO);				
		ss.close();		
				
	}//insert board
	
	
	public BoardDomain selectBoardDetail(int num) throws SQLException {
		BoardDomain bDTO = null;

		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);		
		bDTO = ss.selectOne("kr.co.sist.board.selectBoardDetail", num);
		if(ss!=null) {ss.close();}
		
		return bDTO;		
	}

	
	public void updateBoardCnt(int num) throws SQLException {
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);	
		ss.update("kr.co.sist.board.updateBoardCnt", num);
		if(ss!=null) {ss.close();}
	}
	
	
	public int updateBoard(BoardDomain bDTO) throws SQLException {
		int cnt = 0;
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(true);	
		cnt = ss.update("kr.co.sist.board.updateBoardCnt", bDTO);
		return cnt;
	}//update board
	
	public int deleteBoard(BoardDomain bDTO) throws SQLException {
		int cnt = 0;
		
		SqlSession ss= MyBatisHandler.getInstance().getMyBatisHandler(true);
		cnt = ss.delete("kr.co.sist.board.deleteBoard", bDTO);

		return cnt;
	}//delete board
	
	
	
}
