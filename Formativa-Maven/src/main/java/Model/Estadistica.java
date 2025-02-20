package Model;

public class Estadistica {
    private int idEstadistica;
    private int idEstudianteEt;
    private String nombreEst;
    private int idCursoEt;
    private String nombreCso;
    private double duracionCso;
    private double asistencia;         
    private double tiempoestudio;       
    private double promedio;              
    private double participacion;         
    private String idiomas;
    
    public Estadistica() {
		// TODO Auto-generated constructor stub
	}

	public Estadistica(int idEstadistica, int idEstudianteEt, String nombreEst, int idCursoEt, String nombreCso,
			double duracionCso, double asistencia, double tiempoestudio, double promedio, double participacion,
			String idiomas) {
		super();
		this.idEstadistica = idEstadistica;
		this.idEstudianteEt = idEstudianteEt;
		this.nombreEst = nombreEst;
		this.idCursoEt = idCursoEt;
		this.nombreCso = nombreCso;
		this.duracionCso = duracionCso;
		this.asistencia = asistencia;
		this.tiempoestudio = tiempoestudio;
		this.promedio = promedio;
		this.participacion = participacion;
		this.idiomas = idiomas;
	}

	public int getIdEstadistica() {
		return idEstadistica;
	}

	public void setIdEstadistica(int idEstadistica) {
		this.idEstadistica = idEstadistica;
	}

	public int getIdEstudianteEt() {
		return idEstudianteEt;
	}

	public void setIdEstudianteEt(int idEstudianteEt) {
		this.idEstudianteEt = idEstudianteEt;
	}

	public String getNombreEst() {
		return nombreEst;
	}

	public void setNombreEst(String nombreEst) {
		this.nombreEst = nombreEst;
	}

	public int getIdCursoEt() {
		return idCursoEt;
	}

	public void setIdCursoEt(int idCursoEt) {
		this.idCursoEt = idCursoEt;
	}

	public String getNombreCso() {
		return nombreCso;
	}

	public void setNombreCso(String nombreCso) {
		this.nombreCso = nombreCso;
	}

	public double getDuracionCso() {
		return duracionCso;
	}

	public void setDuracionCso(double duracionCso) {
		this.duracionCso = duracionCso;
	}

	public double getAsistencia() {
		return asistencia;
	}

	public void setAsistencia(double asistencia) {
		this.asistencia = asistencia;
	}

	public double getTiempoestudio() {
		return tiempoestudio;
	}

	public void setTiempoestudio(double tiempoestudio) {
		this.tiempoestudio = tiempoestudio;
	}

	public double getPromedio() {
		return promedio;
	}

	public void setPromedio(double promedio) {
		this.promedio = promedio;
	}

	public double getParticipacion() {
		return participacion;
	}

	public void setParticipacion(double participacion) {
		this.participacion = participacion;
	}

	public String getIdiomas() {
		return idiomas;
	}

	public void setIdiomas(String idiomas) {
		this.idiomas = idiomas;
	}	
    
}
