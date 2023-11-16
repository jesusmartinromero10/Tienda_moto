package com.ipartek.modelo;

import java.sql.Connection;

public interface DAO_Metodos {

	Connection conectar();
	void desconectar(Connection con);

}
