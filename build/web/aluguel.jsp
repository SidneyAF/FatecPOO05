<%@page import="br.com.fatepg.bikeUp.Bike"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aluguel</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h1>Aluguel</h1>
        <% if (session.getAttribute("user") == null) { %>
        <h2>É preciso estar autenticado para acessar este recurso.</h2>
        <%} else {%>
        <% User user = (User) session.getAttribute("user");%>
        <% if (user.getTipo().equals("user")) {%>
        <table border="1">
            <tr>
                <th>#</th>
                <th>Modelo</th>
                <th>Preço por hora</th>
                <th>Status</th>
                <th>.</th>
            </tr>
            <% for (Bike b : Bike.getBikes()) {%>
            <tr>
                <td><%= b.getId()%></td>
                <td><%= b.getModelo()%></td>
                <td><%= b.getValor()%></td>
                <td><%= b.getStatus()%></td>
                <%if (b.getStatus().equals("Disponível")) {%>
                <td>
                    <form action="alugaBike.jsp" method="post">
                        <input hidden="" name="login" value="<%= user.getLogin()%>">
                        <input hidden="" name="idBike" value="<%= b.getId()%>">
                        <input type="radio" name="alugar" required>
                        <input type="submit" name="alugaBike" value="Alugar">
                    </form>
                </td>
                <%}%>
            </tr>
            <%}%>
        </table>
        <%};%>

        <!-- ____________________ NAVEGAÇÃO DO ADM _________________________ -->
        <%if (user.getTipo().equals("adm")) {%>
        <h3>Raking de Reservas</h3><br>
        <table border="1">
            <tr>
                <th>Rank</th>
                <th>Modelo</th>
                <th>Nº Reservas</th>
                <th>Total arrecadado</th>
            </tr>
            <%  int i = 0;
                for (Object[] u : User.getRanking()) {
                    i++;%>
            <tr>
                <td><%=i%>º</td>
                <td><%=u[1]%></td>
                <td><%=u[0]%></td>
                <td>R$ <%=u[2]%></td>
            </tr>
            <% }%>
        </table>
        <h3>Bikes Alugadas</h3><br>
        <table border="1">
            <tr>
                <th>Rank</th>
                <th>Modelo</th>
                <th>Nº Reservas</th>
                <th>Total arrecadado</th>
            </tr>
            <%  int j = 0;
                for (Object[] u : User.getRanking()) {
                    j++;%>
            <tr>
                <td><%=j%>º</td>
                <td><%=u[1]%></td>
                <td><%=u[0]%></td>
                <td>R$ <%=u[2]%></td>
            </tr>
            <% }%>
        </table>
        <%}%>
        <%}%>
    </body>
</html>
