package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import br.com.fatepg.bikeUp.Bike;
import br.com.fatepg.bikeUp.User;

public final class alterarBike_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/WEB-INF/jspf/header.jspf");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Alterar Bike</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
 String errorMessage = null;
    String path = request.getContextPath();
    if (request.getParameter("formLogin") != null) {
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        User u = User.getUser(login, senha);
        out.print(u);
        if (u == null) {
            errorMessage = "Usuário e/ou senha inválido(s)";
        } else {
            session.setAttribute("user", u);
            response.sendRedirect(request.getRequestURI());
        };
    }
    if (request.getParameter("formLogoff") != null) {
        session.removeAttribute("user");
        response.sendRedirect("home.jsp");
    };

      out.write("\n");
      out.write("<h1>BIKE UP</h1>\n");
 if (errorMessage != null) {
      out.write("\n");
      out.write("<h3 style=\"color: red\">");
      out.print( errorMessage);
      out.write("</h3>\n");
};
      out.write("\n");
      out.write("<hr/>\n");
 if (session.getAttribute("user") == null) {
      out.write("\n");
      out.write("<form method=\"POST\">\n");
      out.write("    Login: <input type=\"text\" name=\"login\" />\n");
      out.write("    Senha: <input type=\"password\" name=\"senha\" />\n");
      out.write("    <input type=\"submit\" name=\"formLogin\" value=\"Entrar\"/>\n");
      out.write("</form>\n");
} else {
      out.write("\n");
      out.write("<form>\n");
      out.write("    ");
 User user = (User) session.getAttribute("user");
      out.write("\n");
      out.write("\n");
      out.write("    ");
 if (user.getTipo().equals("user")) {
      out.write("\n");
      out.write("    <h2>\n");
      out.write("        <a href=\"");
      out.print( path);
      out.write("/home.jsp\"> Home</a>\n");
      out.write("        <a href=\"");
      out.print( path);
      out.write("/aluguel.jsp\"> Alugar</a>\n");
      out.write("        <a href=\"");
      out.print( path);
      out.write("/bikes.jsp\"> Minhas Bike</a>\n");
      out.write("    </h2>\n");
      out.write("    ");
}
      out.write("\n");
      out.write("    ");
 if (user.getTipo().equals("adm")) {
      out.write("\n");
      out.write("    <h2>\n");
      out.write("        <a href=\"");
      out.print( path);
      out.write("/home.jsp\"> Home</a>\n");
      out.write("        <a href=\"");
      out.print( path);
      out.write("/exibeBike.jsp\">Bikes</a>\n");
      out.write("        <a href=\"");
      out.print( path);
      out.write("/aluguel.jsp\"> Alugueis</a>\n");
      out.write("    </h2>\n");
      out.write("    ");
}
      out.write("\n");
      out.write("    <hr/>\n");
      out.write("    Bem vindo, ");
      out.print( user.getNome());
      out.write("\n");
      out.write("    <input type=\"submit\" name=\"formLogoff\" value=\"Sair\" />\n");
      out.write("\n");
      out.write("</form>\n");
 }
      out.write('\n');
      out.write("\n");
      out.write("        <h1>Alterar Bicicleta</h1>\n");
      out.write("        ");
 if (session.getAttribute("adm") == null) { 
      out.write("\n");
      out.write("        <h2>É preciso estar autenticado para acessar este recurso.</h2>\n");
      out.write("        ");
} else {
      out.write("\n");
      out.write("        ");
 User user = (User) session.getAttribute("user");
            if (user.getTipo().equals("adm")) {

                String error = null;
                if (request.getParameter("alteraBike") != null) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    Bike b = Bike.getDadosBike(id);

        
      out.write("\n");
      out.write("        <form method=\"POST\">\n");
      out.write("            <input type=\"hidden\" name=\"idBike\" value=\"");
      out.print(b.getId());
      out.write("\"/><br>\n");
      out.write("            Modelo <input type=\"text\" name=\"modelo\" value=\"");
      out.print(b.getModelo());
      out.write("\"/><br>\n");
      out.write("            Preço por hora <input type=\"text\" name=\"precoHora\" value=\"");
      out.print(b.getValor());
      out.write("\"/><br>\n");
      out.write("            <input type=\"submit\" name=\"cadastraBike\" value=\"Cadastrar\">\n");
      out.write("        </form>\n");
      out.write("        ");
};
        } else {
      out.write("\n");
      out.write("        <h2>Recurso restrito.</h2>\n");
      out.write("        ");

            }
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
