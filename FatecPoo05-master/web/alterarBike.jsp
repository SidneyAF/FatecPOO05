<%@page import="br.com.fatepg.bikeUp.Bike"%>
<%@page import="br.com.fatepg.bikeUp.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Bicicleta</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h1>Alterar Bicicleta</h1>
        <% if (session.getAttribute("user") == null) { %>
        <h2>É preciso estar autenticado para acessar este recurso.</h2>
        <%} else {%>
        <% User user = (User) session.getAttribute("user");
            if (user.getTipo().equals("adm")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Bike b = Bike.getDadosBike(id);
        %>
        <form action="editBike.jsp" method="POST">
            <input type="hidden" name="idBike" value="<%= id%>"/><br>
            Modelo <input type="text" name="modelo" value="<%= b.getModelo()%>"/><br>
            Preço por hora <input type="text" name="precoHora" value="<%= b.getValor()%>"/><br>
            <input type="submit" name="alteraBike" value="Alterar">
        </form>
        <%} else {%>
        <h2>Recurso restrito.</h2>
        <%}
            }%>
    </body>
</html>