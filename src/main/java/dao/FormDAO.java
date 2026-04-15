package dao;

import java.sql.*;
import db.DBConnection;

public class FormDAO {
	
	public void deleteForm(int formId) {

	    try {
	        Connection con = DBConnection.getConnection();

	        // ⚠️ delete in correct order (child → parent)

	        // delete answers
	        PreparedStatement ps1 = con.prepareStatement(
	            "DELETE a FROM answers a JOIN responses r ON a.response_id=r.id WHERE r.form_id=?");
	        ps1.setInt(1, formId);
	        ps1.executeUpdate();

	        // delete responses
	        PreparedStatement ps2 = con.prepareStatement(
	            "DELETE FROM responses WHERE form_id=?");
	        ps2.setInt(1, formId);
	        ps2.executeUpdate();

	        // delete options
	        PreparedStatement ps3 = con.prepareStatement(
	            "DELETE o FROM options o JOIN questions q ON o.question_id=q.id WHERE q.form_id=?");
	        ps3.setInt(1, formId);
	        ps3.executeUpdate();

	        // delete questions
	        PreparedStatement ps4 = con.prepareStatement(
	            "DELETE FROM questions WHERE form_id=?");
	        ps4.setInt(1, formId);
	        ps4.executeUpdate();

	        // finally delete form
	        PreparedStatement ps5 = con.prepareStatement(
	            "DELETE FROM forms WHERE id=?");
	        ps5.setInt(1, formId);
	        ps5.executeUpdate();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	// check if current user owns the form
	public boolean isOwner(int formId, int userId) {
	    boolean status = false;

	    try {
	        Connection con = DBConnection.getConnection();

	        String sql = "SELECT * FROM forms WHERE id=? AND created_by=?";
	        PreparedStatement ps = con.prepareStatement(sql);

	        ps.setInt(1, formId);
	        ps.setInt(2, userId);

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            status = true;
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return status;
	}

    public int createForm(String title, int userId) {
        int formId = 0;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO forms(title, created_by) VALUES(?,?)";
            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, title);
            ps.setInt(2, userId);

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                formId = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return formId;
    }
}