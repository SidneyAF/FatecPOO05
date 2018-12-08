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
        <h1>Cadastrar Bike</h1>
        <% if (session.getAttribute("user") == null) { %>
        <h2>É preciso estar autenticado para acessar este recurso.</h2>
        <%} else {%>
        <%
            String error = null;
            if (request.getParameter("cadastraBike") != null) {
                int idBike = Integer.parseInt(request.getParameter("idBike"));
                String modelo = request.getParameter("modelo");
                double precoHora = Double.parseDouble(request.getParameter("precoHora"));
                try {
                    Bike.addBike(idBike,precoHora, modelo);
                } catch (Exception e) {
                    error = e.getMessage();
                }
                response.sendRedirect("exibeBike.jsp");
            };
        %>
        <% User user = (User) session.getAttribute("user");%>
        <% if (user.getTipo().equals("adm")) {%>    
        <form method="POST">
  <div class="form-group">
    <label for="ID">ID</label>
    <input type="text" class="form-control" id="ID" placeholder="ID" name="idBike">
      </div>
  <div class="form-group">
    <label for="MODELO">MODELO</label>
    <input type="text" class="form-control" id="MODELO" placeholder="MODELO" name="modelo">
  </div>
     <div class="form-group">
    <label for="PPHORA">PREÇO POR HORA</label>
    <input type="text" class="form-control" id="PPHORA" placeholder="PREÇO POR HORA" name="precoHora">
  </div>
  <button type="submit" class="btn btn-primary" name="cadastraBike" value="Cadastrar">Cadastrar</button>
        <%} else {%>
        <h2>Recurso restrito.</h2>
        <%}
            }%>
        </div>
    </body>
</html>


