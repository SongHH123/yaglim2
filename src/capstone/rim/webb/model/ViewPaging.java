package capstone.rim.webb.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@NoArgsConstructor
@ToString

public class ViewPaging {
	
	//현재 페이지
	private int nowPage;
	
	//전체 게시물 수
	private int row_post;

	//정수출력, 한 페이지에 post 10개씩 위한 페이징, row_post/10;
	//전체 페이지 갯수
	private int splitPage;
	
	//이전, 다음 페이지의 여부( 화살표..)
	private boolean pre, next_page;
	
	
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public void setRow_post(int row_post) {
		this.row_post = row_post;
	}
	public void setSplitPage(int row_post) {
		
		if ( row_post %10 >0 ) {//10개시물 단위로 끊어 페이지..17개라면 +1 페이지.
			this.splitPage = row_post/10 + 1;
		}
		this.splitPage = row_post/10;
	}
	
	public void setPre(int nowPage) {
		if (nowPage>10) {
			this.pre = true;
		}
		else this.pre=false;
	}
	public void setNext_page(int nowPage,int row_post, int splitPage ) {
		
		if (nowPage/10 < splitPage/10 ) {
			this.next_page = true;
		}
		else this.next_page=false;
	}


}
