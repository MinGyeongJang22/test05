package ex;

import java.util.List;

public class MyList {
	List list;
	//제네릭을 사용하지 않는 경우 Spring은 <value> 태그의 모든 값을 문자열로 처리한다
	
	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}
}
