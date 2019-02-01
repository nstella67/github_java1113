package net.notice;

public class NoticeDTO {
	private int noticeno;
	private String subject;
	private String content;
	private String regdt;
	private String nid;
	private String passwd;
	/**
	 * @return the noticeno
	 */
	public int getNoticeno() {
		return noticeno;
	}
	/**
	 * @param noticeno the noticeno to set
	 */
	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}
	/**
	 * @return the subject
	 */
	public String getSubject() {
		return subject;
	}
	/**
	 * @param subject the subject to set
	 */
	public void setSubject(String subject) {
		this.subject = subject;
	}
	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * @return the regdt
	 */
	public String getRegdt() {
		return regdt;
	}
	/**
	 * @param regdt the regdt to set
	 */
	public void setRegdt(String regdt) {
		this.regdt = regdt;
	}
	/**
	 * @return the nid
	 */
	public String getNid() {
		return nid;
	}
	/**
	 * @param nid the nid to set
	 */
	public void setNid(String nid) {
		this.nid = nid;
	}
	
	/**
	 * @return the passwd
	 */
	public String getPasswd() {
		return passwd;
	}
	/**
	 * @param passwd the passwd to set
	 */
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "NoticeDTO [noticeno=" + noticeno + ", subject=" + subject + ", content=" + content + ", regdt=" + regdt
				+ ", nid=" + nid + ", passwd=" + passwd + "]";
	}
	
	
}//class end
