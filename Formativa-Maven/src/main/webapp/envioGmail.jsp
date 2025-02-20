<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Config.MailSender" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Envio de Correo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container mt-5">
        <h2 class="text-center">Enviar Correo</h2>
        <form method="post">
            <div class="mb-3">
                <input type="email" class="form-control" name="destinatario" placeholder="Destinatario" required>
            </div>
            <div class="mb-3">
                <input type="text" class="form-control" name="asunto" placeholder="Asunto" required>
            </div>
            <div class="mb-3">
                <textarea class="form-control" name="mensaje" placeholder="Mensaje" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary w-100">Enviar</button>
        </form>

        <%
            if (request.getMethod().equalsIgnoreCase("post")) {
                String destinatario = request.getParameter("destinatario");
                String asunto = request.getParameter("asunto");
                String mensaje = request.getParameter("mensaje");

                boolean resultado = MailSender.enviarCorreo(destinatario, asunto, mensaje);

                if (resultado) {
        %>
                    <div class="alert alert-success mt-3">Correo enviado correctamente.</div>
        <%
                } else {
        %>
                    <div class="alert alert-danger mt-3">Error al enviar el correo.</div>
        <%
                }
            }
        %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

