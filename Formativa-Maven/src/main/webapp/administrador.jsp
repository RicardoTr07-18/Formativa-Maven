<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Administradores</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <div class="container py-4">
        <h3>Formulario Administrador</h3>
        <form action="srvAdministrador" method="POST">
            <div class="mb-3">
                <label for="nombre" class="form-label">id</label>
                <input type="number" class="form-control" id="nombre" name="txtidAdministrador" value="${administradorSeleccionado != null ? administradorSeleccionado.idAdministrador : ''}" >
            </div>
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombres</label>
                <input type="text" class="form-control" id="nombre" name="txtnombre" value="${administradorSeleccionado != null ? administradorSeleccionado.nombre : ''}" required>
            </div>
            <div class="mb-3">
                <label for="correo" class="form-label">Correo</label>
                <input type="email" class="form-control" id="correo" name="txtcorreo" value="${administradorSeleccionado != null ? administradorSeleccionado.correo : ''}" required>
            </div>
            
            <div class="mb-3">
                <label for="clave" class="form-label">CLAVE</label>
                <input type="password" class="form-control" id="contraseña" name="txtclave" value="${administradorSeleccionado != null ? administradorSeleccionado.clave : ''}" required>
            </div>

            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-success" name="accion" value="Add">Agregar</button>
                <button type="submit" class="btn btn-primary" name="accion" value="Update">Actualizar</button>
            </div>
        </form>
    </div>

    <div class="container py-4">
        <h3>Tabla Administrador</h3>
        <form action="srvAdministrador" method="POST">
            <button type="submit" class="btn btn-info mx-2" name="accion" value="Listar">Listar</button>
        </form>
        <br>
        <div class="table-responsive">
            <table class="table">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>NOMBRES</th>
                        <th>CORREO</th>
                        <th>CONTRASEÑA</th>
                        <th>ACCIONES</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dato" items="${datos}">
                        <tr>
                            <td>${dato.idAdministrador}</td>
                            <td>${dato.nombre}</td>
                            <td>${dato.correo}</td>
                            <td>${dato.clave}</td>
                            <td> 
                                <form action="srvAdministrador" method="POST">
                                    <input type="hidden" name="id" value="${dato.idAdministrador}">
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