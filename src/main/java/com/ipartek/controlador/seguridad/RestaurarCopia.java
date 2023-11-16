package com.ipartek.controlador.seguridad;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ipartek.modelo.DAO_Constantes;
import com.ipartek.modelo.DB_Helper;
import com.ipartek.modelo.dto.Marca;
import com.ipartek.modelo.dto.Moto;

@WebServlet("/RestaurarCopia")
public class RestaurarCopia extends HttpServlet implements DAO_Constantes {
	private static final long serialVersionUID = 1L;

	public RestaurarCopia() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		
		//creamos la lista donde guardar los datos
		List<Marca> listaMarcas = new ArrayList<Marca>();
		
		//decimos que archivo leer
		FileReader fr = new FileReader(DIRECCION_CS_MARCAS_CSV);
		
		
		//leemos el fichero marcas.csv
		BufferedReader br = new BufferedReader(fr);

		String linea = "";
	
		//recorremos linea a linea el archivo
		while ((linea = br.readLine()) != null) {
			
			//dividimos cada linea por los ;
			String[] partes=linea.split(";");
			
			Marca marca= new Marca();
			
			marca.setId(Integer.parseInt(partes[0]));
			marca.setMarca(partes[1]);
			
			listaMarcas.add(marca);		
		}
		
		// leer el fichero motos.csv y guardar los csv en una lista de Moto (no en
		// V_MOTOS)
		List<Moto> listaMotos = new ArrayList<Moto>();

		FileReader fr2 = new FileReader(DIRECCION_CS_MOTOS_CSV);
		BufferedReader br2 = new BufferedReader(fr2);

		String linea2 = "";
	
		while ((linea2 = br2.readLine()) != null) {
			String[] partes=linea2.split(";");
			
			Moto moto= new Moto();
			
			moto.setId(Integer.parseInt(partes[0]));
			moto.setMatricula(partes[1]);
			moto.setModelo(partes[2]);
			moto.setPrecio(Double.parseDouble(partes[3]));
			moto.setDescripcion(partes[4]);
			moto.setCilindrada(Integer.parseInt(partes[5]));
			moto.setFk_marca(Integer.parseInt(partes[6]));
			moto.setFoto(partes[7]);
			
			listaMotos.add(moto);		
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
		doGet(request, response);
	}

}
