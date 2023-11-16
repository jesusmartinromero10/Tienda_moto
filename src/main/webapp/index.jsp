<%@page import="com.ipartek.modelo.dto.Marca"%>
<%@page import="com.ipartek.modelo.DAO_Constantes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ipartek.modelo.dto.V_Motos"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<V_Motos> listaMotos= new ArrayList<V_Motos>();
if(request.getAttribute(DAO_Constantes.ATR_LISTA_MOTOS)!=null){
	listaMotos=(List<V_Motos>)request.getAttribute(DAO_Constantes.ATR_LISTA_MOTOS);
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
<title>MilMotos</title>
<link rel="stylesheet" href="styles/styles.css">
<link rel="stylesheet" href="styles/styles_index.css">
</head>

<body>

	<%@ include file="includes/cabecera.jsp"%>

	<main>
	<div id="crud_motos_sup">
		<section>
			<h2>Agregar moto nueva</h2>
			<form method="POST" action="AgregarMoto" enctype="multipart/form-data">
				<input type="text" name="matricula" placeholder="Matricula" required><br>
				
				<input type="text" name="modelo" placeholder="Modelo" required><br>
				
				<select name="marca">
				<%for(Marca elemento:listaMarcas) {%>
					<option value="<%= elemento.getId()%>"><%= elemento.getMarca()%></option>
				<%}%>
				</select><br>
				
				<textarea name="descripcion" placeholder="Descripcion" required></textarea><br>
				
				<input type="text" name="cilindrada" placeholder="Cilindrada" required pattern="[0-9]{1,4}"><br>
				
				<input type="text" name="precio" placeholder="Precio" required pattern="[0-9]{1,7}(\.[0-9]{0,2})?|^[0-9]{1,7}"><br>
				
				<input type="file" name="foto" accept="image/jpeg,image/jpg"/>
				
				<input type="submit" value="Agregar">

			</form>
		</section>
			
		<section>
			<h2>Buscar motos</h2>
			<form method="GET" action="BuscarMoto">
			<input type="text" name="texto" placeholder="Texto a buscar"><br>
			
			<input type="text" name="cilindrada" placeholder="Cilindrada"><br>
			
			<input type="text" name="matricula" placeholder="Matricula"><br>
			<input type="submit" value="Buscar">
			</form>
		</section>	
	</div>	
	
	<div id="crud_motos_inf">
	
	<form method="get" action="MultiBorrar">
		 <table class="tabla">
	        <thead>
	            <tr class="tabla_cabecera">
	                <th>
						<input type="submit" value="Borrar">
					</th>
					<th>Foto</th>
	                <th>Matricula</th>
	                <th>Marca</th>
	                <th>Modelo</th>
	                <th>Descripcion</th>
	                <th>Cilindrada</th>
	                <th>Precio</th>
	                <th>Opciones</th>
	            </tr>
	        </thead>
	        <tbody>
	        <%for(V_Motos elem:listaMotos) {%>
	            <tr>
	                <td>
	                	<input type="checkbox" value="<%=elem.getId()%>" name="id">
	                </td>
	                
	                <td><img src="imagenes/<%=elem.getFoto()%>" id="img_index" style="width: 50px; height: 50px"></td>
	                <td><%=elem.getMatricula()%></td>
	                <td><%=elem.getMarca()%></td>
	                <td><%=elem.getModelo()%></td>
	                <td><%=elem.getDescripcion()%></td>
	                <td><%=elem.getCilindrada()%> cc</td>
	                <td><%=elem.getPrecio()%> €</td>
	                <td>
	                	<a href="BorrarMoto?id=<%=elem.getId()%>">Borrar</a>
	                	<a href="FrmModificarMoto?id=<%=elem.getId()%>">Modificar</a>
	                </td>
	            </tr>
	           <%}%>
	            
	        </tbody>
	    </table>
	</form>
	</div>

	</main>

	<%@ include file="includes/pie.jsp"%>

</body>
</html>