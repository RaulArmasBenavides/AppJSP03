<%-- 
    Document   : index
    Created on : 15/07/2018, 12:25:27 PM
    Author     : Alumno
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
    // cargar driver en memoria
    Class.forName("oracle.jdbc.OracleDriver").newInstance();
    // url de la base de datos
    String url="jdbc:oracle:thin:@localhost:1521:orcl";
    //objeter la conexion a la BD
    Connection cn=DriverManager.getConnection(url, "hr", "hr");
    //lista de deaprtamentos
    String sql="select * from Departments";
    Statement stm=cn.createStatement();
    ResultSet rs=stm.executeQuery(sql);
    %>
    <body>
        <table border="1">
            <thead>
                <tr>
                    <th colspan="4">Lista de Departamentos</th>                    
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Codigo</td>
                    <td>Nombre</td>
                    <td>IdManager</td>
                    <td>IdLugar</td>
                </tr>
                <% while (rs.next()) {  %>                                
                <tr>
                    <td><%=rs.getInt(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getInt(3)%></td>
                    <td><%=rs.getInt(4)%></td>
                </tr>
                <% }
                   rs.close();
                %>
            </tbody>
        </table>

    </body>
</html>
