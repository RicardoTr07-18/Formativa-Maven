<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ingresar Código</title>
    <!-- Agregar Bootstrap 5.3.3 desde CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/token.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div class="container d-flex align-items-center justify-content-center min-vh-100">
        <div class="col-md-4">
            <h2 class="text-center mb-4">Ingresar Código de Recuperación</h2>
            <form action="../srvToken" method="POST">
                <input type="hidden" name="accion" value="validarToken">
                <input type="hidden" name="email" value="<%= request.getParameter("email") %>">
                <div class="mb-3">
                    <label for="token" class="form-label">Código:</label>
                    <input type="text" name="token" class="form-control" id="token" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Validar</button>
            </form>
            <% if (request.getParameter("error") != null) { %>
                <div class="alert alert-danger mt-3" role="alert">
                    <%= request.getParameter("error") %>
                </div>
            <% } %>
        </div>
    </div>

    <!-- Agregar el JS de Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
