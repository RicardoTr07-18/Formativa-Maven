package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CursoDAO;
import Model.Curso;

/**
 * Servlet implementation class srvCurso
 */
@WebServlet("/srvCurso")
public class srvCurso extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	CursoDAO dao = new CursoDAO();
	Curso cso = new Curso();

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String accion = request.getParameter("accion");
        switch (accion) {
            case "Listar":
                List<Curso> datos = dao.listar();
                request.setAttribute("datos", datos);
                request.getRequestDispatcher("curso.jsp").forward(request, response);
                break;
            default:
                throw new AssertionError();
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
