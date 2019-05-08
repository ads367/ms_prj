package com.ms_prj.spring_mvc.dto;

import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

	private Criteria cri;
    private int totalCount;			// 게시판 전체 데이터 개수
    private int startPage;			// 현재 화면에서 보이는 startPage 번호
    private int endPage;			// 현재 화면에 보이는 endPage 번호
    private boolean prev;			// 페이징 이전 버튼 활성화 여부
    private boolean next;			// 페이징 다음 버튼 활성화 여부
    private int displayPageNum = 2;		// 게시판 화면에 보여질 페이지 개수
    
    public PageMaker(Criteria cri) {
    	this.cri = cri;
    }
    public Criteria getCri() {
        return cri;
    }
    public void setCri(Criteria cri) {
        this.cri = cri;
    }
    public int getTotalCount() {
        return totalCount;
    }
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        calcData();			// 총 게시글의 수를 셋팅할 때 calcData() 메소드를 호출하여 페이징 관련 버튼 계산
    }
    private void calcData() {		// 페이징의 버튼들을 생성하는 계산식
    	
        endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
        // Math.ceil() - 소수점 이하를 올림
        // Math.floor() - 소수점 이하를 버림
        // Math.round() - 소수점 이하를 반올림
        startPage = (endPage - displayPageNum) + 1;
        
        int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
        
        if(endPage > tempEndPage) {
        	endPage = tempEndPage;
        }
        
        prev = startPage == 1 ? false : true;
        
        next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
        
    }
    public int getStartPage() {
        return startPage;
    }
    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }
    public int getEndPage() {
        return endPage;
    }
    public void setEndPage(int endPage) {
        this.endPage = endPage;
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
    public int getDisplayPageNum() {
        return displayPageNum;
    }
    public void setDisplayPageNum(int displayPageNum) {
        this.displayPageNum = displayPageNum;
    }
    public String makeQuery(int page) {				// URI를 생성해주는 메소드
    	UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.newInstance()
    					.queryParam("page", page)
    					.queryParam("perPageNum", this.cri.getPerPageNum());
    	if(this.cri.getSearchOption() != null) {
    		uriComponentsBuilder
    					.queryParam("searchOption", this.cri.getSearchOption())
    					.queryParam("keyword", this.cri.getKeyword());
    	}
    	return uriComponentsBuilder.build().encode().toString();
    }
	
}
