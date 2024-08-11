package com.cm.flashmob.service;

import static com.cm.common.sql.JDBCTemplate.close;
import static com.cm.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.cm.flashmob.dao.FlashmobDao;
import com.cm.flashmob.vo.Flashmob;

public class FlashmobService {
	public List<Flashmob> selectFlashmobList(String sort,Flashmob option){
		Connection conn = getConnection();
		List<Flashmob> list = new FlashmobDao().selectFlashmobList(sort,option,conn);
		close(conn);
		return list;
	}
	public int selectFlashmobCount(Flashmob option) {
		Connection conn = getConnection();
		int result = new FlashmobDao().selectFlashmobCount(option,conn);
		close(conn);
		return result;
	}
	public int createFlashmob(int boardtype,int local_gu,Flashmob f) {
		Connection conn = getConnection();
		int result = new FlashmobDao().createFlashmob(boardtype,local_gu,f,conn);
		close(conn);
		return result;
	}
	public Flashmob checkPost(int post_no) {
		Connection conn = getConnection();
		Flashmob result = new FlashmobDao().checkPost(post_no,conn);
		close(conn);
		return result;
		}
	public int editFlashmob(int postNo,int user,int boardtype,int local_gu,Flashmob f) {
		Connection conn = getConnection();
		int result = new FlashmobDao().editFlashmob(postNo,user,boardtype,local_gu,f,conn);
		close(conn);
		return result;
	}
	public int delete(int post_no) {
		Connection conn = getConnection();
		int result = new FlashmobDao().delete(post_no,conn);
		close(conn);
		return result;
	}
	public String getName(int post_no) {
		Connection conn =  getConnection();
		String name = new FlashmobDao().getName(post_no,conn);
		close(conn);
		return name;
	}
	public List<Flashmob> mywriteFlashmob(int userNo){
		Connection conn = getConnection();
		List <Flashmob> list = new FlashmobDao().mywriteFlashmob(userNo,conn);
		close(conn);
		return list;
	}
	public List<Flashmob> mylikeFlashmob(int userNo){
		Connection conn = getConnection();
		List <Flashmob> list = new FlashmobDao().mylikeFlashmob(userNo,conn);
		close(conn);
		return list;
	}
	public List<Flashmob> myjoinFlashmob(int userNo){
		Connection conn = getConnection();
		List <Flashmob> list = new FlashmobDao().myjoinFlashmob(userNo,conn);
		close(conn);
		return list;
	}
	public List<Flashmob> popularFlashmob() {
		Connection conn = getConnection();
		List <Flashmob> list = new FlashmobDao().popularFlashmob(conn);
		close(conn);
		return list;
	}
}
