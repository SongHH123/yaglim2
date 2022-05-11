package capstone.rim.webb.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString


public class Authorities {
	private String user_id;
	private String authority="ROLE_USER";
}
