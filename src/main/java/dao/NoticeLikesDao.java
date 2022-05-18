package dao;

import java.io.Reader;
import java.util.HashMap;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class NoticeLikesDao {
	private static NoticeLikesDao instance = new NoticeLikesDao();

	private NoticeLikesDao() {
	}

	public static NoticeLikesDao getInstance() {
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

		// 이 아이디가 이 게시물을 좋아요 했는지 확인
		public int select(String id, int boardno) {
			HashMap<String, Object> hm = new HashMap<>();
			hm.put("id", id);
			hm.put("boardno", boardno);
			return (int) session.selectOne("noticeLikesns.select", hm);
		}
		
		// 회원이 게시글 좋아요 클릭
		public void insert(String id, int boardno) {
			HashMap<String, Object> hm = new HashMap<>();
			hm.put("id", id);
			hm.put("boardno", boardno);
			session.insert("noticeLikesns.insert", hm);
		}
		
		// 회원이 게시글 좋아요 취소
		public void delete(String id, int boardno) {
			HashMap<String, Object> hm = new HashMap<>();
			hm.put("id", id);
			hm.put("boardno", boardno);
			session.delete("noticeLikesns.delete", hm);	
		}
}