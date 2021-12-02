/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import persistencia.ConexionBD;

/**
 *
 * @author fido
 */
public class Autor {

    private String codigo;
    private String nombre;
    private String nacionalidad;

    public Autor() {
    }

    public Autor(String codigo) {
        this.codigo = codigo;
    }
 
    
    
    public Autor(String codigo, String nombre, String nacionalidad) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.nacionalidad = nacionalidad;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    @Override
    public String toString() {
        return "Autor{" + "codigo=" + codigo + ", nombre=" + nombre + ", nacionalidad=" + nacionalidad + '}';
    }

    public List<Autor> consultarAutores() {
        List<Autor> listaAutores = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM autores;";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Autor aut;
            while (rs.next()) {
                aut = new Autor();
                aut.setCodigo(rs.getString("codigo"));
                aut.setNombre(rs.getString("nombre"));
                aut.setNacionalidad(rs.getString("nacionalidad"));
                listaAutores.add(aut);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return listaAutores;
    }

    public Autor consultarAutor() {
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM autores WHERE codigo='" + this.codigo + "';";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            if (rs.next()) {
                this.nombre = rs.getString("nombre");
                this.nacionalidad = rs.getString("nacionalidad");
            } else {
                return null;
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return this;
    }

    public boolean guardarAutor() {
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO autores\n"
                + "(codigo, nombre, nacionalidad)\n"
                + "VALUES('" + this.codigo + "', '" + this.nombre + "', '" + this.nacionalidad + "');";
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.insertarBD(sql)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        } else {
            conexion.cerrarConexion();
            return false;
        }
    }

    public boolean actualizarAutor() {
        ConexionBD conexion = new ConexionBD();
        String sql = "UPDATE autores\n"
                + "SET nombre='" + this.nombre + "', nacionalidad='" + this.nacionalidad + "'\n"
                + "WHERE codigo='" + this.codigo + "';";
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(sql)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        } else {
            conexion.cerrarConexion();
            return false;
        }
    }

    public boolean eliminarAutor() {
        ConexionBD conexion = new ConexionBD();
        String sql = "DELETE FROM autores WHERE codigo='" + this.codigo + "';";
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(sql)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        } else {
            conexion.cerrarConexion();
            return false;
        }
    }

}
