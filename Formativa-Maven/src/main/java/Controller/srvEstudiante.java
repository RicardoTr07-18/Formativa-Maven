package Controller;

import Model.Estudiante;
import DAO.EstudianteDAO;
import java.io.IOException;

import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class srvEstudiante
 */
@WebServlet("/srvEstudiante")
public class srvEstudiante extends HttpServlet {
	private static final long serialVersionUID = 1L;
		
	EstudianteDAO dao = new EstudianteDAO();
    Estudiante est = new Estudiante();
    int idEstudiante;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        String accion = request.getParameter("accion");
        
        /*este es otra forma de usar el trycatch, osea diferencia entre srvEstudiante y srvAdministrador*/
        try {
            switch (accion) {
                case "Listar":
                	 List<Estudiante> datos = dao.listar();
                     request.setAttribute("datos", datos);
                     break;

                case "Nuevo":
                    request.getRequestDispatcher("add.jsp").forward(request, response);
                    return;

                case "Add":
                	formularioEstudiante(request);
                    dao.add(est);
                    request.getRequestDispatcher("srvEstudiante?accion=Listar").forward(request, response);
                    break;

                case "Update":
                	formularioEstudiante(request);
                    dao.update(est);
                    request.getRequestDispatcher("srvEstudiante?accion=Listar").forward(request, response);
                    break;

                case "Delete":
                    idEstudiante = Integer.parseInt(request.getParameter("id"));
                    dao.delete(idEstudiante);
                    request.getRequestDispatcher("srvEstudiante?accion=Listar").forward(request, response);
                    break;

                case "Edit":
                    idEstudiante = Integer.parseInt(request.getParameter("id"));
                    est = dao.listarId(idEstudiante);
                    request.setAttribute("estudianteSeleccionado", est);
                    request.getRequestDispatcher("srvEstudiante?accion=Listar").forward(request, response);
                    break;

                default:
                    throw new AssertionError();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("estudiante.jsp").forward(request, response);
    }

    private void formularioEstudiante(HttpServletRequest request) {
        est.setIdEstudiante(Integer.parseInt(request.getParameter("txtidEstudiante")));
        est.setNombre(request.getParameter("txtnombre"));
        est.setFechaNacimiento(request.getParameter("txtfechaNacimiento"));
        est.setCorreo(request.getParameter("txtcorreo"));
        est.setDireccion(request.getParameter("txtdireccion"));
    }


}

