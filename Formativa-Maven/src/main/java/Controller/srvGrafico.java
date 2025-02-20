package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.EstadisticaDAO;
import Model.Estadistica;

/**
 * Servlet implementation class srvGrafico
 */
@WebServlet("/srvGrafico")
public class srvGrafico extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Estadistica et=new Estadistica();
	EstadisticaDAO dao= new EstadisticaDAO();
	int idEstadistica;
	
    public srvGrafico() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		 String accion = request.getParameter("accion");
	        
	        switch (accion) {
	            case "Listar":
	            	List<Estadistica> datos = dao.listar();
	                request.setAttribute("datos", datos);
	                request.getRequestDispatcher("grafico.jsp").forward(request, response);
	                break;
	            default:
	                throw new AssertionError();
	        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
