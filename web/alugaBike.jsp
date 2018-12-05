<%@page import="br.com.fatepg.bikeUp.Aluguel"%>
<html>
    <%
        String error =null;
        if (request.getParameter("alugaBike") != null) {
            String loginUsuario = request.getParameter("login");
            int idBike = Integer.parseInt(request.getParameter("idBike"));
            String hrRetirado = request.getParameter("hrReserva");
            try {
                Aluguel.addAluguel(idBike, hrRetirado, loginUsuario);
            } catch (Exception e) {
                error = e.getMessage();
            }
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aluga Bike</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h1>Alugar bike</h1>
        <form method="post">
                Horário da reserva <input type="time" name="hrReserva">
            <input type="submit" value="Alugar">
        </form>

    </body>
</html>

