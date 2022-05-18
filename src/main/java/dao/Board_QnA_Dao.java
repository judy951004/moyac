package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Board_QnA;
import model.Medicine;

public class Board_QnA_Dao {
	private static Board_QnA_Dao instance = new Board_QnA_Dao();

	private Board_QnA_Dao() {
	}

	public static Board_QnA_Dao getInstance() {
		return instance;
	}

	private static SqlSession session;

	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
			// reader.close();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public List<Board_QnA> list(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return session.selectList("board_QnA_ns.list", hm);
	}

	public int getTotal() {
		return (int) session.selectOne("board_QnA_ns.getTotal");
	}

	public int insert(Board_QnA board_QnA) {
		return session.insert("board_QnA_ns.insert", board_QnA);
	}

	public Board_QnA select(int boardno) {
		return (Board_QnA) session.selectOne("board_QnA_ns.selectOne", boardno);
	}

	public void read_cntUpdate(int boardno) {
		session.update("board_QnA_ns.read_cntUpdate", boardno);
	}

	public int update(Board_QnA board_QnA) {
		return session.update("board_QnA_ns.update", board_QnA);
	}

	public int delete(int boardno) {
		return session.update("board_QnA_ns.delete", boardno);
	}

	public int replyupdate(Board_QnA board_QnA) {
		return session.update("board_QnA_ns.replyupdate", board_QnA);
	}

	public int board_newno() {
		return (int) session.selectOne("board_QnA_ns.board_newno");
	}
	
	public List<Board_QnA> list2(int startRow, int endRow, String searchKey, String searchValue) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("searchKey", searchKey);
		hm.put("searchValue", searchValue);
		return (List<Board_QnA>)session.selectList("board_QnA_ns.list2",hm);
	}

	public int getQnASearchTotal(String searchKey, String searchValue) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("searchKey", searchKey);
		hm.put("searchValue", searchValue);
		return (int)session.selectOne("board_QnA_ns.getQnASearchTotal",hm);
	}
	
	public void likesPlus(int boardno) {			
		session.update("board_QnA_ns.likesPlus", boardno);
	}

	public void likesMinus(int boardno) {
		session.update("board_QnA_ns.likesMinus", boardno);
	}
	public int getTotalMyQnA(String id) {
		return (int) session.selectOne("board_QnA_ns.getTotalMyQnA", id);
	}
	public List<Board_QnA> myQnAList(String id) {
		return session.selectList("board_QnA_ns.myQnAList", id);
	}
}
