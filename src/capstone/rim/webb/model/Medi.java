package capstone.rim.webb.model;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString

public class Medi {
	private String user_id;
	private String medi_name;
	private String medi_type;
	private int IsDeleted;
	private int medi_id;
	private Date medi_open;
	private Date medi_until;

}