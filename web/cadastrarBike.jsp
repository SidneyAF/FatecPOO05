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
            Id <input type="text" name="idBike"/>
            Modelo <input type="text" name="modelo"/>
            Preço por hora <input type="text" name="precoHora"/>
            <input type="submit" name="cadastraBike" value="Cadastrar">
        </form>
        <%} else {%>
        <h2>Recurso restrito.</h2>
        <%}
            }%>
    </body>
</html>
