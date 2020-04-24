package model;

import java.io.Serializable;
import java.util.Date;

public class Page implements Serializable {

	private int currentPage; 
	private int startRow; 
	private int endRow; 
	private int count;
	private int pageSize; 
	private int number; 
	private int bottomLine; 
	private int startPage; 
	private int endPage; 
	private int pageCount;
	
	
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getBottomLine() {
		return bottomLine;
	}
	public void setBottomLine(int bottomLine) {
		this.bottomLine = bottomLine;
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
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	
	
	
	@Override
	public String toString() {
		return "Page [currentPage=" + currentPage + ", startRow=" + startRow + ", endRow=" + endRow + ", count=" + count
				+ ", pageSize=" + pageSize + ", number=" + number + ", bottomLine=" + bottomLine + ", startPage="
				+ startPage + ", endPage=" + endPage + ", pageCount=" + pageCount + "]";
	} 
	
	

	
}