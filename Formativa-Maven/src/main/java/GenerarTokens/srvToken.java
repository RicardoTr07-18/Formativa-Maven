package GenerarTokens;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Config.MailSender;
import DAO.AdministradorDAO;
import Model.Administrador;

@WebServlet("/srvToken")
public class srvToken extends HttpServlet {
    private static final long serialVersionUID = 1L;
    AdministradorDAO dao = new AdministradorDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
    	
        String accion = request.getParameter("accion");

        if (accion == null) {
            response.sendRedirect("index.jsp?error=Acción no especificada");
            return;
        }

        switch (accion) {
            case "generarToken":
                String email = request.getParameter("email");
                if (email == null || email.isEmpty()) {
                    response.sendRedirect("token/claveOlvidada.jsp?error=Email requerido");
                    return;
                }
                
                String token = TokenManager.generarToken(email);
                
                // Cuerpo del correo con estilo HTML
                String cuerpoMensaje = "<div style='background-color: #FF6B6B; padding: 20px; text-align: center; border-radius: 10px; color: #FFFFFF;'>"
                    + "<h2 style='margin: 0;'>Código de Recuperación</h2>"
                    + "<p style='font-size: 18px;'>Tu código de recuperación es:</p>"
                    + "<h1 style='background: #FFFFFF; color: #FF6B6B; display: inline-block; padding: 10px 20px; border-radius: 5px;'>" + token + "</h1>"
                    + "<p>Ingresa este código en la página para recuperar tu cuenta.</p>"
                    + "<p style='font-size: 14px;'>Si no solicitaste este código, ignora este mensaje.</p>"
                    + "</div>";

                boolean enviado = MailSender.enviarCorreo(email, "Código de recuperación", cuerpoMensaje);
                
                
                if (enviado) {
                    response.sendRedirect("token/ingresarToken.jsp?email=" + email);
                } else {
                    response.sendRedirect("token/claveOlvidada.jsp?error=No se pudo enviar el correo");
                }
                break;

            case "validarToken":
                email = request.getParameter("email");
                String tokenIngresado = request.getParameter("token");
                if (TokenManager.validarToken(email, tokenIngresado)) {
                    TokenManager.eliminarToken(email);
                    response.sendRedirect("token/cambiarClave.jsp?email=" + email);
                } else {
                    response.sendRedirect("token/ingresarToken.jsp?email=" + email + "&error=Token inválido");
                }
                break;

            case "cambiarClave":
                email = request.getParameter("email");
                String nuevaClave = request.getParameter("claveNueva");
                Administrador admin = dao.listar().stream()
                    .filter(a -> a.getCorreo().equals(email))
                    .findFirst()
                    .orElse(null);
                if (admin != null) {
                    admin.setClave(nuevaClave);
                    dao.update(admin);
                    response.sendRedirect("index.jsp?mensaje=Contraseña actualizada");
                } else {
                    response.sendRedirect("token/cambiarClave.jsp?error=Error al actualizar");
                }
                break;

            default:
                response.sendRedirect("index.jsp?error=Acción no válida");
        }
    }
}
