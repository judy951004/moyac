package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Board_event;

public class Board_eventDao {
	private static Board_eventDao instance = new Board_eventDao();

	private Board_eventDao() {
	}

	public static Board_eventDao getInstance() {
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

	public List<Board_event> list(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return session.selectList("board_event_ns.list", hm);
	}

	public int getTotal() {
		return (int) session.selectOne("board_event_ns.getTotal");
	}

	public int insert(Board_event board_event) {
		return session.insert("board_event_ns.insert", board_event);
	}

	public Board_event select(int boardno) {
		return (Board_event) session.selectOne("board_event_ns.selectOne", boardno);
	}

	public void read_cntUpdate(int boardno) {
		session.update("board_event_ns.read_cntUpdate", boardno);
	}

	public int update(Board_event board_event) {
		return session.update("board_event_ns.update", board_event);
	}

	public int delete(int boardno) {
		return session.update("board_event_ns.delete", boardno);
	}

	public int replyupdate(Board_event board_event) {
		return session.update("board_event_ns.replyupdate", board_event);
	}
	
	public int board_newno() {
		return (int) session.selectOne("board_event_ns.board_newno");
	}
	
	public List<Board_event> list2(int startRow, int endRow, String search) {
		HashMap<String, Object> hm = new HashMap<>();
	    hm.put("startRow", startRow);
	    hm.put("endRow", endRow);
	    hm.put("search", search);
	    return session.selectList("board_event_ns.list2", hm);
	}
	
	public int geteventSearchTotal(String search) {
		return (int) session.selectOne("board_event_ns.geteventSearchTotal",search);
	}
	
	public void likesPlus(int boardno) {			
		session.update("board_event_ns.likesPlus", boardno);
	}
	
	public void likesMinus(int boardno) {
		session.update("board_event_ns.likesMinus", boardno);
	}
		
}