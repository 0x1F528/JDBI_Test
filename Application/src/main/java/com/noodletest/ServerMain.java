package com.noodletest;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.microsoft.sqlserver.jdbc.SQLServerDriver;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.servlet.ServletHolder;
import org.eclipse.jetty.webapp.WebAppContext;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.result.ResultBearing;
import org.jdbi.v3.core.result.ResultIterable;
import org.jdbi.v3.core.statement.OutParameters;
import org.jdbi.v3.core.statement.Query;

import java.net.URL;
import java.sql.*;
import java.util.*;

public class ServerMain {


    public static void main(String[] args) throws Exception {
        Jdbi jdbi = Jdbi.create("jdbc:sqlserver://localhost;databaseName=NoodleBase;encrypt=false", "NoodleUser", "Password1");

        test_jdbi_query(jdbi);
        test_jdbc_sproc();
        test_jdbi_sproc(jdbi);
    }

    public static void test_jdbi_query(Jdbi jdbi) {
        List<Map<String, Object>> results = jdbi.withHandle(handle -> {
            String sql = "Select * from Noodle";
            Query query = handle.createQuery(sql);
            return query.mapToMap().list();
        });
        for (Map<String, Object> row : results) {
            System.out.println("--> " + row.get("id") + " - " + row.get("content"));
        }
    }

    public static void test_jdbc_sproc() {

        String jdbcUrl = "jdbc:sqlserver://localhost;databaseName=NoodleBase;encrypt=false";
        String username = "NoodleUser";
        String password = "Password1";

        try (Connection connection = DriverManager.getConnection(jdbcUrl, username, password)) {
            // Specify the stored procedure call with placeholders for parameters
            String storedProcedureCall = "{CALL Noodle_Get()}";

            try (CallableStatement callableStatement = connection.prepareCall(storedProcedureCall)) {
                // Execute the stored procedure
                ResultSet resultSet = callableStatement.executeQuery();

                ResultSetMetaData md = resultSet.getMetaData();

                while (resultSet.next()) {
                    System.out.println("==> " + resultSet.getString("id") + " = " + resultSet.getString("content"));
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void test_jdbi_sproc(Jdbi jdbi) {

        Map<String, Object> results = jdbi.withHandle(handle -> {
            OutParameters query = handle.createCall("{call Noodle_Get () }").invoke();

            ResultBearing resultBearing = query.getRowSet(0);

            if (resultBearing != null) {
                ResultIterable<Map<String,Object>> resultIterable = resultBearing.mapToMap();

                Optional<Map<String,Object>> resMap = resultIterable.findFirst();

                if (!resMap.isPresent()) {
                    return resMap.get();
                } else {
                    System.out.println("No results found.");
                    return null;
                }
            } else {
                System.out.println("ResultBearing is null.");
                return null;
            }
        });

        System.out.println("--> " + results.get("id"));
    }
}