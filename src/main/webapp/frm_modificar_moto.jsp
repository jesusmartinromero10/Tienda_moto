<%@page import="java.util.ArrayList"%>
<%@page import="com.ipartek.modelo.dto.Marca"%>
<%@page import="java.util.List"%>
<%@page import="com.ipartek.modelo.DAO_Constantes"%>
<%@page import="com.ipartek.modelo.dto.V_Motos"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
V_Motos moto= new V_Motos();
if(request.getAttribute(DAO_Constantes.ATR_MOTO_POR_ID)!=null){
	moto=(V_Motos)request.getAttribute(DAO_Constantes.ATR_MOTO_POR_ID);
}


List<Marca> listaMarcas= new ArrayList<Marca>();
if(request.getAttribute(DAO_Constantes.ATR_LISTA_MARCAS)!=null){
	listaMarcas=(List<Marca>)request.getAttribute(DAO_Constantes.ATR_LISTA_MARCAS);
}



%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plantilla</title>
<link rel="stylesheet" href="styles/styles.css">
<link rel="stylesheet" href="styles/styles_index.css">
</head>

<body>

	<%@ include file="includes/cabecera.jsp"%>

	<main>
		<section>
			<h2>Modificar moto</h2>
			<form method="POST" action="ModificarMoto" enctype="multipart/form-data">
			<input type="text" name="id" value="<%=moto.getId() %>" readonly required><br>
			
			<input type="text" name="matricula" value="<%=moto.getMatricula()%>" required><br>
			
			<input type="text" name="modelo" value="<%=moto.getModelo() %>" required><br>
			
			<select name="marca">
			<%for(Marca elemento:listaMarcas) {
			if(elemento.getId()!=moto.getFk_marca()){%>
				<option value="<%= elemento.getId()%>"><%= elemento.getMarca()%></option>
			<%}else{%>
				<option selected value="<%= elemento.getId()%>"><%= elemento.getMarca()%></option>
			<%}
			}%>
			</select><br>
			
			<textarea name="descripcion" required><%=moto.getDescripcion() %></textarea><br>
			
			<input type="text" name="cilindrada" value="<%=moto.getCilindrada() %>" required pattern="[0-9]{1,4}"><br>
			
			<input type="text" name="precio" value="<%=moto.getPrecio() %>"required pattern="[0-9]{1,7}(\.[0-9]{0,2})?|^[0-9]{1,7}"><br>
			
			<input type="file" name="foto" accept="image/jpeg,image/jpg" value="<%=moto.getFoto()%>"/>
			
			<input type="submit" value="Modificar">
			
			
			
			</form>
		</section>
	
	

	</main>

	<%@ include file="includes/pie.jsp"%>

</body>
</html>