package com.board.dao;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Inject
	private SqlSession sql;
	private static String namespace = "com.board.mapper.board";//mapper의 namespace와 일치해야함
	@Override
	//list는 얼마나 있는지 모를때
	public List<BoardVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".list");
	}
	//one는 하나만 가져올때
	public BoardVO view(int bno) throws Exception{
		
		return sql.selectOne(namespace+".view",bno);
	}
	public void up(int bno) throws Exception{
		sql.update(namespace+".up",bno);
	}
	public void modify(BoardVO vo) throws Exception {
		sql.update(namespace+".modify",vo);
	}
	public void delete(int bno) throws Exception{
		sql.delete(namespace+".delete",bno);
	}
	public void write(BoardVO vo) throws Exception {

			sql.insert(namespace+".write",vo);
	
		
	}
	@Override
	public int count() throws Exception {
		
		return sql.selectOne(namespace+".count");
	}
	@Override
	public List<BoardVO> listPage(int displayPost, int postNum) throws Exception {
		//데이터를 하나이상 보내기 위해서 HashMap사용
		//HashMap은 (key,Value)
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		return sql.selectList(namespace+".listPage",data);
	}
	@Override
	public List<BoardVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		return sql.selectList(namespace+".Search",data);
	}
	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		return sql.selectOne(namespace+".searchCount",data);
	}
	
	
}
