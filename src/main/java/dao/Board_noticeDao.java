package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Board_notice;

public class Board_noticeDao {
	private static Board_noticeDao instance = new Board_noticeDao();

	private Board_noticeDao() {
	}

	public static Board_noticeDao getInstance() {
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

	public List<Board_notice> list(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return session.selectList("board_notice_ns.list", hm);
	}

	public int getTotal() {
		return (int) session.selectOne("board_notice_ns.getTotal");
	}

	public int insert(Board_notice board_notice) {
		return session.insert("board_notice_ns.insert", board_notice);
	}

	public Board_notice select(int boardno) {
		return (Board_notice) session.selectOne("board_notice_ns.selectOne", boardno);
	}

	public void read_cntUpdate(int boardno) {
		session.update("board_notice_ns.read_cntUpdate", boardno);
	}

	public int update(Board_notice board_notice) {
		return session.update("board_notice_ns.update", board_notice);
	}

	public int delete(int boardno) {
		return session.update("board_notice_ns.delete", boardno);
	}

	public int replyupdate(Board_notice board_notice) {
		return session.update("board_notice_ns.replyupdate", board_notice);
	}

	public int board_newno() {
		return (int) session.selectOne("board_notice_ns.board_newno");
	}
	
	public List<Board_notice> list2(int startRow, int endRow, String search) {
		HashMap<String, Object> hm = new HashMap<>();
	    hm.put("startRow", startRow);
	    hm.put("endRow", endRow);
	    hm.put("search", search);
	    return session.selectList("board_notice_ns.list2", hm);
	}

	public int getnoticeSearchTotal(String search) {
		return (int) session.selectOne("board_notice_ns.getnoticeSearchTotal",search);
	}
	
	public void likesPlus(int boardno) {			
		session.update("board_notice_ns.likesPlus", boardno);
	}

	public void likesMinus(int boardno) {
		session.update("board_notice_ns.likesMinus", boardno);
	}
		
}