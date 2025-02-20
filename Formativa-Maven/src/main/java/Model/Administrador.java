package Model;

public class Administrador {
	private int idAdministrador; 
    private String nombre;                        
    private String correo;           
    private String clave;
    
    public Administrador() {
		// TODO Auto-generated constructor stub
	}

	public Administrador(int idAdministrador, String nombre, String correo, String clave) {
		super();
		this.idAdministrador = idAdministrador;
		this.nombre = nombre;
		this.correo = correo;
		this.clave = clave;
	}

	public int getIdAdministrador() {
		return idAdministrador;
	}

	public void setIdAdministrador(int idAdministrador) {
		this.idAdministrador = idAdministrador;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getClave() {
		return clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}


}
