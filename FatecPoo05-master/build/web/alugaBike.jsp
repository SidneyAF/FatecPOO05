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
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <div class="container py-5 height-ajust">
        <h1>Alugar bike</h1>
       <form method="POST">
  <div class="form-group">
    <label for="HR">HORÁRIO DA RESERVA</label>
    <input type="time" class="form-control" id="HR" placeholder="HORÁRIO DA RESERVA" name="hrReserva">
      </div>
  
  <button type="submit" class="btn btn-primary" value="Alugar">Alugar</button>
        </div>
    </body>
</html>


