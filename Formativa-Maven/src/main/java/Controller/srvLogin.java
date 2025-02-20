package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Administrador;
import DAO.AdministradorDAO;

@WebServlet("/srvLogin")
public class srvLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public srvLogin() {
        super();
    }
    
    //cerrar sesion
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if ("logout".equals(accion)) {
            request.getSession().invalidate();
            response.sendRedirect("index.jsp");
        }
    }

    
    //iniciar sesion caso contrario muestra mensaje de error y redirije al usuario al index.jsp
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String correo = request.getParameter("email");
        String clave = request.getParameter("clave");

        // Crear el objeto DAO y realizar la búsqueda en la base de datos
        AdministradorDAO administradorDAO = new AdministradorDAO();
        Administrador administrador = administradorDAO.login(correo, clave);

        if (administrador != null) {
            // Si el login es exitoso, redirigir a barra.jsp
            request.getSession().setAttribute("administrador", administrador); // Guardamos el objeto estudiante en sesión
            response.sendRedirect("menu/barra.jsp");
        } else {
            // Si el login falla, mostrar un mensaje de error
            request.setAttribute("error", "Correo o contraseña incorrectos");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
