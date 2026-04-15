package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/form_builder";
    private static final String USER = "root";
    private static final String PASSWORD = "Root@1234";
    
    public static Connection getConnection() {
        try {
            // Load driver (safe for your setup)
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(URL, USER, PASSWORD);

            if (con != null) {
                System.out.println("✅ Database connected successfully");
                return con;
            } else {
                throw new RuntimeException("❌ Connection returned null");
            }

        } catch (ClassNotFoundException e) {
            throw new RuntimeException("❌ MySQL JDBC Driver not found. Add the JAR file.", e);

        } catch (SQLException e) {
            throw new RuntimeException("❌ Database connection failed. Check URL/username/password.", e);
        }
    }
}