<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cambiar Contraseña</title>
    <!-- Agregar Bootstrap 5.3.3 desde CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/token.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div class="container d-flex align-items-center justify-content-center min-vh-100">
        <div class="col-md-4">
            <h2 class="text-center mb-4">Cambiar Contraseña</h2>
            <form action="../srvToken" method="POST">
                <input type="hidden" name="accion" value="cambiarClave">
                <input type="hidden" name="email" value="<%= request.getParameter("email") %>">
                <div class="mb-3">
                    <label for="claveNueva" class="form-label">Nueva Contraseña:</label>
                    <input type="password" name="claveNueva" class="form-control" id="claveNueva" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Actualizar</button>
            </form>
        </div>
    </div>

    <!-- Agregar el JS de Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
