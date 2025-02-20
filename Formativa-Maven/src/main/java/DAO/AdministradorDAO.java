package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import Config.Conexion;
import Model.Administrador;

public class AdministradorDAO {
	
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Conexion c=new Conexion();
    int r;
    
    public List<Administrador> listar(){
        String sql = "SELECT * FROM administrador";
        List<Administrador> lista=new ArrayList<>();
        try {
            con=c.conectar();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                Administrador adm=new Administrador();
                adm.setIdAdministrador(rs.getInt("idAdministrador"));
                adm.setNombre(rs.getString("nombre"));
                adm.setCorreo(rs.getString("correo"));
                adm.setClave(rs.getString("clave"));
                lista.add(adm);
            }
        } catch (Exception ex) {
        	Logger.getLogger(AdministradorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
    
    
    public int add(Administrador adm){
        String sql = "INSERT INTO administrador (idAdministrador, nombre, correo, clave) VALUES (?,?,?,?)";
        try {
            con=c.conectar();
            ps=con.prepareStatement(sql);
            ps.setInt(1, adm.getIdAdministrador());
            ps.setString(2, adm.getNombre());
            ps.setString(3, adm.getCorreo());
            ps.setString(4, adm.getClave());
            ps.executeUpdate();
        } catch (SQLException ex) {
        	Logger.getLogger(AdministradorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;
    }
    
    
    public Administrador listarId(int id){
        String sql="SELECT * FROM administrador WHERE idAdministrador=" + id;
        Administrador adm=new Administrador();
        con=c.conectar();
        try {
            ps=con.prepareStatement(sql);           
            rs=ps.executeQuery();
            while (rs.next()) {
                adm.setIdAdministrador(rs.getInt("idAdministrador"));
                adm.setNombre(rs.getString("nombre"));
                adm.setCorreo(rs.getString("correo"));
                adm.setClave(rs.getString("clave"));
            }
        } catch (SQLException ex) {
        	Logger.getLogger(AdministradorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return adm;
    }
    
    
    public int update(Administrador adm){
        String sql = "UPDATE administrador SET nombre=?, correo=?, clave=? WHERE idAdministrador=?";
        try {
            con = c.conectar();
            ps = con.prepareStatement(sql);
            ps.setString(1, adm.getNombre());
            ps.setString(2, adm.getCorreo());
            ps.setString(3, adm.getClave());
            ps.setInt(4, adm.getIdAdministrador()); // ID debe estar al final
            r = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AdministradorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;
    }

    
    
    public void delete (int id){
        String sql="DELETE FROM administrador WHERE idAdministrador = ?";
        con = c.conectar();
        try {
            ps=con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
        	Logger.getLogger(AdministradorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    public Administrador login(String correo, String clave) {
        String sql = "SELECT * FROM administrador WHERE correo = ? AND clave = ?";
        Administrador adm = null;
        try {
            con = c.conectar();
            ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, clave);
            rs = ps.executeQuery();
            if (rs.next()) {
                adm = new Administrador();
                adm.setIdAdministrador(rs.getInt("idAdministrador"));
                adm.setNombre(rs.getString("nombre"));
                adm.setCorreo(rs.getString("correo"));
                adm.setClave(rs.getString("clave"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return adm;
    }

}