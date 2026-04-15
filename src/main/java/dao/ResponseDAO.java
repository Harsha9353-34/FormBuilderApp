package dao;

import java.sql.*;
import db.DBConnection;

public class ResponseDAO {

    public int createResponse(int formId, int userId) {
        int responseId = 0;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO responses(form_id, user_id) VALUES(?,?)";
            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, formId);
            ps.setInt(2, userId);
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                responseId = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return responseId;
    }

    public void saveAnswer(int responseId, int questionId, String answer) {

        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO answers(response_id, question_id, answer_text) VALUES(?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, responseId);
            ps.setInt(2, questionId);
            ps.setString(3, answer);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}