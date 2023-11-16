package com.ipartek.controlador.motos;

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

@WebServlet("/BorrarMoto")
public class BorrarMoto extends HttpServlet implements DAO_Constantes {
	private static final long serialVersionUID = 1L;
       
    public BorrarMoto() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id=0;
		if (request.getParameter("id")!=null) {
			id=Integer.parseInt(request.getParameter("id"));
		}
		
		DB_Helper db= new DB_Helper();
		Connection con= db.conectar();
		
		db.borrarMoto(con, id);
		List<V_Motos> listaMotos= db.obtenerTodasMotos(con);
		List<Marca> listaMarcas= db.obtenerTodasMarcas(con);
		
		db.desconectar(con);
		
		request.setAttribute(ATR_LISTA_MOTOS, listaMotos);
		request.setAttribute(ATR_LISTA_MARCAS, listaMarcas);
		
		request.getRequestDispatcher(JSP_INDEX).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
