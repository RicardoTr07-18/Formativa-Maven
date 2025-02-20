<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Estadísticas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <div class="container py-4">
        <h3>Formulario Estadística</h3>
        <form action="srvEstadistica" method="POST">
            <div class="mb-3">
                <label for="idEstadistica" class="form-label">ID Estadística</label>
                <input type="number" class="form-control" id="idEstadistica" name="txtidEstadistica" value="${estadisticaSeleccionado != null ? estadisticaSeleccionado.idEstadistica : ''}">
            </div>
            
			<div class="mb-3">
			    <label for="idEstudiante" class="form-label">Estudiante</label>
			    <select class="form-control" id="idEstudiante" name="txtidEstudiante" required>
			        <option value="">Seleccione un estudiante</option>
			        <c:forEach var="est" items="${listaEstudiantes}">
			            <option value="${est.idEstudiante}" ${estadisticaSeleccionado != null && estadisticaSeleccionado.idEstudianteEt == est.idEstudiante ? 'selected' : ''}>
			                ${est.nombre}
			            </option>
			        </c:forEach>
			    </select>
			</div>
			
			<div class="mb-3">
			    <label for="idCurso" class="form-label">Curso</label>
			    <select class="form-control" id="idCurso" name="txtidCurso" required>
			        <option value="">Seleccione un curso</option>
			        <c:forEach var="cso" items="${listaCursos}">
			            <option value="${cso.idCurso}" ${estadisticaSeleccionado != null && estadisticaSeleccionado.idCursoEt == cso.idCurso ? 'selected' : ''}>
			                ${cso.nombre}
			            </option>
			        </c:forEach>
			    </select>
			</div>

            <div class="mb-3">
                <label for="asistencia" class="form-label">Asistencia</label>
                <input type="number" step="0.01" class="form-control" id="asistencia" name="txtasistencia" value="${estadisticaSeleccionado != null ? estadisticaSeleccionado.asistencia : ''}" required>
            </div>
            <div class="mb-3">
                <label for="tiempoestudio" class="form-label">Tiempo de Estudio</label>
                <input type="number" step="0.01" class="form-control" id="tiempoestudio" name="txttiempoEstudio" value="${estadisticaSeleccionado != null ? estadisticaSeleccionado.tiempoestudio : ''}" required>
            </div>
            <div class="mb-3">
                <label for="promedio" class="form-label">Promedio</label>
                <input type="number" step="0.01" class="form-control" id="promedio" name="txtpromedio" value="${estadisticaSeleccionado != null ? estadisticaSeleccionado.promedio : ''}" required>
            </div>
            <div class="mb-3">
                <label for="participacion" class="form-label">Participación</label>
                <input type="number" step="0.01" class="form-control" id="participacion" name="txtparticipacion" value="${estadisticaSeleccionado != null ? estadisticaSeleccionado.participacion : ''}" required>
            </div>
            <div class="mb-3">
                <label for="idiomas" class="form-label">Idiomas</label>
                <input type="text" class="form-control" id="idiomas" name="txtidiomas" value="${estadisticaSeleccionado != null ? estadisticaSeleccionado.idiomas : ''}" required>
            </div>

            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-success" name="accion" value="Add">Agregar</button>
                <button type="submit" class="btn btn-primary" name="accion" value="Update">Actualizar</button>
            </div>
        </form>
    </div>

    <div class="container py-4">
        <h3>Tabla Estadísticas</h3>
        <form action="srvEstadistica" method="POST">
            <button type="submit" class="btn btn-info mx-2" name="accion" value="Listar">Listar</button>
        </form>
        <br>
        <div class="table-responsive">
            <table class="table">
                <thead class="table-light">
                    <tr>
                        <th>ID Estadística</th>
                        <th>Estudiante</th>
                        <th>Curso</th>
                        <th>Asistencia</th>
                        <th>Tiempo de Estudio</th>
                        <th>Promedio</th>
                        <th>Participación</th>
                        <th>Idiomas</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dato" items="${datos}">
                        <tr>
                            <td>${dato.idEstadistica}</td>
                            <td>${dato.nombreEst}</td>  <!-- Aquí mostramos el nombre del estudiante -->
                            <td>${dato.nombreCso}</td>  <!-- Aquí mostramos el nombre del curso -->
                            <td>${dato.asistencia}</td>
                            <td>${dato.tiempoestudio}</td>
                            <td>${dato.promedio}</td>
                            <td>${dato.participacion}</td>
                            <td>${dato.idiomas}</td>
                            <td>
                                <form action="srvEstadistica" method="POST">
                                    <input type="hidden" name="id" value="${dato.idEstadistica}">
                                    <button type="submit" class="btn btn-warning" name="accion" value="Edit">Editar</button>
                                    <button type="submit" class="btn btn-danger" name="accion" value="Delete">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

