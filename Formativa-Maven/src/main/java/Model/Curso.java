package Model;

public class Curso {
	private int idCurso;
    private String nombre;
    private String codigo;
    private String descripcion;
    private int creditos;
    private double duracion;
	
	public Curso() {
		// TODO Auto-generated constructor stub
	}

	public Curso(int idCurso, String nombre, String codigo, String descripcion, int creditos, double duracion) {
		super();
		this.idCurso = idCurso;
		this.nombre = nombre;
		this.codigo = codigo;
		this.descripcion = descripcion;
		this.creditos = creditos;
		this.duracion = duracion;
	}

	public int getIdCurso() {
		return idCurso;
	}

	public void setIdCurso(int idCurso) {
		this.idCurso = idCurso;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public int getCreditos() {
		return creditos;
	}

	public void setCreditos(int creditos) {
		this.creditos = creditos;
	}

	public double getDuracion() {
		return duracion;
	}

	public void setDuracion(double duracion) {
		this.duracion = duracion;
	}

		
}
