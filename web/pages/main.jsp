<%-- 
    Document   : main
    Created on : 02.02.2018, 21:40:37
    Author     : Alex
--%>

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
                
                <img src="" alt="Место для логотипа" width="100%" height="80"/>
                
                <form class="search_form" name="search_form" action="#" method="POST">
                    <img src="../images/search.jpg"/>
                    <input type="text" name="search_String" value="" size="100" />
                    <input type="submit" value="Поиск" name="serch_button" />
                    <select name="search_option">
                        <option>Название</option>
                        <option>Автор</option>
                    </select>
                </form>

            </div><!-- end .header -->

            <div class="sidebar1">
                <h4>Список авторов</h4>
                <ul class="nav">
                    <% AuthorList authorList = new AuthorList();
                        for (Author author : authorList.getAuthors()) {
                    %>
                    <li>
                        <a href="#">
                            <%= author.getName()%>                            
                        </a>
                    </li>
                    <%
                        }
                    %>
                </ul>

            </div><!-- end .sidebar1 -->

            <div class="content">
            </div><!-- end .content -->


        </div><!-- end .container -->

    </body>
</html>
