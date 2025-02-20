package DAO;

import Model.Estadistica;
import Config.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class EstadisticaDAO {
	
	Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Conexion c=new Conexion();
    int r;

    public List<Estadistica> listar() {
        String sql = "SELECT e.idEstadistica, est.idEstudiante, est.nombre AS nombreEst, " +
                     "c.idCurso, c.nombre AS nombreCurso, c.duracion AS duracionCurso, " +
                     "e.asistencia, e.tiempoEstudio, e.promedio, e.participacion, e.idiomas " +
                     "FROM estadistica e " +
                     "INNER JOIN estudiante est ON e.idEstudiante = est.idEstudiante " +
                     "INNER JOIN curso c ON e.idCurso = c.idCurso";
        List<Estadistica> lista = new ArrayList<>();
        try {
        	con=c.conectar();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                Estadistica et = new Estadistica();
                et.setIdEstadistica(rs.getInt("idEstadistica"));
                et.setIdEstudianteEt(rs.getInt("idEstudiante"));
                et.setNombreEst(rs.getString("nombreEst"));
                et.setIdCursoEt(rs.getInt("idCurso"));
                et.setNombreCso(rs.getString("nombreCurso"));
                et.setDuracionCso(rs.getDouble("duracionCurso"));
                et.setAsistencia(rs.getDouble("asistencia"));
                et.setTiempoestudio(rs.getDouble("tiempoEstudio"));
                et.setPromedio(rs.getDouble("promedio"));
                et.setParticipacion(rs.getDouble("participacion"));
                et.setIdiomas(rs.getString("idiomas"));
                lista.add(et);
            }
        } catch (Exception e) {
        	Logger.getLogger(EstadisticaDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return lista;
    }
   
    
    public int add(Estadistica et) {
    	String sql = "INSERT INTO estadistica (idEstadistica, idEstudiante, idCurso, asistencia, tiempoEstudio, promedio, participacion, idiomas) VALUES (?,?,?,?,?,?,?,?)";
    	try {
    		con=c.conectar();
    		ps=con.prepareStatement(sql);
    		ps.setInt(1, et.getIdEstadistica());
    		ps.setInt(2, et.getIdEstudianteEt());
    		ps.setInt(3, et.getIdCursoEt());
    		ps.setDouble(4, et.getAsistencia());
    		ps.setDouble(5, et.getTiempoestudio());
    		ps.setDouble(6, et.getPromedio());
    		ps.setDouble(7, et.getParticipacion());
    		ps.setString(8, et.getIdiomas());
    		ps.executeUpdate();
    	}catch (SQLException e) {
    		Logger.getLogger(EstadisticaDAO.class.getName()).log(Level.SEVERE, null, e);
    	}
    	return r;
    }
    
    
    public Estadistica listarId(int id) {
    	String sql = "SELECT * FROM estadistica WHERE idEstadistica=" +id;
    	Estadistica et=new Estadistica();
    	con=c.conectar();
    	try {
    		ps=con.prepareStatement(sql);
    		rs=ps.executeQuery();
    		while (rs.next()) {
    			et.setIdEstadistica(rs.getInt("idEstadistica"));
    			et.setIdEstudianteEt(rs.getInt("idEstudiante"));
    			et.setIdCursoEt(rs.getInt("idCurso"));
    			et.setAsistencia(rs.getDouble("asistencia"));
    			et.setTiempoestudio(rs.getDouble("tiempoEstudio"));
    			et.setPromedio(rs.getDouble("promedio"));
    			et.setParticipacion(rs.getDouble("participacion"));
    			et.setIdiomas(rs.getString("idiomas"));
    		}
    	}catch (Exception e) {
    		Logger.getLogger(EstadisticaDAO.class.getName()).log(Level.SEVERE, null, e);
		}
    	return et;
    }
    
    
    public int update(Estadistica et) {
    	String sql = "UPDATE estadistica SET idestudiante=?, idcurso=?, asistencia=?, tiempoestudio=?, promedio=?, participacion=?, idiomas=? WHERE idEstadistica=?";
    	try {
    		con=c.conectar();
    		ps=con.prepareStatement(sql);
    		ps.setInt(1, et.getIdEstudianteEt());
    		ps.setInt(2, et.getIdCursoEt());
    		ps.setDouble(3, et.getAsistencia());
    		ps.setDouble(4, et.getTiempoestudio());
    		ps.setDouble(5, et.getPromedio());
    		ps.setDouble(6, et.getParticipacion());
    		ps.setString(7, et.getIdiomas());
    		ps.setInt(8, et.getIdEstadistica());
    		ps.executeUpdate();
    	}catch (SQLException e) {
    		Logger.getLogger(EstadisticaDAO.class.getName()).log(Level.SEVERE, null, e);
    	}
    	return r;
    }
    
    
    public void delete (int id) {
    	String sql="DELETE FROM estadistica WHERE idEstadistica = ?";
    	con = c.conectar();
    	try {
            ps=con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        	Logger.getLogger(EstadisticaDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    
    
}

