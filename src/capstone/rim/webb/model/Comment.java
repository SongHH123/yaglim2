package capstone.rim.webb.model;

import java.sql.Timestamp;

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
	private String comment_content;
	private Timestamp comment_regdate;
	
	private String user_id;
	private int post_id;
}