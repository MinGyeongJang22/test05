package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.VisitVO;

public class VisitDAO {
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//방명록 전체 조회
	public List<VisitVO> selectVisit(Map<String, Integer> map){
		List<VisitVO> list = sqlSession.selectList("v.visit_list", map);
		return list;
	}
	//새 방명록 작성
	public int insert(VisitVO vo) {
		int res = sqlSession.update("v.visit_update", vo);
		return res;
	}
	//방명록 수 조회
	public int visit_count() {
		int count = sqlSession.selectOne("v.rowCount");
		return count;
	}
	//비밀번호 일치 확인
	public VisitVO check(int idx) {
		VisitVO vo = sqlSession.selectOne("v.select_one", idx);
		return vo;
	}
	
	//게시글 삭제
	public int delete( int idx ) {
		int res = sqlSession.delete("v.visit_delete", idx);
		return res;
	}
	
	//게시글 수정을 위해 idx에 해당되는 객체 한 건 조회
	public VisitVO selectOne(int idx) {
		VisitVO vo = sqlSession.selectOne("v.select_one", idx);
		return vo;
	}
		
	public int update(VisitVO vo) {
		int res = sqlSession.update("v.visit_update", vo);
		return res;
	}
}
