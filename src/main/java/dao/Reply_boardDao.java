package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Reply_board;

public class Reply_boardDao {
	private static Reply_boardDao instance = new Reply_boardDao();

	private Reply_boardDao() {
	}

	public static Reply_boardDao getInstance() {
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
	public int insert(Reply_board reply_board) {
		return session.insert("reply_boardns.insert", reply_board); 
	}
	
	public List<Reply_board> select(Reply_board reply_board) {
		return (List<Reply_board>) session.selectList("reply_boardns.select", reply_board);
	}


}