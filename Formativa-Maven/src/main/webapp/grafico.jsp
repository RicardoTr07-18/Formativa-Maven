<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Estadísticas de Estudiantes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div class="container py-4">
        <h3>Estadísticas de Estudiantes</h3>
        <form action="srvGrafico" method="GET">
            <input type="submit" class="btn btn-info mx-2" name="accion" value="Listar">
        </form>
        <br>
        <div class="row">
    <div class="col-md-4">
        <canvas id="barChart"></canvas>
    </div>
    <div class="col-md-4">
        <canvas id="pieChart"></canvas>
    </div>
    <div class="col-md-4">
        <canvas id="radarChart"></canvas>
    </div>
</div>
<br>
<div class="row">
    <div class="col-md-4">
        <canvas id="doughnutChart"></canvas>
    </div>
    <div class="col-md-4">
        <canvas id="lineChart"></canvas>
    </div>
    <div class="col-md-4">
        <canvas id="bubbleChart"></canvas>
    </div>
</div>


    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var ctxBar = document.getElementById('barChart').getContext('2d');
            var ctxPie = document.getElementById('pieChart').getContext('2d');
            var ctxRadar = document.getElementById('radarChart').getContext('2d');
            var ctxDoughnut = document.getElementById('doughnutChart').getContext('2d');
            var ctxLine = document.getElementById('lineChart').getContext('2d');
            var ctxBubble = document.getElementById('bubbleChart').getContext('2d');

            var nombres = [];
            var asistencias = [];
            var promedios = [];
            var participaciones = [];
            var tiemposEstudio = [];
            var cursonom = [];

            <c:forEach var="dato" items="${datos}">
                nombres.push("${dato.getNombreEst()}");
                asistencias.push(${dato.getAsistencia()});
                promedios.push(${dato.getPromedio()});
                participaciones.push(${dato.getParticipacion()});
                tiemposEstudio.push(${dato.getTiempoestudio()});
                cursonom.push("${dato.getNombreCso()}");
            </c:forEach>

            var cursoCount = {};
            cursonom.forEach(curso => {
                cursoCount[curso] = (cursoCount[curso] || 0) + 1;
            });

            new Chart(ctxBar, {
                type: 'bar',
                data: {
                    labels: Object.keys(cursoCount), // Cursos como etiquetas
                    datasets: [{
                        label: 'Cantidad de estudiantes',
                        data: Object.values(cursoCount), // Cantidad de estudiantes por curso
                        backgroundColor: 'rgba(54, 162, 235, 0.5)'
                    }]
                }
            });


            new Chart(ctxPie, {
                type: 'pie',
                data: {
                    labels: nombres,
                    datasets: [{
                        label: 'Promedio',
                        data: promedios,
                        backgroundColor: ['red', 'blue', 'yellow', 'green', 'purple']
                    }]
                }
            });

            
            
            new Chart(ctxRadar, {
                type: 'radar',
                data: {
                    labels: nombres,
                    datasets: [{
                        label: 'Participación',
                        data: participaciones,
                        backgroundColor: 'rgba(75, 192, 192, 0.5)'
                    }]
                }
            });

            
            
            var asistenciaCount = {};
	         // Contar cuántos estudiantes tienen el mismo valor de asistencia
	         asistencias.forEach(asistencia => {
	             asistenciaCount[asistencia] = (asistenciaCount[asistencia] || 0) + 1;
	         });
	
	         new Chart(ctxDoughnut, {
	             type: 'doughnut',
	             data: {
	                 labels: Object.keys(asistenciaCount), // Valores únicos de asistencia
	                 datasets: [{
	                     label: 'Cantidad de estudiantes',
	                     data: Object.values(asistenciaCount), // Número de estudiantes con esa asistencia
	                     backgroundColor: ['orange', 'blue', 'green', 'red', 'yellow']
	                 }]
	             }
	         });


         
	     	 // Calcular el promedio de tiempo de estudio
	         var totalTiempo = tiemposEstudio.reduce((sum, tiempo) => sum + tiempo, 0);
	         var promedioTiempo = totalTiempo / tiemposEstudio.length;
	         // Crear un array del mismo tamaño que `nombres`, lleno con el promedio
	         var promedioArray = Array(nombres.length).fill(promedioTiempo);
	         new Chart(ctxLine, {
	             type: 'line',
	             data: {
	                 labels: nombres,
	                 datasets: [
	                     {
	                         label: 'Tiempo de Estudio',
	                         data: tiemposEstudio,
	                         backgroundColor: 'rgba(153, 102, 255, 0.5)',
	                         borderColor: 'rgba(153, 102, 255, 1)',
	                         fill: false
	                     },
	                     {
	                         label: 'Promedio de Tiempo de Estudio',
	                         data: promedioArray,
	                         borderColor: 'rgba(255, 99, 132, 1)',
	                         borderDash: [5, 5], // Línea punteada para diferenciarlo
	                         fill: false
	                     }
	                 ]
	             }
	         });

         

            new Chart(ctxBubble, {
                type: 'bubble',
                data: {
                    datasets: [{
                        label: 'Relación Promedio - Participación',
                        data: nombres.map((nombre, i) => ({
                            x: promedios[i],
                            y: participaciones[i],
                            r: asistencias[i] / 2 // Tamaño de burbuja proporcional a asistencia
                        })),
                        backgroundColor: 'rgba(255, 99, 132, 0.5)'
                    }]
                },
                options: {
                    scales: {
                        x: { title: { display: true, text: 'Promedio' } },
                        y: { title: { display: true, text: 'Participación' } }
                    }
                }
            });

        });
    </script>
    <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>