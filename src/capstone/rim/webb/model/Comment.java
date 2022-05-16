package capstone.rim.webb.model;

import java.sql.Timestamp;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Comment {
	private int comment_id;
	
	@Size(min =2, max =50, message ="최소 한글자 이상의 문자를 입력해주세요.")
	private String comment_content;
	
	private Timestamp comment_regdate;
	
	private String user_id;
	private int post_id;
	private int c_IsDeleted; 
}