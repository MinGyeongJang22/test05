package vo;

import org.springframework.web.multipart.MultipartFile;

public class BankVO {
	// ttb : 받을때, tts : 보낼 때, cur_nm : 국가/통화명
	private String ttb, tts, cur_nm;

	public String getTtb() {
		return ttb;
	}

	public void setTtb(String ttb) {
		this.ttb = ttb;
	}

	public String getTts() {
		return tts;
	}

	public void setTts(String tts) {
		this.tts = tts;
	}

	public String getCur_nm() {
		return cur_nm;
	}

	public void setCur_nm(String cur_nm) {
		this.cur_nm = cur_nm;
	}
}
