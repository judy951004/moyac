package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Medicine;

public class MedicineDao {
	private static MedicineDao instance = new MedicineDao();

	private MedicineDao() {
	}

	public static MedicineDao getInstance() {
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
	//약품 등록
	public int insert(Medicine medicine) {
		return session.insert("medicinens.insert", medicine); 
	}
	//검색한 약품 데이터
	public List<Medicine> list(int startRow, int endRow, String search) {
		HashMap<String, Object> hm = new HashMap<>();
	    hm.put("startRow", startRow);
	    hm.put("endRow", endRow);
	    hm.put("search", search);
	    return session.selectList("medicinens.listSearch", hm);
	}
	//검색한 약의 수
	public int getSearchTotal(String search) {
		return (int) session.selectOne("medicinens.getSearchTotal",search);
	}
	//me_no로 약품 정보 받기
	public Medicine select(String me_no) {
		return (Medicine) session.selectOne("medicinens.select",me_no);
	}
	
	//지우지 않은 약의 수
	public int getTotal() {
		return (int) session.selectOne("medicinens.getTotal");
	}
	//색깔 검색 시 수
	public int getTotalColor(String color) {
		return (int) session.selectOne("medicinens.getTotalColor",color);
	}
	//모양 검색 시 수
	public int getTotalShape(String shape) {
		return (int) session.selectOne("medicinens.getTotalShape",shape);
	}
	//제형 검색 시 수
	public int getTotalFormulation(String formulation) {
		return (int) session.selectOne("medicinens.getTotalFormulation",formulation);
	}
	//색, 모양 검색 시 수
	public int getTotalColorShape(String color, String shape) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("color", color);
		hm.put("shape", shape);
		return (int) session.selectOne("medicinens.getTotalColorShape", hm);
	}
	//색, 제형 검색 시 수
	public int getTotalColorForm(String color, String formulation) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("color", color);
		hm.put("formulation", formulation);
		return (int) session.selectOne("medicinens.getTotalColorForm", hm);
	}
	//모양, 제형 검색 시 수
	public int getTotalShapeForm(String shape, String formulation) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("shape", shape);
		hm.put("formulation", formulation);
		return (int) session.selectOne("medicinens.getTotalShapeForm", hm);
	}
	//색, 모양, 제형 검색 시 수
	public int getTotalAll(String color, String shape, String formulation) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("color", color);
		hm.put("shape", shape);
		hm.put("formulation", formulation);
		return (int) session.selectOne("medicinens.getTotalAll", hm);
	}
	
	//색, 모양, 제형으로 검색한 약 데이터
	public List<Medicine> list_All(int startRow, int endRow, String color, String shape, String formulation) {
		HashMap<String, Object> hm = new HashMap<>();
	    hm.put("startRow", startRow);
	    hm.put("endRow", endRow);
	    hm.put("color", color);
	    hm.put("shape", shape);
	    hm.put("formulation", formulation);
	    return session.selectList("medicinens.list_All", hm);
	}
	//색으로 검색한 약 데이터
	public List<Medicine> list_color(int startRow, int endRow, String color) {
		HashMap<String, Object> hm = new HashMap<>();
	    hm.put("startRow", startRow);
	    hm.put("endRow", endRow);
	    hm.put("color", color);
	    return session.selectList("medicinens.list_color", hm);
	}
	//모양으로 검색한 약 데이터
	public List<Medicine> list_shape(int startRow, int endRow, String shape) {
		HashMap<String, Object> hm = new HashMap<>();
	    hm.put("startRow", startRow);
	    hm.put("endRow", endRow);
	    hm.put("shape", shape);
	    return session.selectList("medicinens.list_shape", hm);
	}
	//제형으로 검색한 약 데이터
	public List<Medicine> list_formulation(int startRow, int endRow, String formulation) {
		HashMap<String, Object> hm = new HashMap<>();
	    hm.put("startRow", startRow);
	    hm.put("endRow", endRow);
	    hm.put("formulation", formulation);
	    return session.selectList("medicinens.list_formulation", hm);
	}
	//색, 모양으로 검색한 약 데이터
	public List<Medicine> list_colorShape(int startRow, int endRow, String color, String shape) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("color", color);
		hm.put("shape", shape);
		return session.selectList("medicinens.list_colorShape", hm);
	}
	//색, 제형으로 검색한 약 데이터
	public List<Medicine> list_colorForm(int startRow, int endRow, String color, String formulation) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("color", color);
		hm.put("formulation", formulation);
		return session.selectList("medicinens.list_colorForm", hm);
	}
	//모양, 제형으로 검색한 약 데이터
	public List<Medicine> list_ShapeForm(int startRow, int endRow, String shape, String formulation) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("shape", shape);
		hm.put("formulation", formulation);
		return session.selectList("medicinens.list_shapeForm", hm);
	}
	//모든 약의 데이터
	public List<Medicine> listTotal(int startRow, int endRow) {
		HashMap<String, Object> hm = new HashMap<>();
	    hm.put("startRow", startRow);
	    hm.put("endRow", endRow);
	    return session.selectList("medicinens.listTotal", hm);
	}
	public int delete(int me_no) {
		return session.update("medicinens.delete", me_no);
	}
}
