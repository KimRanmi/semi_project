package com.cm.common;

public class Paging{
	
	// 전체 게시글 개수
	private int totalData;
	// 전체 페이지 개수
	private int totalPage;
	
	// 페이징바 크기
	private int pageBarSize = 5;
	// 페이징바, 페이지 시작, 끝
	private int pageBarStart;
	private int pageBarEnd;
	
	// 현재 페이지
	private int nowPage = 1;
	// 목록에 보여질 게시글 개수
	private int numPerPage = 10;
	// 쿼리에 사용할 LIMIT 값
	private int limitPageNo;
	
	// 이전, 다음 여부
	private boolean prev = true;
	private boolean next = true;
	public int getTotalData() {
		return totalData;
	}
	public void setTotalData(int totalData) {
		this.totalData = totalData;
		calcPaging();
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getPageBarSize() {
		return pageBarSize;
	}
	public void setPageBarSize(int pageBarSize) {
		this.pageBarSize = pageBarSize;
	}
	public int getPageBarStart() {
		return pageBarStart;
	}
	public void setPageBarStart(int pageBarStart) {
		this.pageBarStart = pageBarStart;
	}
	public int getPageBarEnd() {
		return pageBarEnd;
	}
	public void setPageBarEnd(int pageBarEnd) {
		this.pageBarEnd = pageBarEnd;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public int getLimitPageNo() {
		return limitPageNo;
	}
	public void setLimitPageNo(int limitPageNo) {
		this.limitPageNo = limitPageNo;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	} 
	
	// 전체 게시글 개수 set 해줬을 때 동작할 메소드
	private void calcPaging() {
		// 2번 페이지(11~20) -> 10,10
		// 3번 페이지(21~30) -> 20,10
		limitPageNo = (nowPage-1)*numPerPage;
		// 전체 페이지 개수(26 -> 3개 페이지) 
		// 26/10 -> 몫 -> 26개를 10개씩 묶었을 때 몇 묶음? -> 2
		totalPage = (int)Math.ceil((double)totalData/numPerPage);
		
		// 페이징바 시작&끝
		// 3번 페이지 -> 1번(페이지바 시작) -> 5(페이징바 끝)
		// 8번 페이지 -> 6번(페이징바 시작) -> 10(페이징바 끝)
		pageBarStart = ((nowPage-1)/pageBarSize)*pageBarSize + 1;
		System.out.println(pageBarStart);
		pageBarEnd = pageBarStart + pageBarSize - 1;
		if(pageBarEnd > totalPage) pageBarEnd = totalPage;
		
		// 이전, 다음
		if(pageBarStart == 1) prev = false; // 이전 없음
		if(pageBarEnd >= totalPage) next = false; // 다음 없음
		
	}
}
