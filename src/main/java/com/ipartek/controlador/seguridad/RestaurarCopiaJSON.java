package com.ipartek.controlador.seguridad;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ipartek.modelo.DAO_Constantes;
import com.ipartek.modelo.DB_Helper;
import com.ipartek.modelo.dto.Marca;
import com.ipartek.modelo.dto.Moto;

@WebServlet("/RestaurarCopiaJSON")
public class RestaurarCopiaJSON extends HttpServlet implements DAO_Constantes {
	private static final long serialVersionUID = 1L;

	public RestaurarCopiaJSON() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// lista de marcas
		List<Marca> listaMarcas = new ArrayList<Marca>();

		FileReader fr = new FileReader(DIRECCION_CS_MARCAS_JSON);
		BufferedReader br = new BufferedReader(fr);

		String linea = "";

		while ((linea = br.readLine()) != null) {
			Marca[] ArrayMarcas = new Gson().fromJson(linea, Marca[].class);
			listaMarcas = Arrays.asList(ArrayMarcas);

		}

		// lista de MOTOS
		List<Moto> listaMotos = new ArrayList<Moto>();

		FileReader fr2 = new FileReader(DIRECCION_CS_MOTOS_JSON);
		BufferedReader br2 = new BufferedReader(fr2);

		String linea2 = "";
		while ((linea2 = br2.readLine()) != null) {
			Moto[] ArrayMotos = new Gson().fromJson(linea2, Moto[].class);
			listaMotos = Arrays.asList(ArrayMotos);

		}

		// conectarme a la base de datos
		DB_Helper db = new DB_Helper();
		Connection con = db.conectar();

		// borrar todo el contenido de las tablas
		db.vaciarBD(con);

		// guardo en la bd cada una de las marcas que tengo en la lista
		// que he leido desde el fichero, id incluido el que tenian

		for (Marca marca : listaMarcas) {
			db.restaurarMarca(con, marca);
		}

		// guardo en la bd cada una de las motos que tengo en la lista
		// que he leido desde el fichero, id incluido el que tenian
		for (Moto moto : listaMotos) {
			db.restaurarMoto(con, moto);
		}

		// desconecto
		db.desconectar(con);
		
		request.getRequestDispatcher(JSP_SEGURIDAD).forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
