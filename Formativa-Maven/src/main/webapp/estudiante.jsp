<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Personas</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<!-- Formulario -->
	<div class="container py-4">
        <h3>Formulario Estudiante</h3>
        <form action="srvEstudiante" method="POST">
            <div class="mb-3">
                <label for="idestudiante" class="form-label">id</label>
                <input type="number" class="form-control" id="nombre" name="txtidEstudiante" 
                	value="${estudianteSeleccionado != null ? estudianteSeleccionado.idEstudiante : ''}" >
            </div>
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombres</label>
                <input type="text" class="form-control" id="nombre" name="txtnombre" 
                	value="${estudianteSeleccionado != null ? estudianteSeleccionado.nombre : ''}" required>
            </div>
            <div class="mb-3">
				<label for="fechaNacimiento" class="form-label">Fecha de Nacimiento</label> 
				<input type="date" class="form-control" id="fechaNacimiento" name="txtfechaNacimiento" 
					value="${estudianteSeleccionado != null ? estudianteSeleccionado.fechaNacimiento : ''}" required>
			</div>
            <div class="mb-3">
                <label for="correo" class="form-label">Correo</label>
                <input type="email" class="form-control" id="correo" name="txtcorreo" 
                	value="${estudianteSeleccionado != null ? estudianteSeleccionado.correo : ''}" required>
            </div>
            
            <div class="mb-3">
                <label for="contraseña" class="form-label">Direccion</label>
                <input type="text" class="form-control" id="direccion" name="txtdireccion" 
                	value="${estudianteSeleccionado != null ? estudianteSeleccionado.direccion : ''}" required>
            </div>

            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-success" name="accion" value="Add">Agregar</button>
                <button type="submit" class="btn btn-primary" name="accion" value="Update">Actualizar</button>
            </div>
        </form>
    </div>

	<!-- tabla -->
	<div class="container py-4">
		<h3>Tabla Estudiantes</h3>
		<form action="srvEstudiante" method="POST">
			<input type="submit" class="btn btn-info mx-2" name="accion"
				value="Listar">
		</form>
		<br>
		<div class="table-responsive">
			<table class="table">
				<thead class="table-light">
					<tr>
						<th>ID</th>
						<th>NOMBRES</th>
						<th>FECHA DE NACIMIENTO</th>
						<th>CORREO</th>
						<th>DIRECCION</th>
						<th>ACCIONES</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dato" items="${datos}">
						<tr>
							<td>${dato.getIdEstudiante()}</td>
							<td>${dato.getNombre()}</td>
							<td>${dato.getFechaNacimiento()}</td>
							<td>${dato.getCorreo()}</td>
							<td>${dato.getDireccion()}</td>
							<td>
								<form action="srvEstudiante" method="POST">
                                    <input type="hidden" name="id" value="${dato.idEstudiante}">
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


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>