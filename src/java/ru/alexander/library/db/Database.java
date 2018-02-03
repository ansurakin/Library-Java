package ru.alexander.library.db;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Database {

    private static Connection conn;
    private static InitialContext ic;
    private static DataSource ds;

    public static Connection getConnection() throws NamingException, SQLException {
        ic = new InitialContext();
        ds = (DataSource) ic.lookup("jdbc/Library_java");
        if (conn == null) {
            conn = ds.getConnection();
        }
        return conn;
    }

}
