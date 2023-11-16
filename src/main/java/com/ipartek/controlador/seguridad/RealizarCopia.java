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

import com.ipartek.modelo.DAO_Constantes;
import com.ipartek.modelo.DB_Helper;
import com.ipartek.modelo.dto.Marca;
import com.ipartek.modelo.dto.V_Motos;


@WebServlet("/RealizarCopia")
public class RealizarCopia extends HttpServlet implements DAO_Constantes{
	private static final long serialVersionUID = 1L;
       
 
    public RealizarCopia() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//nos conectamos a la base de datos
		DB_Helper db= new DB_Helper();
		Connection con= db.conectar();
		
		//obtenemos los datos a guardar
		List<Marca> listaMarcas= db.obtenerTodasMarcas(con);
		List<V_Motos> listaMotos= db.obtenerTodasMotos(con);
		
		System.out.println("Sssssssss"+listaMotos);
		
		db.desconectar(con);
		
		
		//Creamos el archivo donde guardarlo
		FileWriter archivo = new FileWriter(DIRECCION_CS_MARCAS_CSV);
		
		//Lo preparamos para escribir
		PrintWriter pw = new PrintWriter(archivo);
		
		//escribimos el archivo linea a linea
		for (Marca elemento : listaMarcas) {
			pw.println(elemento);
		}
		archivo.close();
	
		
		FileWriter archivo2 = new FileWriter(DIRECCION_CS_MOTOS_CSV);
		PrintWriter pw2 = new PrintWriter(archivo2);
		for (V_Motos elemento : listaMotos) {
			pw2.println(elemento);
		}
		archivo2.close();
		
		
		request.getRequestDispatcher(JSP_SEGURIDAD).forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
