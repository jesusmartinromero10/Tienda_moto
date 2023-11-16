package com.ipartek.modelo;

public interface DAO_Constantes {

	// cadenas de conexion
	String BASE_DATOS = "bd_motos";
	String CONEXION = "jdbc:mysql://localhost:3306/" + BASE_DATOS;
	String DRIVER = "com.mysql.cj.jdbc.Driver";
	String USUARIO = "root";
	String PASS = "Tularosa";

	// archivos JSP
	String JSP_INDEX = "index.jsp";
	String JSP_SEGURIDAD = "seguridad.jsp";
	String JSP_FRM_MODIFICAR_MOTO = "frm_modificar_moto.jsp";

	// cosntantes de tablas y vistas

	String TABLA_MARCAS = "marcas";
	String MARCAS_ID = "id";
	String MARCAS_MARCA = "marca";

	String TABLA_MOTOS = "motos";
	String MOTO_ID = "id";
	String MOTO_MATRICULA = "matricula";
	String MOTO_MODELO = "modelo";
	String MOTO_PRECIO = "precio";
	String MOTO_DESCRIPCION = "descripcion";
	String MOTO_CILINDRADA = "cilindrada";
	String MOTO_FK_MARCA = "fk_marca";

	String VISTA_MOTOS = "v_motos";
	String V_MOTO_ID = "id";
	String V_MOTO_MATRICULA = "matricula";
	String V_MOTO_MODELO = "modelo";
	String V_MOTO_PRECIO = "precio";
	String V_MOTO_DESCRIPCION = "descripcion";
	String V_MOTO_CILINDRADA = "cilindrada";
	String V_MOTO_FK_MARCA = "fk_marca";
	String V_MOTO_MARCA = "marca";
	String V_MOTO_FOTO="foto";

	// constantes de llamadas a Stored procedures
	String SP_INSERTAR_MOTO = "call sp_insertar_moto(?, ?, ?, ?, ?, ?,?);";
	String SP_BORRAR_MOTO = "call sp_borrar_moto(?);";
	String SP_OBTENER_TODAS_MOTOS = "call sp_obtener_todas_motos();";
	String SP_OBTENER_MOTOS_FILTRADAS = "call sp_buscar_motos_restrictivo(?, ?, ?);";
	String SP_OBTENER_TODAS_MARCAS = "call sp_obtener_todas_marcas();";
	String SP_OBTENER_MOTO_POR_ID = "call sp_obtener_moto_por_id(?);";
	String SP_MODIFICAR_MOTO = "call sp_modificar_moto(?, ?, ?, ?, ?, ?, ?,?);";

	String SP_VACIAR_BD = "call sp_BORRAR_TODO();";
	String SP_RESTAURAR_MARCA = "call sp_insertar_marca_RESTAURACION(?, ?);";
	String SP_RESTAURAR_MOTO = "call sp_insertar_moto_RESTAURACION(?, ?, ?, ?, ?, ?, ?,?);";

	// constantes de Atributos de los formularios
	String ATR_LISTA_MOTOS = "atr_lista_motos";
	String ATR_LISTA_MARCAS = "atr_lista_marcas";
	String ATR_MOTO_POR_ID = "atr_moto_id";

	// constantes de rutas
	String DIRECCION_CS_MOTOS_CSV = "//Users//jesusmartinromero//Desktop//motos.csv";
	String DIRECCION_CS_MARCAS_CSV = "//Users//jesusmartinromero//Desktop//marcas.csv";
	String DIRECCION_CS_MOTOS_JSON = "//Users//jesusmartinromero//Desktop//motos.JSON";
	String DIRECCION_CS_MARCAS_JSON = "//Users//jesusmartinromero//Desktop//marcas.JSON";
}
