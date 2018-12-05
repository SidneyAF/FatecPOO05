<%@page import="br.com.fatepg.bikeUp.Bike"%>
<%@page import="br.com.fatepg.bikeUp.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%  String error = null;
    if (request.getParameter("deletaBike") != null) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Bike.removeBike(id);
            response.sendRedirect(request.getRequestURI());
        } catch (Exception e) {
            error = e.getMessage();
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bicicletas cadastradas</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h1>Bicicletas cadastradas</h1>
        <% if (session.getAttribute("user") == null) { %>
        <h2>É preciso estar autenticado para acessar este recurso.</h2>
        <%} else {%>
        <% User user = (User) session.getAttribute("user");%>
        <% if (user.getTipo().equals("adm")) {%>
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
                <td><form>
                        <input type="hidden" name="id" value="<%= b.getId()%>">
                        <input type="submit" name="alteraBike" value="Alterar">
                        <input type="submit" name="deletaBike" value="Deletar">
                    </form>
                </td>
                <%}%>
            </tr>
            <%}%>
        </table>
        <br>
        <a href="cadastrarBike.jsp"><button>Cadastrar bicicleta</button></a>
        <%};%>
    </body>
</html>
