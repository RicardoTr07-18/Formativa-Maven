package Controller;

import Model.Estadistica;
import DAO.CursoDAO;
import DAO.EstadisticaDAO;
import DAO.EstudianteDAO;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/srvEstadistica")
public class srvEstadistica extends HttpServlet {
    private static final long serialVersionUID = 1L;

    EstadisticaDAO dao = new EstadisticaDAO();
    Estadistica et = new Estadistica();
    int idEstadistica;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	
        String accion = request.getParameter("accion");

        try {
            switch (accion) {
                case "Listar":
                	List<Estadistica> datos = dao.listar();
                    request.setAttribute("datos", datos);
                    break;

                case "Add":
                	et.setIdEstadistica(Integer.parseInt(request.getParameter("txtidEstadistica")));
                    et.setIdEstudianteEt(Integer.parseInt(request.getParameter("txtidEstudiante")));
                    et.setIdCursoEt(Integer.parseInt(request.getParameter("txtidCurso")));
                    et.setAsistencia(Double.parseDouble(request.getParameter("txtasistencia")));
                    et.setTiempoestudio(Double.parseDouble(request.getParameter("txttiempoEstudio")));
                    et.setPromedio(Double.parseDouble(request.getParameter("txtpromedio")));
                    et.setParticipacion(Double.parseDouble(request.getParameter("txtparticipacion")));
                    et.setIdiomas(request.getParameter("txtidiomas"));
                    dao.add(et);
                    request.getRequestDispatcher("srvEstadistica?accion=Listar").forward(request, response);
                    break;

                case "Update":
                	et.setIdEstadistica(Integer.parseInt(request.getParameter("txtidEstadistica")));
                    et.setIdEstudianteEt(Integer.parseInt(request.getParameter("txtidEstudiante")));
                    et.setIdCursoEt(Integer.parseInt(request.getParameter("txtidCurso")));
                    et.setAsistencia(Double.parseDouble(request.getParameter("txtasistencia")));
                    et.setTiempoestudio(Double.parseDouble(request.getParameter("txttiempoEstudio")));
                    et.setPromedio(Double.parseDouble(request.getParameter("txtpromedio")));
                    et.setParticipacion(Double.parseDouble(request.getParameter("txtparticipacion")));
                    et.setIdiomas(request.getParameter("txtidiomas"));
                    dao.update(et);
                    request.getRequestDispatcher("srvEstadistica?accion=Listar").forward(request, response);
                    break;

                case "Delete":
                    idEstadistica = Integer.parseInt(request.getParameter("id"));
                    dao.delete(idEstadistica);
                    request.getRequestDispatcher("srvEstadistica?accion=Listar").forward(request, response);
                    break;
                case "Edit":
                    idEstadistica = Integer.parseInt(request.getParameter("id"));
                    et = dao.listarId(idEstadistica);
                    request.setAttribute("estadisticaSeleccionado", et);
                    request.getRequestDispatcher("srvEstadistica?accion=Listar").forward(request, response);
                    break;

                default:
                    throw new AssertionError();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        cargarListas(request);
        request.getRequestDispatcher("estadistica.jsp").forward(request, response);
    }

    private void cargarListas(HttpServletRequest request) {
        EstudianteDAO estudianteDAO = new EstudianteDAO();
        CursoDAO cursoDAO = new CursoDAO();
        request.setAttribute("listaEstudiantes", estudianteDAO.listar());
        request.setAttribute("listaCursos", cursoDAO.listar());
        request.setAttribute("datos", dao.listar());
    }
}

