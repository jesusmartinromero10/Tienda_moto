<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plantilla</title>
<link rel="stylesheet" href="styles/styles.css">
<link rel="stylesheet" href="styles/styles_seguridad.css">
</head>

<body>

	<%@ include file="includes/cabecera.jsp"%>

	<main>
		 <a href="RealizarCopia" class="enlace-boton">Crear copia</a><br>
		 <a href="RestaurarCopia" class="enlace-boton">Restaurar copia</a><br>
		 
		 <br>
		 
		 <a href="RealizarCopiaJSON" class="enlace-boton">Crear copia JSON</a><br>
		 <a href="RestaurarCopiaJSON" class="enlace-boton">Restaurar copia JSON</a>
	</main>

	<%@ include file="includes/pie.jsp"%>

</body>
</html>