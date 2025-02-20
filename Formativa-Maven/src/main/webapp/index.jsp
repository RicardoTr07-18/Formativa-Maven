<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Inicio de Sesión</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="css/logindex.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="login-container">
		<div class="logo-section">
			<img src="img/Logo.png" alt="Logo">
		</div>
		<div class="form-section">
			<h2>Inicio de Sesión</h2>


			<!-- Mostrar el mensaje de error en caso de que exista -->
			<c:if test="${not empty error}">
				<div class="alert alert-danger" role="alert">${error}</div>
			</c:if>


			<form action="srvLogin" method="POST">
				<div class="form-group">
					<label for="exampleInputEmail1">Correo Electrónico</label> 
					<input type="email" class="form-control" id="exampleInputEmail1" name="email" placeholder="Ingresa tu correo" required>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Contraseña</label> 
					<input type="password" class="form-control" id="exampleInputPassword1" name="clave" placeholder="Ingresa tu contraseña" required>
				</div>
				<button type="submit" class="btn btn-primary">
					Iniciar Sesión
				</button>
			</form>
			
			
			<div class="footer-text">
				<p>
					¿No tienes cuenta? <a href="token/claveOlvidada.jsp">Olvidaste la Contraseña?</a>
				</p>
			</div>
			
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>
