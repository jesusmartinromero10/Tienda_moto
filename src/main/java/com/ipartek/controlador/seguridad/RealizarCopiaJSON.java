package com.ipartek.controlador.seguridad;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
import com.ipartek.modelo.dto.V_Motos;

@WebServlet("/RealizarCopiaJSON")
public class RealizarCopiaJSON extends HttpServlet implements DAO_Constantes {
	private static final long serialVersionUID = 1L;
       
  
    public RealizarCopiaJSON() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		//nos conectamos a la base de datos
		DB_Helper db= new DB_Helper();
		Connection con= db.conectar();
		
		
		//obtenemos los datos a guardar
		List<Marca> listaMarcas= db.obtenerTodasMarcas(con);
		List<V_Motos> listaMotos= db.obtenerTodasMotos(con);
		
		db.desconectar(con);
		
		
		//guardar cada lista en un fichero diferente
		FileWriter archivoMarcas = new FileWriter(DIRECCION_CS_MARCAS_JSON);
		PrintWriter pwMarcas = new PrintWriter(archivoMarcas);
		
		String jsonMarcas= new Gson().toJson(listaMarcas);
		pwMarcas.println(jsonMarcas);
		
		archivoMarcas.close();
		
		//Creamos el archivo donde guardarlo
		FileWriter archivoMotos = new FileWriter(DIRECCION_CS_MOTOS_JSON);
		
		//Lo preparamos para escribir
		PrintWriter pwMotos = new PrintWriter(archivoMotos);
		
		//pasamos a formato json la lista
		String jsonMotos= new Gson().toJson(listaMotos);
		
		//Escribimos en el archivo
		pwMotos.println(jsonMotos);
		
		archivoMotos.close();
				
		request.getRequestDispatcher(JSP_SEGURIDAD).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
