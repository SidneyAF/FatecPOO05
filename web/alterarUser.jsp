<%-- 
    Document   : alterarUser
    Created on : 06/12/2018, 22:42:13
    Author     : Jefferson Rodrigues
--%>

<%@page import="br.com.fatepg.bikeUp.Bike"%>
<%@page import="br.com.fatepg.bikeUp.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Usuário</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h1>Alterar Usuário</h1>
        <% if (session.getAttribute("user") == null) { %>
        <h2>É preciso estar autenticado para acessar este recurso.</h2>
        <%} else {%>
        <% User user = (User) session.getAttribute("user");
            if (user.getTipo().equals("adm")) {
                String cpf = request.getParameter("cpf");
                User u = User.getDadosUser(cpf);
        %>
        <form action="editUser.jsp" method="POST">
            <input type="hidden" name="cpf" value="<%= cpf%>"/><br>
            Nome <input type="text" name="nomeUsuario" value="<%= u.getNome()%>"/><br>
            Tipo <input type="text" name="tipoUsuario" value="<%= u.getTipo()%>"/><br>
            Login <input type="text" name="loginUsuario" value="<%= u.getLogin()%>"/><br>
            Senha <input type="text" name="senhaUsuario" value="<%= u.getSenha()%>"/><br>
            Telefone <input type="text" name="telefoneUsuario" value="<%= u.getTelefone()%>"/><br>
            <input type="submit" name="alteraUser" value="Alterar">
        </form>
        <%} else {%>
        <h2>Recurso restrito.</h2>
        <%}
            }%>
    </body>
</html>
