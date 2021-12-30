package costomer.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tech.db.DBcon;

//Data Access Object from here get the values from db and put those on Notice and return Notice type object 'n' to noticeDetail or noticeEdit  
import costomer.vo.Notice;

public class NoticeDao {
	
	//the notices have multiple rows of record so List is needed
	public List<Notice> noticeSelAll(String field, String query) throws Exception {
		//think elastically you can put variable in between String
		//String sql="select * from notices order by to_number(seq) desc";
		String sql="select * from notices where "+field+" like ? order by to_number(seq) desc";
		//dbcon
		Connection con=DBcon.getConnection();
		//execute
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, "%"+query+"%");

		//result
		ResultSet rs=pstmt.executeQuery();
		
		//putting Notice records on List
		List<Notice> list=new ArrayList<Notice>();
		while(rs.next()) {
			Notice n=new Notice();
			n.setSeq(rs.getString("seq"));
			n.setTitle(rs.getString("title"));
			n.setWriter(rs.getString("writer"));
			n.setRegdate(rs.getDate("regdate"));
			n.setHit(rs.getInt("hit"));
			n.setContent(rs.getString("content"));
			list.add(n);
		}
		rs.close();
		pstmt.close();
		con.close();
		return list;
	}
	
	
	public int delete(String seq) throws Exception {
		String sql="delete from notices where seq=?";

		Connection con=DBcon.getConnection();
		
		//execute
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, seq);

		int del=pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		return del;
	}
	
	//the values here is from noticeReg>noticeRegProc(put into Notice object)>dao
	public int write(Notice nc) throws Exception {

			String sql="insert into notices values("
			+"(select max(to_number(seq))+1 from notices)"
			+",?,'cj',sysdate,0,?)";
			
			
			//dbconnect
			Connection con=DBcon.getConnection();
			
			//execute
			PreparedStatement pstmt=con.prepareStatement(sql);
			pstmt.setString(1, nc.getTitle());
			pstmt.setString(2, nc.getContent());
			
			
			int af=pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
			
		return af;
	}
	
	//getting the changed values by variables
public int update2(String s, String t, String c) throws Exception  {
		
		String sql="update notices"
				+" set title=?,content=?"
				+" where seq=?";

		        Connection con=DBcon.getConnection();

				//execute
				PreparedStatement pstmt=con.prepareStatement(sql);
				pstmt.setString(1, t);
				pstmt.setString(2, c);
				pstmt.setString(3, s);
				
				int af=pstmt.executeUpdate();
				
				pstmt.close();
				con.close();
		return af;
		
	}
	
//getting the changed values by object
	public int update(Notice notice) throws Exception  {
		
		String sql="update notices"
				+" set title=?,content=?"
				+" where seq=?";

		        Connection con=DBcon.getConnection();

				//execute
				PreparedStatement pstmt=con.prepareStatement(sql);
				pstmt.setString(1, notice.getTitle());
				pstmt.setString(2, notice.getContent());
				pstmt.setString(3, notice.getSeq());
				
				int af=pstmt.executeUpdate();
				
				System.out.println("af : "+af);
				pstmt.close();
				con.close();
				
		return af;
		
	}
	
	//the seq this receives is from notice.jsp>notice
	public Notice getNotice(String seq) throws Exception {
		
		String sql="select * from notices where seq="+seq;

		Connection con=DBcon.getConnection();
		
		//execute
		Statement st=con.createStatement();

		//result
		ResultSet rs=st.executeQuery(sql);

		rs.next();
		
		//Notice is where you put selected Resultset
		Notice n=new Notice();
		
		n.setSeq(rs.getString("seq"));
		n.setWriter(rs.getString("writer"));
		n.setTitle(rs.getString("title"));
		n.setContent(rs.getString("content"));
		n.setRegdate(rs.getDate("regdate"));
		n.setHit(rs.getInt("seq"));
		
		rs.close();
		st.close();
		con.close();
		
		return n;
		

	}

	

}
