package dao;

import java.sql.*;
import db.DBConnection;

public class QuestionDAO {

    public void addQuestion(int formId, String question, String type, String opt1, String opt2) {

        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO questions(form_id, question_text, type, required) VALUES(?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, formId);
            ps.setString(2, question);
            ps.setString(3, type);
            ps.setBoolean(4, true);

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            int questionId = 0;

            if (rs.next()) {
                questionId = rs.getInt(1);
            }

            // Save options for MCQ
            if (type.equals("mcq")) {
                String optSql = "INSERT INTO options(question_id, option_text) VALUES(?,?)";

                PreparedStatement ps2 = con.prepareStatement(optSql);
                ps2.setInt(1, questionId);
                ps2.setString(2, opt1);
                ps2.executeUpdate();

                ps2.setString(2, opt2);
                ps2.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}