package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Member;
import model.Reply_event;

public class Reply_eventDao {
	private static Reply_eventDao instance = new Reply_eventDao();

	private Reply_eventDao() {
	}

	public static Reply_eventDao getInstance() {
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
	public int insert(Reply_event reply_event) {
		return session.insert("reply_eventns.insert", reply_event); 
	}
	
	public List<Reply_event> select(Reply_event reply_event) {
		return (List<Reply_event>) session.selectList("reply_eventns.select", reply_event);
	}
	
	public int getTotalMyReply(String id) {
		return (int) session.selectOne("reply_eventns.getTotalMyReply", id);
	}

	public List<Reply_event> myReplyList(String id) {
		return session.selectList("reply_eventns.myReplyList", id);
	}

	public int update(Reply_event reply_event_update) {
		return session.update("reply_eventns.update", reply_event_update);
		
	}

	public int delete(int reply_no) {
		return session.update("reply_eventns.delete", reply_no);
	}

	public Reply_event select2(int reply_no) {
		return (Reply_event) session.selectOne("reply_eventns.select2",reply_no);
	}

	public void likesPlus(int reply_no) {
		session.update("reply_eventns.likesPlus", reply_no);
		
	}

	public void likesMinus(int reply_no) {
		session.update("reply_eventns.likesMinus", reply_no);
	}
}