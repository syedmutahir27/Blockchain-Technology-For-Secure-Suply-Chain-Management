package com.bean;

import java.io.InputStream;

public class SentBean {

	private String fid, content;
	private InputStream fi;
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public InputStream getFi() {
		return fi;
	}
	public void setFi(InputStream fi) {
		this.fi = fi;
	}
}
