package ru.alexander.library.testconnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class TestConnection {

    public void check() {
        try {
            InitialContext ic = new InitialContext();
            DataSource ds = (DataSource)ic.lookup("jdbc/Library_java");
            Connection conn  = ds.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM book");
            while (rs.next()) {
                System.out.println(rs.getString("name"));
                
            }
            
        } catch (NamingException | SQLException ex) {
            Logger.getLogger(TestConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
}
