<%@page import="br.com.fatepg.bikeUp.Aluguel"%>
<%@page import="br.com.fatepg.bikeUp.Bike"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aluguel</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <div class="container py-5 height-ajust">
        <h1>Aluguel</h1>
        <% if (session.getAttribute("user") == null) { %>
        <h2>É preciso estar autenticado para acessar este recurso.</h2>
        <%} else {%>
        <% User user = (User) session.getAttribute("user");%>
        <% if (user.getTipo().equals("user")) {%>
            
    <table class="table table-dark">
        <tbody>
            
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
            </tbody>
        </table>
        <%};%>
        <!-- ____________________ NAVEGAÇÃO DO ADM _________________________ -->
        <%if (user.getTipo().equals("adm")) {%>
        <h3>Raking de Reservas</h3><br>
        <table class="table table-dark">
            <tbody>
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
            </tbody>
        </table>
        <br>
        <hr/>
        <!---- _________________ TABELA HISTORIO _______________________________ -->
        <h3>Histórico</h3><br>
        <table class="table table-dark">
            <tbody>
            <tr>
                <th>#</th>
                <th>Usuario</th>
                <th>Tipo pagamento</th>
                <th>Valor total</th>
                <th>Horário de retirada</th>
                <th>Horário de devolução</th>
            </tr>
            <%  int j = 0;
                for (Aluguel a : Aluguel.getAluguel()) {
            j++;%>
            <tr>
                <td><%= j %></td>
                <td><%= a.getLoginUsuario() %></td>
                <td><%= a.getTipoPagamento() %></td>
                <td>R$ <%= a.getVlTotal() %></td>
                <td><%= a.getHrRetirado()%></td>
                <td><%= a.getHrDevolucao() %></td>
            </tr>
            <% }}}%>
            </tbody>
        </table>
        <br>
        </div>
    
    </body>
    <%@include file="WEB-INF/jspf/rodape.jspf" %>
</html>

