package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import Config.Conexion;
import Model.Estudiante;

public class EstudianteDAO {
	
    PreparedStatement ps;
    ResultSet rs;
    Conexion c=new Conexion();
    Connection con;
    int r;
    
    public List<Estudiante> listar(){
    	String sql = "SELECT * FROM estudiante";
        List<Estudiante> lista=new ArrayList<>();       
        try {
            con=c.conectar();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                Estudiante est=new Estudiante();
                est.setIdEstudiante(rs.getInt("idEstudiante"));
                est.setNombre(rs.getString("nombre"));
                est.setFechaNacimiento(rs.getString("fechaNacimiento"));
                est.setCorreo(rs.getString("correo"));
                est.setDireccion(rs.getString("direccion"));
                lista.add(est);
            }
        } catch (Exception e) {
        	Logger.getLogger(EstudianteDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return lista;
    }
    
    
    public int add(Estudiante est){
        String sql = "INSERT INTO  estudiante (idEstudiante, nombre, fechanacimiento, correo, direccion) VALUES (?,?,?,?,?)";
        try {
            con=c.conectar();
            ps=con.prepareStatement(sql);
            ps.setInt(1, est.getIdEstudiante());
            ps.setString(2, est.getNombre());
            ps.setString(3, est.getFechaNacimiento());
            ps.setString(4, est.getCorreo());
            ps.setString(5, est.getDireccion());
            r=ps.executeUpdate();
        } catch (Exception e) {
        	Logger.getLogger(EstudianteDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return r;
    }
    
    
    public Estudiante listarId(int id){
        String sql="SELECT * FROM estudiante WHERE idestudiante=" + id;
        Estudiante est=new Estudiante();
        con=c.conectar();
        try {
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
            	est.setIdEstudiante(rs.getInt("idEstudiante"));
            	est.setNombre(rs.getString("nombre"));
            	est.setFechaNacimiento(rs.getString("fechaNacimiento"));
            	est.setCorreo(rs.getString("correo"));
            	est.setDireccion(rs.getString("direccion"));
            }
        } catch (Exception e) {
        	Logger.getLogger(EstudianteDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return est;
    }
    
    
    public int update(Estudiante est){
        String sql="UPDATE estudiante SET nombre=?, fechanacimiento=?, correo=?, direccion=? WHERE idestudiante=?";
        try {
            con=c.conectar();
            ps=con.prepareStatement(sql);   
            ps.setString(1, est.getNombre());
            ps.setString(2, est.getFechaNacimiento());
            ps.setString(3, est.getCorreo());
            ps.setString(4, est.getDireccion());
            ps.setInt(5, est.getIdEstudiante()); // ID debe estar al final
            r=ps.executeUpdate();
        } catch (Exception e) {
        	Logger.getLogger(EstudianteDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return r;
    }
    
    
    public void delete (int id){
        String sql="DELETE FROM estudiante WHERE idestudiante = ?";
        con = c.conectar();
        try {
            ps=con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        	Logger.getLogger(EstudianteDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    
}
