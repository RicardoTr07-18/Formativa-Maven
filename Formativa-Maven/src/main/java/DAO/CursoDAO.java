package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Config.Conexion;
import Model.Curso;

public class CursoDAO {
    PreparedStatement ps;
    ResultSet rs;
    Conexion c=new Conexion();
    Connection con;
    int r;
    
    public List<Curso> listar(){
        String sql = "SELECT * FROM curso";
        List<Curso> lista=new ArrayList<>();
        try {
            con=c.conectar();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                Curso cso = new Curso();
                cso.setIdCurso(rs.getInt(1));
                cso.setNombre(rs.getString(2));
                cso.setCodigo(rs.getString(3));
                cso.setDescripcion(rs.getString(4));
                cso.setCreditos(rs.getInt(5));
                cso.setDuracion(rs.getDouble(6));
                lista.add(cso);
            }
        } catch (Exception e) {
        }
        return lista;
    }
}
