package capstone.rim.webb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import capstone.rim.webb.dao.TakeDao;
import capstone.rim.webb.model.Authorities;
import capstone.rim.webb.model.Board;
import capstone.rim.webb.model.Comment;
import capstone.rim.webb.model.Post;
import capstone.rim.webb.model.User;
import capstone.rim.webb.model.medi;
import capstone.rim.webb.model.medilist;

@Service
public class TakeService {
	@Autowired
	private TakeDao takeDao;
	
	public List<Post> getPost(){
		return takeDao.getPost();
	}
	
	public void insertPost(Post post) {
		takeDao.insertPost(post);
	}
	
	
	public List<Comment> getComment(int P_id){
		return takeDao.getComment(P_id);
	}
	
	public void insertComment(Comment comment) {
		takeDao.insertComment(comment);
	}
	
	public void deleteComment(int comment_id) {
		takeDao.deleteComment(comment_id);
	}
	
	public List<Board> getBoard(){
		return takeDao.getBoard();
	}

	public List<Post> getPost_one(int post_id2) {
		// TODO Auto-generated method stub
		return takeDao.getPost_one(post_id2);
	}
	public List<Post> getPost_board(int board_title){
		return takeDao.getPost_board(board_title);
	}
	public List<Post> getPost_search(String table, String search){
		return takeDao.getPost_search(table, search);
	}
	public void insertUser(User user){
		takeDao.insertUser(user);
	}

	public void insertUserAuth(String user_id1, Authorities auth) {
		takeDao.insertUserAuth(user_id1, auth);
	}
	public void updatePost(Post post) {
		takeDao.updatePost(post);
	}
	public void deletePost(int post_id) {
		takeDao.deletePost(post_id);
	}
	public List<medi> getMedi(){
		return  takeDao.getMedi();
	}
	public List<medilist> getMediList(){
		return  takeDao.getMediList();
	}
}
