<%-- 
    Document   : editUser
    Created on : 06/12/2018, 22:42:00
    Author     : Jefferson Rodrigues
--%>
<%@page import="br.com.fatepg.bikeUp.Bike"%>

<% if (request.getParameter("alteraUser") != null) {
        String nomeUsuario     = request.getParameter("nomeUsuario");
        String tipoUsuario     = request.getParameter("tipoUsuario");
        String cpfUsuario      = request.getParameter("cpfUsuario");
        String loginUsuario    = request.getParameter("loginUsuario");
        String senhaUsuario    = request.getParameter("senhaUsuario");
        String telefoneUsuario = request.getParameter("telUsuario");
        response.sendRedirect("exibeUser.jsp");
   }%>
