package kr.co.sist.board;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class RangeDTO {
	private int startNum, endNum; //시작번호 끝번호
	private String field, keyword; //카테고리, 키워드
	private String fieldStr; //검색필드의 문자열
	private String url;
	private int currentPage=1; //현재 페이지
	private int totalPage=0; //총 페이지

	public String getFieldStr() {
		String[] fieldTitle = {"title","content","id"};
		int tempFiled=Integer.parseInt(field);
		if(!(tempFiled>0 && tempFiled<4)) {
			tempFiled=1;
		}
		fieldStr = fieldTitle[tempFiled-1];
		return fieldStr;
	}


	
	
}
