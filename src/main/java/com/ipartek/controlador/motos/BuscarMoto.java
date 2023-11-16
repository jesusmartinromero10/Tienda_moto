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

@WebServlet("/BuscarMoto")
public class BuscarMoto extends HttpServlet implements  DAO_Constantes{
	private static final long serialVersionUID = 1L;
       

    public BuscarMoto() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String texto="";
		if (request.getParameter("texto")!=null) {
			texto=request.getParameter("texto");
		}
		String matricula="";
		if (request.getParameter("matricula")!=null) {
			matricula=request.getParameter("matricula");
		}
		
		int cilindrada=0;
		if (request.getParameter("cilindrada")!=null && !request.getParameter("cilindrada").isEmpty()) {
			cilindrada=Integer.parseInt(request.getParameter("cilindrada"));
		}
		
		DB_Helper db= new DB_Helper();
		Connection con= db.conectar();

		List<V_Motos> listaMotos= db.obtenerMotosFiltro(con, texto, matricula, cilindrada);
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
