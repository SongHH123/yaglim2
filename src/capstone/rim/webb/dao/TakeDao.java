package capstone.rim.webb.dao;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import javax.sql.DataSource;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import capstone.rim.webb.model.Board;
import capstone.rim.webb.model.Comment;
import capstone.rim.webb.model.Medi;
import capstone.rim.webb.model.Post;
import capstone.rim.webb.model.User;
import capstone.rim.webb.model.Medilist;
import capstone.rim.webb.model.Authorities;

@Repository("takeDao")
public class TakeDao {
	
	//Take and insert post
	private JdbcTemplate jdbcTemplate;
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	//Board
	public List<Board> getBoard(){
		String sqlStatement = "select * from board";
		return jdbcTemplate.query(sqlStatement, new RowMapper <Board>() {
			@Override
			public Board mapRow(ResultSet rs, int rowNum) throws SQLException{
				Board board = new Board();
				board.setBoard_title(rs.getInt("category_title"));
				board.setBoard_category(rs.getString("category"));
				return board;
			}
		});
	}
	
	//Post
	public int getRowPost() {
		String sqlStatement ="select count(*) from post";
		return jdbcTemplate.queryForObject(sqlStatement, Integer.class);
	}
	
	//원하는 위치의 삭제X 포스트 갯수
	public int getRowPostWhere() {
		String sqlStatement ="select count(*) from post where not IsDeleted=1";
		return jdbcTemplate.queryForObject(sqlStatement, Integer.class);
	}//원하는 위치의 삭제X 포스트 갯수
	public int getRowPostWhere_board(int board_title) {
		String sqlStatement ="select count(*) from post where not IsDeleted=1 and board_title="+ board_title;
		return jdbcTemplate.queryForObject(sqlStatement, Integer.class);
	}
	
