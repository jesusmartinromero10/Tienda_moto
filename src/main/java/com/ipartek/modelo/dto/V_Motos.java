package com.ipartek.modelo.dto;

public class V_Motos extends Moto{

	private String marca;

	public V_Motos(int id, String matricula, String modelo, double precio, String descripcion, int cilindrada,
			int fk_marca, String marca, String foto) {
		super(id, matricula, modelo, precio, descripcion, cilindrada, fk_marca, foto);
		this.marca = marca;
	} 
	
	public V_Motos() {
		super();
		this.marca = "";
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	@Override
	public String toString() {
		return super.toString();
	} 
	
	
	
	
}
