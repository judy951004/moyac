package dao;

import java.io.Reader;
import java.util.HashMap;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ReplyLikesDao {
	private static ReplyLikesDao instance = new ReplyLikesDao();

	private ReplyLikesDao() {
	}

	public static ReplyLikesDao getInstance() {
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

		// 추천했던 적이 있는지 확인
		public int select(String id, int reply_no) {
			HashMap<String, Object> hm = new HashMap<>();
			hm.put("id", id);
			hm.put("reply_no", reply_no);
			return (int) session.selectOne("replyLikesns.select", hm);
		}
		
		// DB에 추천 저장
		public void insert(String id, int reply_no) {
			HashMap<String, Object> hm = new HashMap<>();
			hm.put("id", id);
			hm.put("reply_no", reply_no);
			session.insert("replyLikesns.insert", hm);
		}
		
		// DB에 추천 제거
		public void delete(String id, int reply_no) {
			HashMap<String, Object> hm = new HashMap<>();
			hm.put("id", id);
			hm.put("reply_no", reply_no);
			session.delete("replyLikesns.delete", hm);	
		}
}