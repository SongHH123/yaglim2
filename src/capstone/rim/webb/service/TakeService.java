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
	
	
	public List<Comment> getComment(){
		return takeDao.getComment();
	}
	
	public void insertComment(Comment comment) {
		takeDao.insertComment(comment);
	}
	
	public void updateComment(Comment comment) {
		takeDao.updateComment(comment);
	}
	
	
	public List<Board> getBoard(){
		return takeDao.getBoard();
	}

	public List<Post> getPost_one(int post_id2) {
		// TODO Auto-generated method stub
		return takeDao.getPost_one(post_id2);
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
}
