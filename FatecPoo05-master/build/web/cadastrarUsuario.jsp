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
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <div class="container py-5 height-ajust">
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
  <div class="form-group">
    <label for="CPF">CPF</label>
    <input type="text" class="form-control" id="CPF" placeholder="CPF" name="cpfUsuario">
      </div>
  <div class="form-group">
    <label for="NOME">NOME</label>
    <input type="text" class="form-control" id="NOME" placeholder="NOME" name="nomeUsuario">
  </div>
     <div class="form-group">
    <label for="LOGIN">LOGIN</label>
    <input type="text" class="form-control" id="LOGIN" placeholder="LOGIN" name="loginUsuario">
  </div>
    <div class="form-group">
    <label for="SENHA">SENHA</label>
    <input type="text" class="form-control" id="SENHA" placeholder="SENHA" name="senhaUsuario">
  </div>
    <div class="form-group">
    <label for="TELEFONE">TELEFONE</label>
    <input type="text" class="form-control" id="TELEFONE" placeholder="TELEFONE" name="telefoneUsuario">
  </div>
  <button type="submit" class="btn btn-primary" name="cadastraBike" value="Cadastrar">Cadastrar</button>
</form>

        <%} else {%>
        <h2>Recurso restrito.</h2>
        <%}
            }%>
        </div>
    </body>
</html>



         
      