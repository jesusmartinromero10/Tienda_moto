package com.ipartek.modelo.dto;

public class Moto {

	
	private int id;
	private String matricula; 
	private String modelo; 
	private double precio; 
	private String descripcion; 
	private int cilindrada; 
	private int fk_marca ;
	private String foto;
	
	public Moto(int id, String matricula, String modelo, double precio, String descripcion, int cilindrada,
			int fk_marca,
			String foto) {
		super();
		this.id = id;
		this.matricula = matricula;
		this.modelo = modelo;
		this.precio = precio;
		this.descripcion = descripcion;
		this.cilindrada = cilindrada;
		this.fk_marca = fk_marca;
		this.foto=foto;
	}
	
	public Moto() {
		super();
		this.id = 0;
		this.matricula = "";
		this.modelo = "";
		this.precio = 0.0;
		this.descripcion = "";
		this.cilindrada = 0;
		this.fk_marca = 0;
		this.foto="";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMatricula() {
		return matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}

	public String getModelo() {
		return modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public int getCilindrada() {
		return cilindrada;
	}

	public void setCilindrada(int cilindrada) {
		this.cilindrada = cilindrada;
	}

	public int getFk_marca() {
		return fk_marca;
	}

	public void setFk_marca(int fk_marca) {
		this.fk_marca = fk_marca;
	}

	public String getFoto() {
		return foto;
	}
	
	public void setFoto(String foto) {
		this.foto = foto;
	}
	@Override
	public String toString() {
		return id + ";" + matricula + ";" + modelo + ";" + precio
				+ ";" + descripcion + ";" + cilindrada + ";" + fk_marca + ";" + foto;
	}


}
