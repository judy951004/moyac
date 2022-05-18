package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Member;

public class MemberDao {
	// singleton
	private static MemberDao instance = new MemberDao();

	private MemberDao() {
	}

	public static MemberDao getInstance() {
		return instance;
	}

	// database connection pool
	private static SqlSession session;
	static { // 초기화 블록
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println("연결에러 : " + e.getMessage());
		}
	}
	
	
	public Member select(String id) {
		return (Member) session.selectOne("memberns.select",id);
	}
	public int insert(Member member) {
		return session.insert("memberns.insert", member);
	}
	//닉네임을 통해 조회
	public Member selectNic(String nick_name) {
		return (Member) session.selectOne("memberns.selectNick", nick_name);
	}
	
	public int update(Member member) {
		return session.insert("memberns.update", member);
	}

	public int delete(String id) {
		return session.update("memberns.delete", id);
	}
	//이메일을 통해 조회
	public Member selectEmail(String email) {
		return (Member) session.selectOne("memberns.selectEmail", email);
	}
	//게시판에서 닉네임 출력을 위해 멤버의 del='y'여도 검색 가능하게함
	public Member select2(String id) {
		return (Member) session.selectOne("memberns.select2",id);
	}
	
	public Member findId(String name, String email) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("name", name);
		hm.put("email", email);
		return (Member) session.selectOne("memberns.findId", hm);
	}

	public Member findPassword(String id, String email) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("id", id);
		hm.put("email", email);	
		return (Member) session.selectOne("memberns.findPassword", hm);
	}

	public int getTotal() {
		return (int) session.selectOne("memberns.getTotal");
	}
	//admin에서 모든회원 줄세우기
	public List<Member> list(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return (List<Member>) session.selectList("memberns.list", hm);
	}
	//비밀번호 찾기 후 변경
	public int updatePw(Member member) {
		return session.insert("memberns.updatePw", member);
	}
	//지정한 종류의 칼럼(searchKey)에 검색한 단어(search value)가 포함되는 데이터 수
	public int searchGetTotal(String searchKey, String searchValue) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("searchKey", searchKey);
		hm.put("searchValue", searchValue);
		return (int)session.selectOne("memberns.searchGetTotal",hm);
	}
	//지정한 종류의 칼럼(searchKey)에 검색한 단어(search value)가 포함되는 데이터 조회
	public List<Member> searchMember(int startRow, int endRow, String searchKey, String searchValue) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("searchKey", searchKey);
		hm.put("searchValue", searchValue);
		return (List<Member>)session.selectList("memberns.searchMember",hm);
	}

}
