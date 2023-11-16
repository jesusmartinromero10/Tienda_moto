package com.ipartek.modelo;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ipartek.modelo.dto.Marca;
import com.ipartek.modelo.dto.Moto;
import com.ipartek.modelo.dto.V_Motos;

public class DB_Helper implements DAO_Constantes, DAO_Metodos {

	@Override
	public Connection conectar() {
		Connection con = null;

		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(CONEXION, USUARIO, PASS);
			System.out.println("BASE DE DATOS CONECTADA");
		} catch (ClassNotFoundException e) {
			System.out.println("NO SE ENCONTRO EL DRIVER");
		} catch (SQLException e) {
			System.out.println("ERROR AL CONECTAR A LA BD");
		}

		return con;
	}

	@Override
	public void desconectar(Connection con) {
		try {
			con.close();
			System.out.println("BASE DE DATOS DESCONECTADA");
		} catch (SQLException e) {
			System.out.println("NO SE PUDO DESCONECTAR");
		}
	}

	public void insertarMoto(Connection con, Moto moto) {
		System.out.println(moto);
		try {
			CallableStatement cStmt = con.prepareCall(SP_INSERTAR_MOTO);
			cStmt.setString(1, moto.getMatricula());
			cStmt.setString(2, moto.getModelo());
			cStmt.setDouble(3, moto.getPrecio());
			cStmt.setString(4, moto.getDescripcion());
			cStmt.setInt(5, moto.getCilindrada());
			cStmt.setInt(6, moto.getFk_marca());
			cStmt.setString(7,moto.getFoto());

			cStmt.execute();
			System.out.println("SE INSERTO LA MOTO");
		} catch (SQLException e) {
			System.out.println("NO SE INSERTO LA MOTO");
			e.printStackTrace();
		}

	}

	public void borrarMoto(Connection con, int id) {
		try {
			CallableStatement cStmt = con.prepareCall(SP_BORRAR_MOTO);
			cStmt.setInt(1, id);

			cStmt.execute();
			System.out.println("SE BORRO LA MOTO");
		} catch (SQLException e) {
			System.out.println("NO SE BORRO LA MOTO");
			e.printStackTrace();
		}
	}

	public List<V_Motos> obtenerTodasMotos(Connection con) {

		List<V_Motos> lista = new ArrayList<V_Motos>();

		try {
			// call sp_obtener_todas_motos();
			CallableStatement cStmt = con.prepareCall(SP_OBTENER_TODAS_MOTOS);

			cStmt.execute();

			ResultSet rs = cStmt.getResultSet();

			while (rs.next()) {
				V_Motos moto = new V_Motos();

				moto.setId(rs.getInt(V_MOTO_ID));
				moto.setModelo(rs.getString(V_MOTO_MODELO));
				moto.setCilindrada(rs.getInt(V_MOTO_CILINDRADA));
				moto.setDescripcion(rs.getString(V_MOTO_DESCRIPCION));
				moto.setFk_marca(rs.getInt(V_MOTO_FK_MARCA));
				moto.setMarca(rs.getString(V_MOTO_MARCA));
				moto.setMatricula(rs.getString(V_MOTO_MATRICULA));
				moto.setPrecio(rs.getDouble(V_MOTO_PRECIO));
				moto.setFoto(rs.getString(V_MOTO_FOTO));
				

				lista.add(moto);
			}
			System.out.println("LISTA DE TODAS LAS MOTOS OBTENIDA");
		} catch (SQLException e) {
			System.out.println("NO SE PUDO OBTENER LA LISTA DE TODAS LAS MOTOS");
			e.printStackTrace();
			return new ArrayList<V_Motos>();
		}
		return lista;

	}

	public List<Marca> obtenerTodasMarcas(Connection con) {
		List<Marca> lista = new ArrayList<Marca>();

		try {
			// call sp_obtener_todas_motos();
			CallableStatement cStmt = con.prepareCall(SP_OBTENER_TODAS_MARCAS);

			cStmt.execute();

			ResultSet rs = cStmt.getResultSet();

			while (rs.next()) {
				Marca marca = new Marca();

				marca.setId(rs.getInt(MARCAS_ID));
				marca.setMarca(rs.getString(MARCAS_MARCA));

				lista.add(marca);
			}
			System.out.println("LISTA DE TODAS LAS MARCAS OBTENIDA");
		} catch (SQLException e) {
			System.out.println("NO SE PUDO OBTENER LA LISTA DE TODAS LAS MARCAS");
			e.printStackTrace();
			return new ArrayList<Marca>();
		}
		return lista;
	}

	public List<V_Motos> obtenerMotosFiltro(Connection con, String texto, String matricula, int cilindrada) {
		List<V_Motos> lista = new ArrayList<V_Motos>();

		try {
			// call sp_obtener_todas_motos();
			CallableStatement cStmt = con.prepareCall(SP_OBTENER_MOTOS_FILTRADAS);
			cStmt.setString(1, texto);
			cStmt.setString(2, matricula);
			cStmt.setInt(3, cilindrada);
			cStmt.execute();

			ResultSet rs = cStmt.getResultSet();

			while (rs.next()) {
				V_Motos moto = new V_Motos();

				moto.setId(rs.getInt(V_MOTO_ID));
				moto.setModelo(rs.getString(V_MOTO_MODELO));
				moto.setCilindrada(rs.getInt(V_MOTO_CILINDRADA));
				moto.setDescripcion(rs.getString(V_MOTO_DESCRIPCION));
				moto.setFk_marca(rs.getInt(V_MOTO_FK_MARCA));
				moto.setMarca(rs.getString(V_MOTO_MARCA));
				moto.setMatricula(rs.getString(V_MOTO_MATRICULA));
				moto.setPrecio(rs.getDouble(V_MOTO_PRECIO));
				moto.setFoto(rs.getString(V_MOTO_FOTO));

				lista.add(moto);
			}
			System.out.println("LISTA DE TODAS LAS MOTOS FILTRADAS OBTENIDA");
		} catch (SQLException e) {
			System.out.println("NO SE PUDO OBTENER LA LISTA DE LAS MOTOS FILTRADA");
			e.printStackTrace();
			return new ArrayList<V_Motos>();
		}
		return lista;

	}

	public V_Motos obtenerMotoPorId(Connection con, int id) {
		V_Motos moto = new V_Motos();
		try {
			// call sp_obtener_todas_motos();
			CallableStatement cStmt = con.prepareCall(SP_OBTENER_MOTO_POR_ID);
			cStmt.setInt(1, id);

			cStmt.execute();

			ResultSet rs = cStmt.getResultSet();

			while (rs.next()) {
				moto.setId(rs.getInt(V_MOTO_ID));
				moto.setModelo(rs.getString(V_MOTO_MODELO));
				moto.setCilindrada(rs.getInt(V_MOTO_CILINDRADA));
				moto.setDescripcion(rs.getString(V_MOTO_DESCRIPCION));
				moto.setFk_marca(rs.getInt(V_MOTO_FK_MARCA));
				moto.setMarca(rs.getString(V_MOTO_MARCA));
				moto.setMatricula(rs.getString(V_MOTO_MATRICULA));
				moto.setPrecio(rs.getDouble(V_MOTO_PRECIO));
			}
			System.out.println("MOTO POR ID OBTENIDA");
		} catch (SQLException e) {
			System.out.println("NO SE PUDO OBTENER LA MOTO POR ID");
			e.printStackTrace();
			return new V_Motos();
		}
		return moto;
	}

	public void modificarMoto(Connection con, Moto moto) {
		try {
			//call bd_motos.sp_modificar_moto(id, 'mat', 'model', precio, 'desc', cil, fk_mar);
			CallableStatement cStmt = con.prepareCall(SP_MODIFICAR_MOTO);
			cStmt.setInt(1, moto.getId());
			cStmt.setString(2, moto.getMatricula());
			cStmt.setString(3, moto.getModelo());
			cStmt.setDouble(4, moto.getPrecio());
			cStmt.setString(5, moto.getDescripcion());
			cStmt.setInt(6, moto.getCilindrada());
			cStmt.setInt(7, moto.getFk_marca());
			cStmt.setString(8, moto.getFoto());

			cStmt.execute();
			System.out.println("SE MODIFICO LA MOTO");
		} catch (SQLException e) {
			System.out.println("NO SE MODIFICO LA MOTO");
			e.printStackTrace();
		}
		
	}

	public void vaciarBD(Connection con) {
		try {
			CallableStatement cStmt = con.prepareCall(SP_VACIAR_BD);

			cStmt.execute();
			System.out.println("SE VACIO LA BD");
		} catch (SQLException e) {
			System.out.println("NO SE VACIO LA BD");
			e.printStackTrace();
		}
		
	}

	public void restaurarMarca(Connection con, Marca marca) {
		try {
			CallableStatement cStmt = con.prepareCall(SP_RESTAURAR_MARCA);
			cStmt.setInt(1, marca.getId());
			cStmt.setString(2, marca.getMarca());
			

			cStmt.execute();
			System.out.println("SE RESTAURO LA MARCA");
		} catch (SQLException e) {
			System.out.println("NO SE RESTAURO LA MARCA");
			e.printStackTrace();
		}
		
	}

	public void restaurarMoto(Connection con, Moto moto) {
		try {
			//call bd_motos.sp_insertar_moto_RESTAURACION(ident, 'matr', 'mod', pre, 'desc', cili, fk_marca);
			CallableStatement cStmt = con.prepareCall(SP_RESTAURAR_MOTO);
				cStmt.setInt(1, moto.getId());
				cStmt.setString(2, moto.getMatricula());
				cStmt.setString(3, moto.getModelo());
				cStmt.setDouble(4, moto.getPrecio());
				cStmt.setString(5, moto.getDescripcion());
				cStmt.setInt(6, moto.getCilindrada());
				cStmt.setInt(7, moto.getFk_marca());
				cStmt.setString(8, moto.getFoto());

			cStmt.execute();
			System.out.println("SE RESTAURO LA MOTO");
		} catch (SQLException e) {
			System.out.println("NO SE RESTAURO LA MOTO");
			e.printStackTrace();
		}
	}

}
