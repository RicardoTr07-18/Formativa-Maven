package Controller;

import Model.Administrador;
import DAO.AdministradorDAO;
import java.io.IOException;

import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class srvAdministrador
 */
@WebServlet("/srvAdministrador")
public class srvAdministrador extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    AdministradorDAO dao = new AdministradorDAO();
    Administrador adm = new Administrador();
    int idAdministrador;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
        String accion = request.getParameter("accion");
		
        switch (accion) {
            case "Listar":
                List<Administrador> lista = dao.listar();
                request.setAttribute("datos", lista);
                break;
            case "Nuevo":
                request.getRequestDispatcher("add.jsp").forward(request, response);
                break;
            case "Add":
                adm.setIdAdministrador(Integer.parseInt(request.getParameter("txtidAdministrador")));
                adm.setNombre(request.getParameter("txtnombre"));
                adm.setCorreo(request.getParameter("txtcorreo"));
                adm.setClave(request.getParameter("txtclave"));
                dao.add(adm);
                request.getRequestDispatcher("srvAdministrador?accion=Listar").forward(request, response);
                return;
            case "Update":
                adm.setIdAdministrador(Integer.parseInt(request.getParameter("txtidAdministrador")));
                adm.setNombre(request.getParameter("txtnombre"));
                adm.setCorreo(request.getParameter("txtcorreo"));
                adm.setClave(request.getParameter("txtclave"));
                dao.update(adm);
                request.getRequestDispatcher("srvAdministrador?accion=Listar").forward(request, response);
                return;
            case "Delete":
                idAdministrador = Integer.parseInt(request.getParameter("id"));
                dao.delete(idAdministrador);
                request.getRequestDispatcher("srvAdministrador?accion=Listar").forward(request, response);
                return;                
            case "Edit":
                idAdministrador = Integer.parseInt(request.getParameter("id"));
                adm = dao.listarId(idAdministrador);
                request.setAttribute("administradorSeleccionado", adm);
                request.getRequestDispatcher("srvAdministrador?accion=Listar").forward(request, response);
                break;

            default:
                throw new AssertionError();
        }
        request.getRequestDispatcher("administrador.jsp").forward(request, response);
	}

}