	//게시물 한 페이지에 10개씩 보여주기 페이징 코드입니둥, page-1 받아 *10 한 게시글부터 10개 출력
	public List <Post> getPostLimit(String nowPage){
		String miPage= Integer.toString( Integer.parseInt(nowPage) *10 );
		String sqlStatement = "select * from post where not IsDeleted=1 ORDER BY post_regdate DESC limit "+miPage+",10";
		return jdbcTemplate.query(sqlStatement, new RowMapper <Post>() {
			@Override
			public Post mapRow(ResultSet rs, int rowNum) throws SQLException{
				Post post = new Post();
				post.setPost_id(rs.getInt("post_id"));
				post.setPost_content(rs.getString("post_content"));
				post.setPost_regdate(rs.getTimestamp("post_regdate"));
				post.setIsDeleted(rs.getInt("IsDeleted"));
				post.setPost_title(rs.getString("post_title"));
				post.setUser_id(rs.getString("user_id"));
				post.setBoard_title(rs.getInt("board_title"));
				return post;
			}
		});
	}
	
	
	public List <Post> getPost(){
		String sqlStatement = "select * from post where not IsDeleted=1 ORDER BY post_regdate DESC";
		return jdbcTemplate.query(sqlStatement, new RowMapper <Post>() {
			@Override
			public Post mapRow(ResultSet rs, int rowNum) throws SQLException{
				Post post = new Post();
				post.setPost_id(rs.getInt("post_id"));
				post.setPost_content(rs.getString("post_content"));
				post.setPost_regdate(rs.getTimestamp("post_regdate"));
				post.setIsDeleted(rs.getInt("IsDeleted"));
				post.setPost_title(rs.getString("post_title"));
				post.setUser_id(rs.getString("user_id"));
				post.setBoard_title(rs.getInt("board_title"));
				return post;
			}
		});
	}
	public List <Post> getPost_board(int board_title){
		String sqlStatement = "select * from post where not IsDeleted=1 and board_title="+board_title+" ORDER BY post_regdate DESC";
		return jdbcTemplate.query(sqlStatement, new RowMapper <Post>() {
			@Override
			public Post mapRow(ResultSet rs, int rowNum) throws SQLException{
				Post post = new Post();
				post.setPost_id(rs.getInt("post_id"));
				post.setPost_content(rs.getString("post_content"));
				post.setPost_regdate(rs.getTimestamp("post_regdate"));
				post.setIsDeleted(rs.getInt("IsDeleted"));
				post.setPost_title(rs.getString("post_title"));
				post.setUser_id(rs.getString("user_id"));
				post.setBoard_title(rs.getInt("board_title"));
				return post;
			}
		});
	}
	public List <Post> getPost_search(String table, String search){
		String sqlStatement = "select * from post where not IsDeleted=1 and "+table+" like '%"+search+"%' ORDER BY post_regdate DESC";
		return jdbcTemplate.query(sqlStatement, new RowMapper <Post>() {
			@Override
			public Post mapRow(ResultSet rs, int rowNum) throws SQLException{
				Post post = new Post();
				post.setPost_id(rs.getInt("post_id"));
				post.setPost_content(rs.getString("post_content"));
				post.setPost_regdate(rs.getTimestamp("post_regdate"));
				post.setIsDeleted(rs.getInt("IsDeleted"));
				post.setPost_title(rs.getString("post_title"));
				post.setUser_id(rs.getString("user_id"));
				post.setBoard_title(rs.getInt("board_title"));
				return post;
			}
		});
	}
	public List <Post> getPost_search_inBoard(int board_title, String table, String search){
		String sqlStatement = "select * from post where not IsDeleted=1 and board_title="+ board_title +" and "+ table +" like '%"+search+"%' ORDER BY post_regdate DESC";
		return jdbcTemplate.query(sqlStatement, new RowMapper <Post>() {
			@Override
			public Post mapRow(ResultSet rs, int rowNum) throws SQLException{
				Post post = new Post();
				post.setPost_id(rs.getInt("post_id"));
				post.setPost_content(rs.getString("post_content"));
				post.setPost_regdate(rs.getTimestamp("post_regdate"));
				post.setIsDeleted(rs.getInt("IsDeleted"));
				post.setPost_title(rs.getString("post_title"));
				post.setUser_id(rs.getString("user_id"));
				post.setBoard_title(rs.getInt("board_title"));
				return post;
			}
		});
	}
	public boolean insertPost(Post post) {
		int post_id= (getRowPost() + 1);
		String post_content= post.getPost_content();
		Timestamp post_regdate= new Timestamp(System.currentTimeMillis());
		int IsDeleted= 0;
		String post_title= post.getPost_title();
		int board_title=post.getBoard_title();
		String user_id= post.getUser_id();
		
		String sqlStatement = "insert into post (post_id, post_content, post_regdate, IsDeleted, post_title, board_title, user_id) value (?,?,?,?,?,?,?)";
		
		return (jdbcTemplate.update(sqlStatement,
				new Object[] { post_id, post_content, post_regdate, IsDeleted, post_title, board_title, user_id }) == 1);
	
	}
	public boolean updatePost(Post post) {
		int post_id= post.getPost_id();
		String post_content= post.getPost_content();
		Timestamp post_regdate= new Timestamp(System.currentTimeMillis());
		int IsDeleted= post.getIsDeleted();
		String post_title= post.getPost_title();
		String user_id= post.getUser_id();
		int board_title=post.getBoard_title();

		String sqlStatement = "update post set post_content=?, post_regdate=?, post_title=?, board_title=? where post_id=?";

		return (jdbcTemplate.update(sqlStatement,
				new Object[] { post_content, post_regdate, post_title, board_title, post_id}) == 1);

	}
	public boolean deletePost(int post_id2) {
		int post_id= post_id2;
		int IsDeleted = 1;
		
		String sqlStatement = "update post set IsDeleted= ? where post_id=" + post_id;
		return (jdbcTemplate.update(sqlStatement, new Object[] { IsDeleted }) == 1);

	}

	public List <Post> getPost_one(int post_id2){
		String sqlStatement = "select post_id, post_content, post_regdate, post_title,user_id, Board_title from post where post_id =" + post_id2; //where board_id 추가
		return jdbcTemplate.query(sqlStatement, new RowMapper <Post>() {
			@Override
			public Post mapRow(ResultSet rs, int rowNum) throws SQLException{
				Post post = new Post();
				post.setPost_id(rs.getInt("post_id"));
				post.setPost_content(rs.getString("post_content")); 
				post.setPost_regdate(rs.getTimestamp("post_regdate"));
				post.setPost_title(rs.getString("post_title"));
				post.setUser_id(rs.getString("user_id"));
				post.setBoard_title(rs.getInt("board_title"));
				return post;
			}
		});
	}
	

	//Comment
	public int getRowComment() {
		String sqlStatement ="select count(*) from comment";
		return jdbcTemplate.queryForObject(sqlStatement, Integer.class);
	}
	public List <Comment> getComment(int P_id){
		String sqlStatement = "select * from comment where post_id ="+ P_id +" and c_IsDeleted = 0";
		return jdbcTemplate.query(sqlStatement, new RowMapper <Comment>() {
			@Override
			public Comment mapRow(ResultSet rs, int rowNum) throws SQLException{
				Comment comment = new Comment();
				comment.setComment_id(rs.getInt("comment_id"));
				comment.setComment_content(rs.getString("comment_content"));
				comment.setComment_regdate(rs.getTimestamp("comment_regdate"));
				comment.setUser_id(rs.getString("user_id"));
				//comment.setC_IsDeleted(rs.getInt("c_IsDeleted"));
				return comment;
			}
		});
	}
	
