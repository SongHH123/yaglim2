package capstone.rim.webb.model;

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
	private String comment_regdate;
	private String user_id;
}