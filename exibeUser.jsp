<%-- 
    Document   : exibeUser
    Created on : 06/12/2018, 22:09:20
    Author     : Jefferson Rodrigues
--%>
<%@page import="br.com.fatepg.bikeUp.Bike"%>
<%@page import="br.com.fatepg.bikeUp.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%  String error = null;
    if (request.getParameter("deletaUser") != null) {
        try {
            String cpf = request.getParameter("cpf");
            User.removeUser(cpf);
            response.sendRedirect(request.getRequestURI());
        } catch (Exception e) {
            error = e.getMessage();
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuários cadastrados</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h1>Usuários cadastrados</h1>
        <% if (session.getAttribute("user") == null) { %>
        <h2>É preciso estar autenticado para acessar este recurso.</h2>
        <%} else {%>
        <% User user = (User) session.getAttribute("user");%>
        <% if (user.getTipo().equals("adm")) {%>
        <table border="1">
            <tr>
                <th>#</th>
                <th>Nome</th>
                <th>Tipo</th>
                <th>CPF</th>
                <th>Login</th>
                <th>Senha</th>
                <th>Telefone</th>
                <th>.</th>
                <th>.</th>
            </tr>
            <% for (User u : User.getUsuarios()) {%>
            <tr>
                <td><%= u.getNome()%></td>
                <td><%= u.getTipo()%></td>
                <td><%= u.getCPF()%></td>
                <td><%= u.getLogin()%></td>
                <td><%= u.getSenha()%></td>
                <td><%= u.getTelefone()%></td>
                <td>
                    <a href="alterarUser.jsp?cpf=<%= u.getCPF()%>"><button>Alterar</button></a>
                </td>
                <td>
                    <form>
                        <input type="hidden" name="cpf" value="<%= u.getCPF()%>">
                        <input type="submit" name="alteraUser" value="Alterar">
                    </form>
                </td>
            </tr>
            <%}%>
            <%}%>
        </table>
        <br>
        <a href="cadastrarUser.jsp"><button>Cadastrar Usuário</button></a>
        <%};%>
    </body>
</html>
