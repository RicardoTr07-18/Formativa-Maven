<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cursos Disponibles</title>

    <!-- Link to Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link href="css/curso.css" rel="stylesheet" type="text/css" />
    <!-- Custom CSS for Styling -->
</head>

<body>

    <!-- Container for the courses listing -->
    <div class="container py-4">

        <!-- Title Section -->
        <h3 class="text-center">Cursos Disponibles</h3>

        <!-- Form for listing courses -->
        <form action="srvCurso" method="GET" class="d-flex justify-content-center mb-4">
            <input type="hidden" name="accion" value="Listar" />
            <input type="submit" class="btn btn-info" value="Listar Cursos" />
        </form>

        <!-- Filtered courses displayed in cards -->
        <div class="row row-cols-1 row-cols-md-3 g-4">

            <!-- Iteration of courses from the request -->
            <c:forEach var="dato" items="${datos}">
                <div class="col">
                    <div class="card shadow-lg h-100">
                        <!-- Optional course image -->
                        <!-- <img src="img/cursos.jpg" class="card-img-top" alt="Curso" style="height: 200px; object-fit: cover;"> -->
                        <div class="card-body">
                            <h5 class="card-title">${dato.nombre}</h5>
                            <p class="card-text">${dato.descripcion}</p>
                            <ul class="list-unstyled">
                                <li><strong>Duración:</strong> ${dato.duracion}</li>
                                <li><strong>Créditos:</strong> ${dato.creditos}</li>
                                <li><strong>Código:</strong> ${dato.codigo}</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>

</html>

