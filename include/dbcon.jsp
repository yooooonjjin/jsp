<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    String url = "jdbc:oracle:thin:@//localhost:1521/orcl7";
    String username = "c##java";
    String userpass = "1234";

    Class.forName("oracle.jdbc.OracleDriver");
    Connection con = DriverManager.getConnection(url, username, userpass);
    Statement stmt = con.createStatement();
    %>