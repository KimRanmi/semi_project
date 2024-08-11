package com.cm.sale_share_board.service;

import static com.cm.common.sql.JDBCTemplate.close;
import static com.cm.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.cm.sale_share_board.dao.SaleShareBoardDao;
import com.cm.sale_share_board.vo.SaleShareBoard;
import com.cm.sale_share_board.vo.SaleShareImage;
import com.cm.sale_share_board.vo.SaleShareLike;
import com.cm.sale_share_board.vo.SaleShareList;



public class SaleShareBoardService {
	
	// 게시글 생성
	public int createBoard(SaleShareBoard ssb,SaleShareImage ssi) {
		Connection conn = getConnection();
		int result = new SaleShareBoardDao().createBoard(ssb,ssi,conn);
		close(conn);
		 int i = 0;
		return result;
	}
	
	// 게시글 리스트 & 검색(제목)조회 
	public List<SaleShareList> selectSaleBoardList(SaleShareList option){
		Connection conn = getConnection();
		List<SaleShareList> list = new SaleShareBoardDao().selectSaleBoardList(option,conn);
		close(conn);
		return list;
		
	}
	
	// 검색(내용) 조회
	public List<SaleShareList> selectSaleSearchText(SaleShareList option){
		Connection conn = getConnection();
		List<SaleShareList> list = new SaleShareBoardDao().selectSaleSearchText(option,conn);
		close(conn);
		return list;
		
	}
	
	// 게시글 갯수
	public int selectListCount(SaleShareList option) {
		Connection conn = getConnection();
		int result = new SaleShareBoardDao().selectSaleBoardCount(option,conn);
		close(conn);
		return result;
	}
	
	// 상세조회, 수정 정보 가져오기
	public SaleShareList selectBoard(int postNo) {
		Connection conn = getConnection();
		SaleShareList ssl = new SaleShareBoardDao().selectBoard(postNo,conn);
		close(conn);
		return ssl;
	}
	
	// 게시글 수정
	public int saleEdit(String visiblity,int postNo, SaleShareBoard ssb, SaleShareImage ssi) {
		Connection conn = getConnection();
		int result = new SaleShareBoardDao().editSale(visiblity,postNo,ssb,ssi,conn);
		close(conn);
		return result;
	}
	
	// 게시글 삭제
	public int saleDelete(int postNo) {
		Connection conn = getConnection();
		int result = new SaleShareBoardDao().deleteSale(postNo,conn);
		close(conn);
		return result;
	}
	
	// 카테고리 - 나눔
	public List<SaleShareList> selectShare(SaleShareList option) {
		Connection conn = getConnection();
		List<SaleShareList> list = new SaleShareBoardDao().selectShare(option,conn);
		close(conn);
		return list;
	}
	
	// 페이지카운트 - 나눔
	public int selectListShareCount(SaleShareList option) {
		Connection conn = getConnection();
		int result = new SaleShareBoardDao().selectBoardShareCount(option,conn);
		close(conn);
		return result;
	}
	
	// 카테고리 - 판매
	public List<SaleShareList> selectSale(SaleShareList option){
		Connection conn = getConnection();
		List<SaleShareList> list = new SaleShareBoardDao().selectSale(option,conn);
		close(conn);
		return list;
	}
	
	// 페이지카운트 - 판매
	public int selectListSellCount(SaleShareList option) {
		Connection conn = getConnection();
		int result = new SaleShareBoardDao().selectBoardSellCount(option,conn);
		close(conn);
		return result;
	}
	
	// 끌어올리기
	public int salePull(int postNo) {
		Connection conn = getConnection();
		int result = new SaleShareBoardDao().salePull(postNo,conn);
		close(conn);
		return result;
	}
	
	// 좋아요
	public int saleLike(SaleShareLike like) {
		Connection conn = getConnection();
		int result = new SaleShareBoardDao().saleLike(like,conn);
		close(conn);
		return result;
	}
	
	// 정렬 - 가격낮은 순
	public List<SaleShareList> selectArrayPrice() {
		Connection conn = getConnection();
		List<SaleShareList> list = new SaleShareBoardDao().selectArrayPrice(conn);
		close(conn);
		return list;
		}
	
	// 정렬 - 조회순
	public List<SaleShareList> selectArrayView(){
		Connection conn = getConnection();
		List<SaleShareList> list = new SaleShareBoardDao().selectArrayView(conn);
		close(conn);
		return list;
	}
	
	// 정렬 - 좋아요순
	public List<SaleShareList> selectArrayHeart(){
		Connection conn = getConnection();
		List<SaleShareList> list = new SaleShareBoardDao().selectArrayHeart(conn);
		close(conn);
		return list;
	}
	
	// 마이페이지 - 내가 쓴 글
	public List<SaleShareList> myPageList(int userNo){
		Connection conn = getConnection();
		List<SaleShareList> list = new SaleShareBoardDao().myPageList(userNo,conn);
		close(conn);
		return list;
	}
	
	// 마이페이지 - 내가 좋아요한 글
	public List<SaleShareList> myPageLkieList(int userNo){
		Connection conn = getConnection();
		List<SaleShareList> list = new SaleShareBoardDao().myPageLkieList(userNo,conn);
		close(conn);
		return list;
	}
	
	// 좋아요 상태 조회
	public boolean selectLike(SaleShareList option, int userNo) {
	    Connection conn = getConnection();
	    boolean result = new SaleShareBoardDao().selectLike(option, userNo, conn);
	    close(conn);
	    return result;
	}
}

