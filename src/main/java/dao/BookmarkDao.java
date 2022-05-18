package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Board_QnA;
import model.Bookmark;
import model.Medicine;

public class BookmarkDao {
	private static BookmarkDao instance = new BookmarkDao();

	private BookmarkDao() {
	}

	public static BookmarkDao getInstance() {
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

		public int select(String id, int me_no) {
			HashMap<String, Object> hm = new HashMap<>();
			hm.put("id", id);
			hm.put("me_no", me_no);
			return (int) session.selectOne("bookmarkns.select", hm);
		}
		
		// 북마크 클릭
		public void insert(String id, int me_no) {
			HashMap<String, Object> hm = new HashMap<>();
			hm.put("id", id);
			hm.put("me_no", me_no);
			session.insert("bookmarkns.insert", hm);
		}

		// 북마크 취소
		public void delete(String id, int me_no) {
			HashMap<String, Object> hm = new HashMap<>();
			hm.put("id", id);
			hm.put("me_no", me_no);
			session.delete("bookmarkns.delete", hm);	
		}
		
		// 북마크 개수
		public int getTotalMyBookmark(String id) {
			return (int) session.selectOne("bookmarkns.getTotalMyBookmark", id);
		}

		// 북마크 목록
		public List<Bookmark> myBookmarkList(String id) {
			return session.selectList("bookmarkns.myBookmarkList", id);
		}
}