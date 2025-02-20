<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Model.Administrador" %>
<%
    // Recuperamos el objeto estudiante de la sesión
    Administrador administrador = (Administrador) session.getAttribute("administrador");
    if (administrador != null) {
%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Menu</title>

        <!-- Enlace al archivo CSS externo -->
        <link href="../css/barra.css" rel="stylesheet" type="text/css"/>
        <!-- Bootstrap core CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    </head>
    <body>

        <!-- Barra de navegación horizontal -->
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Formativa</a>
                <ul class="navbar-nav ms-auto"> <!-- 'ms-auto' para alinear a la derecha -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            hola : <%= administrador.getNombre() %>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="../srvLogin?accion=logout">Cerrar Sesión</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>


        <!-- Contenedor principal con la barra vertical -->
        <main>
            <div class="d-flex flex-column flex-shrink-0 p-3 waifu" style="width: 280px;">               
                <hr>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link link-light" href="../inicio.jsp" target="miContenedor">
                            <i class="fas fa-home me-2"></i> Inicio
                        </a>
                    </li>
                    <li>
					    <form action="../srvAdministrador" method="POST" target="miContenedor">
					        <input type="hidden" name="accion" value="Listar">
					        <button class="nav-link link-light botoncolor">
					            	<i class="fas fa-cogs me-2"></i> Administradores
					        </button>
					    </form>
					</li>
					<li>
					    <form action="../srvEstudiante" method="POST" target="miContenedor">
					        <input type="hidden" name="accion" value="Listar">
					        <button class="nav-link link-light botoncolor">
					            	<i class="fas fa-user-graduate me-2"></i> Estudiantes
					        </button>
					    </form>
					</li>       
                    <li>
					    <a class="nav-link link-light" href="../srvCurso?accion=Listar" target="miContenedor">
					        <i class="fas fa-book me-2"></i> Cursos
					    </a>
					</li>
					<li>
					    <form action="../srvEstadistica" method="POST" target="miContenedor">
					        <input type="hidden" name="accion" value="Listar">
					        <button class="nav-link link-light botoncolor">
					            	<i class="fas fa-user-graduate me-2"></i> Rendimiento
					        </button>
					    </form>
					</li>
                    <li>
                        <a class="nav-link link-light" href="../srvGrafico?accion=Listar" target="miContenedor">
					        <i class="fas fa-book me-2"></i> Grafico
					    </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link link-light" href="../envioGmail.jsp" target="miContenedor">
                            <i class="fas fa-envelope me-2"></i> Preguntas
                        </a>
                    </li>

                </ul>
                <hr>
            </div>
            <div class="b-example-divider"></div>
            
            
            <!-- Esto va a llamar a las listas que tengan el target="miContenedor", y va a traer las paginas en el mismo web y no redirigirnos -->
            <div class="container-fluid p-0 main-content">
		      <iframe name="miContenedor" class="w-100" style="height: 100vh;" frameborder="0"></iframe>
		    </div>
		    
        </main>
        
        
        <%
    } else {
        response.sendRedirect("index.jsp");  // Si no hay sesión, redirigir al login
    }
%>
<script src="../js/sidebars.js"></script>
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

