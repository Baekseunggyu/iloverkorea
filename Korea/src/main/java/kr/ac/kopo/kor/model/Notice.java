package kr.ac.kopo.kor.model;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Notice {

	private int noticeId;
	private String nWriter;
	private String nSubject;
	private String nContent;

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")

	private Date nDate;
	private int nviewCnt;
	private String id;

	public int getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}

	public String getnWriter() {
		return nWriter;
	}

	public void setnWriter(String nWriter) {
		this.nWriter = nWriter;
	}

	public String getnSubject() {
		return nSubject;
	}

	public void setnSubject(String nSubject) {
		this.nSubject = nSubject;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public Date getnDate() {
		return nDate;
	}

	public void setnDate(Date nDate) {
		this.nDate = nDate;
	}

	public int getNviewCnt() {
		return nviewCnt;
	}

	public void setNviewCnt(int nviewCnt) {
		this.nviewCnt = nviewCnt;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}