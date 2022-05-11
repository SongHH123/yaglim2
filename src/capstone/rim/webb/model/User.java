package capstone.rim.webb.model;

import javax.validation.constraints.NotEmpty;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@ToString

public class User {
	
	@NotEmpty(message="id를 작성해주세요")
	private String user_id;
	
	private int user_phone;
	
	@NotEmpty(message="비밀번호를 작성해주세요")
	private String user_pw;
	
	private int enabled;
}
