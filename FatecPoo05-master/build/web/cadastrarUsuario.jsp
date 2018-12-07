<%-- 
    Document   : cadastrarUsuario
    Created on : 06/12/2018, 21:29:53
    Author     : Jefferson
--%>
<%@page import="br.com.fatepg.bikeUp.Bike"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Bike</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h1>Cadastrar Usuário</h1>
        <% if (session.getAttribute("user") == null) { %>
        <h2>É preciso estar autenticado para acessar este recurso.</h2>
        <%} else {%>
        <%
            String error = null;
            if (request.getParameter("cadastraUsuario") != null) {
                String cpfUsuario      = request.getParameter("cpfUsuario");
                String loginUsuario    = request.getParameter("loginUsuario");
                String senhaUsuario    = request.getParameter("senhaUsuario");
                String nomeUsuario     = request.getParameter("nomeUsuario");
                String telefoneUsuario = request.getParameter("telUsuario");
                
                try {
                    User.addUser(cpfUsuario, nomeUsuario, loginUsuario, senhaUsuario, telefoneUsuario);
                } catch (Exception e) {
                    error = e.getMessage();
                }
                response.sendRedirect("exibeUser.jsp");
            };
        %>
        <% User user = (User) session.getAttribute("user");%>
        <% if (user.getTipo().equals("adm")) {%>    
        <form method="POST">
            CPF      <input type="text" name="cpfUsuario"/>
            Nome     <input type="text" name="nomeUsuario"/>
            Login    <input type="text" name="loginUsuario"/>
            Senha    <input type="text" name="senhaUsuario"/>
            Telefone <input type="text" name="telefoneUsuario"/>
            
            <input type="submit" name="cadastraBike" value="Cadastrar">
        </form>
        <%} else {%>
        <h2>Recurso restrito.</h2>
        <%}
            }%>
    </body>
</html>
