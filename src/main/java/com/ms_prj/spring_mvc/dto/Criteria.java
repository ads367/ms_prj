package com.ms_prj.spring_mvc.dto;

import org.springframework.web.util.UriComponentsBuilder;

public class Criteria {

	private int page;				// 보여줄 페이지 번호
	private int perPageNum;			// 페이지당 보여줄 게시글의 개수
	private String searchOption;	// 검색 옵션
	private String keyword;			// 검색어
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 5;
		this.searchOption = null;
		this.keyword = null;
	}
	public int getPageStart() {		// 특정 페이지의 게시글 시작 번호
		return (this.page - 1) * perPageNum;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {	// 페이지가 음수값이 되지 않게 설정
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {		// 페이지당 보여줄 게시글 수가 변하지 않게 설정
		if(perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 5;
			return;
		}
		this.perPageNum = perPageNum;
	}
	public String getSearchOption() {
		return searchOption;
	}
	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String makeQuery() {
		UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.newInstance()
										.queryParam("page", page)
										.queryParam("perPageNum", this.perPageNum);
		if(searchOption != null) {
			uriComponentsBuilder
						.queryParam("searchOption", this.searchOption)
						.queryParam("keyword", this.keyword);
		}
		return uriComponentsBuilder.build().encode().toString();
	}
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", searchOption=" + searchOption + ", keyword="
				+ keyword + "]";
	}
}