	//insert comment
	public boolean insertComment(Comment comment) {
		int comment_id= (getRowComment() + 1);
		String comment_content= comment.getComment_content();
		Timestamp comment_regdate= new Timestamp(System.currentTimeMillis());
		int c_IsDeleted= 0;
		int post_id= comment.getPost_id();
		String user_id= comment.getUser_id();
		
		String sqlStatement = "insert into comment (comment_id, comment_content, comment_regdate, post_id, user_id, c_IsDeleted) value (?,?,?,?,?,?)";
		
		return (jdbcTemplate.update(sqlStatement,
				new Object[] { comment_id, comment_content, comment_regdate, post_id, user_id, c_IsDeleted }) == 1);
	
	}

	public boolean deleteComment(int comment_id) {
		int del_comment_id= comment_id;
		
		String sqlStatement = "update comment set c_IsDeleted= 1 where comment_id = " + del_comment_id;
		return (jdbcTemplate.update(sqlStatement) == 1);

	}	
	
	public boolean insertUser(User user) {
		String user_id = user.getUser_id();
		String user_pw = "{noop}" + user.getUser_pw();
		int user_phone = user.getUser_phone();
		int enabled = 1;
		
		String sqlStatement = "insert into user (user_id, user_pw, user_phone, enabled) value (?, ?, ?, ?)";
		return (jdbcTemplate.update(sqlStatement,
				new Object[] { user_id, user_pw, user_phone, enabled }) == 1);
	}
	
	public boolean insertUserAuth(String user_id1, Authorities auth) {
		String user_id = user_id1;
		String authority= "ROLE_USER";
		
		String sqlStatement = "insert into authorities (user_id, authority) value (?, ?)";
		return (jdbcTemplate.update(sqlStatement,
				new Object[] { user_id1, authority}) == 1);
	}
	
	
	
	//medi
		public int getRowMedi() {
			String sqlStatement ="select count(*) from medi";
			return jdbcTemplate.queryForObject(sqlStatement, Integer.class);
		}
		public List <Medi> getMedi(){
			String sqlStatement = "select * from medi where not IsDeleted=1";
			return jdbcTemplate.query(sqlStatement, new RowMapper <Medi>() {
				@Override
				public Medi mapRow(ResultSet rs, int rowNum) throws SQLException{
					Medi medi = new Medi();
					medi.setMedi_name(rs.getString("medi_name"));
					medi.setMedi_type(rs.getString("medi_type"));
					medi.setMedi_open(rs.getDate("medi_open"));
					medi.setMedi_until(rs.getDate("medi_until"));
					medi.setUser_id(rs.getString("user_id"));
					medi.setIsDeleted(rs.getInt("IsDeleted"));
					medi.setMedi_id(rs.getInt("medi_id"));
					return medi;
				}
			});
		}
		
	//medi_list_상비약 목록
		public int getRowMediList() {
			String sqlStatement ="select count(*) from medi";
			return jdbcTemplate.queryForObject(sqlStatement, Integer.class);
		}
		public List <Medilist> getMediList(){
			String sqlStatement = "select * from medilist";
			return jdbcTemplate.query(sqlStatement, new RowMapper <Medilist>() {
				@Override
				public Medilist mapRow(ResultSet rs, int rowNum) throws SQLException{
					Medilist medilist = new Medilist();
					medilist.setMedilist_id(rs.getInt("medilist_id"));
					medilist.setMedi_name(rs.getString("medi_name"));
					return medilist;
				}
			});
		}

	//medi insert
		public boolean insertMedi(Medi medi) {
			int medi_id = (getRowMedi() +1);
			String medi_name = medi.getMedi_name();
			String user_id = medi.getUser_id();
			Date medi_open = medi.getMedi_open();
			Date medi_until = medi.getMedi_until();
			String medi_type = medi.getMedi_type();
			
			int isDeleted = 0;
			
			String sqlStatement = "insert into medi (`medi_id`, `medi_name`, `medi_open`, `medi_until`, `isDeleted`, `medi_type`, `user_id`) VALUES (?, ?, ?, ?, ?, ?, ?)";
			return (jdbcTemplate.update(sqlStatement,
					new Object[] { medi_id, medi_name, medi_open, medi_until, isDeleted, medi_type, user_id }) == 1);
		}
		
		public boolean deleteMedi(String user_id, int medi_id) {
			int del_medi_id = medi_id;
			String del_user_id = user_id;
			
			int isDeleted = 1;
			
			String sqlStatement = "update Medi set isDeleted = ? where medi_id="  + del_medi_id +" and user_id='" + del_user_id+"'";
			return (jdbcTemplate.update(sqlStatement, new Object[] { isDeleted }) == 1);
		}
	
}
