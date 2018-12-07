<%@page import="br.com.fatepg.bikeUp.Bike"%>
<% if (request.getParameter("alteraBike") != null) {
        int id = Integer.parseInt(request.getParameter("idBike"));
        String modelo = request.getParameter("modelo");
        double precoHora = Double.parseDouble(request.getParameter("precoHora"));
        Bike.editBike(id, precoHora, modelo);
        response.sendRedirect("exibeBike.jsp");
    }%>
