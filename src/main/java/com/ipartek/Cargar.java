package com.ipartek;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ipartek.modelo.DAO_Constantes;
import com.ipartek.modelo.DB_Helper;
import com.ipartek.modelo.dto.Marca;
import com.ipartek.modelo.dto.V_Motos;

@WebServlet("/Cargar")
public class Cargar extends HttpServlet implements DAO_Constantes {
	private static final long serialVersionUID = 1L;

	public Cargar() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		DB_Helper db = new DB_Helper();
		Connection con = db.conectar();

		List<V_Motos> listaMotos = db.obtenerTodasMotos(con);
		List<Marca> listaMarcas = db.obtenerTodasMarcas(con);

		db.desconectar(con);

		request.setAttribute(ATR_LISTA_MOTOS, listaMotos);
		request.setAttribute(ATR_LISTA_MARCAS, listaMarcas);

		request.getRequestDispatcher(JSP_INDEX).forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
