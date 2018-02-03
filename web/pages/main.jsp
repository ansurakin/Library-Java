<%-- 
    Document   : main
    Created on : 02.02.2018, 21:40:37
    Author     : Alex
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="ru.alexander.library.beans.Author"%>
<%@page import="ru.alexander.library.beans.AuthorList"%>
<%@page import="ru.alexander.library.testconnection.TestConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/style_main.css" rel="stylesheet" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>

        <div class="container">


            <div class="header">

                <img src="../images/library.png" alt="Логотип"/>

                <form class="search_form" name="search_form" action="#" method="POST">                    
                    <input type="text" name="search_String" value="" size="100" />
                    <input class="search_button" type="submit" value="Поиск" name="serch_button" />
                    <select name="search_option">
                        <option>Название</option>
                        <option>Автор</option>
                    </select>
                </form>

            </div><!-- end .header -->

            <div class="sidebar1">
                <h4>Список авторов</h4>
                <ul class="nav">
                    <jsp:useBean id="authorList" scope="session" class="ru.alexander.library.beans.AuthorList" />
                    <c:forEach var="author" items="${authorList.getAuthorList()}" >
                        <li><a href="#">${author.name}</a></li>
                        </c:forEach>
                </ul>

            </div><!-- end .sidebar1 -->

            <div class="content">
            </div><!-- end .content -->


        </div><!-- end .container -->

    </body>
</html>
