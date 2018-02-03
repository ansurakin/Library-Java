package ru.alexander.library.beans;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import ru.alexander.library.db.Database;

public class AuthorList {

    private ArrayList<Author> authorList = new ArrayList<>();

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    public ArrayList<Author> getAuthors() {
        try {
            conn = Database.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM author ORDER BY fio");
            while (rs.next()) {
                Author author = new Author();
                author.setName(rs.getString("fio"));
                this.authorList.add(author);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AuthorList.class.getName()).log(Level.SEVERE, null, ex);
        }
//        finally {
//            if (rs != null) {
//                try {
//                    rs.close();
//                } catch (SQLException ex) {
//                    Logger.getLogger(AuthorList.class.getName()).log(Level.SEVERE, null, ex);
//                }
//            }
//            if (stmt != null) {
//                try {
//                    stmt.close();
//                } catch (SQLException ex) {
//                    Logger.getLogger(AuthorList.class.getName()).log(Level.SEVERE, null, ex);
//                }
//            }
//            if (conn != null) {
//                try {
//                    conn.close();
//                } catch (SQLException ex) {
//                    Logger.getLogger(AuthorList.class.getName()).log(Level.SEVERE, null, ex);
//                }
//            }
//        }
        return authorList;
    }

    public ArrayList<Author> getAuthorList() {
        if (!this.authorList.isEmpty()) {
            return this.authorList;
        } else {
            return getAuthors();
        }
    }

}
