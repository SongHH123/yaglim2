package capstone.rim.webb.model;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import javax.validation.constraints.NotEmpty;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * @author 유다경
 *
 */

@Setter
@Getter
@NoArgsConstructor
@ToString
public class Post {
	private int post_id;
	
	@NotEmpty(message="게시글 내용을 작성해주세요")
	private String post_content;
	
	private Timestamp post_regdate;
	private int IsDeleted;
	
	@NotEmpty(message="게시글 제목을 작성해주세요")
	private String post_title;
	
	private String user_id;
	private int board_title;
	
}