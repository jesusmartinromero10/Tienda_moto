package com.ipartek.controlador.motos;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.ipartek.modelo.DAO_Constantes;
import com.ipartek.modelo.DB_Helper;
import com.ipartek.modelo.dto.Marca;
import com.ipartek.modelo.dto.Moto;
import com.ipartek.modelo.dto.V_Motos;

@WebServlet("/AgregarMoto")
@MultipartConfig
public class AgregarMoto extends HttpServlet implements DAO_Constantes {
	private static final long serialVersionUID = 1L;

	public AgregarMoto() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String matricula = "";
		if (request.getParameter("matricula") != null) {
			matricula = request.getParameter("matricula");
		}

		String modelo = "";
		if (request.getParameter("modelo") != null) {
			modelo = request.getParameter("modelo");
		}

		int marca = 0;
		if (request.getParameter("marca") != null) {
			marca = Integer.parseInt(request.getParameter("marca"));
		}

		String descripcion = "";
		if (request.getParameter("descripcion") != null) {
			descripcion = request.getParameter("descripcion");
		}

		int cilindrada = 0;
		if (request.getParameter("cilindrada") != null) {
			cilindrada = Integer.parseInt(request.getParameter("cilindrada"));
		}

		double precio = 0.0;
		if (request.getParameter("precio") != null) {
			precio = Double.parseDouble(request.getParameter("precio"));
		}

		String foto = "";
		if (request.getParameter("foto") != null) {
			foto = request.getParameter("foto");
		}

		// Obtener la parte del archivo desde la solicitud
		Part filePart = request.getPart("foto");

		// Obtener el nombre del archivo

		String fileName = filePart.getSubmittedFileName();

		System.out.println(fileName);
		//String uploadFolder = getServletContext().getRealPath("/imagenes/");
		ServletContext context = getServletContext();
		String uploadFolder = context.getRealPath("/imagenes/");
		
		

		// Verifica si la carpeta existe, si no, créala
		Path uploadPath = Paths.get(uploadFolder);
		
		
		if (!Files.exists(uploadPath)) {
		    Files.createDirectories(uploadPath);
		}

		
		Path filePath = Paths.get(uploadFolder, fileName);
		
		Files.copy(filePart.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);


		
	

	Moto moto = new Moto(0, matricula, modelo, precio, descripcion, cilindrada, marca, fileName);

	DB_Helper db = new DB_Helper();
	Connection con = db.conectar();

	// 4
	db.insertarMoto(con,moto);
	List<V_Motos> listaMotos = db.obtenerTodasMotos(con);
	List<Marca> listaMarcas = db.obtenerTodasMarcas(con);

	db.desconectar(con);

	request.setAttribute(ATR_LISTA_MOTOS,listaMotos);request.setAttribute(ATR_LISTA_MARCAS,listaMarcas);

	request.getRequestDispatcher(JSP_INDEX).forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
