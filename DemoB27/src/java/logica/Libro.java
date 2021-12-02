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
public class Libro {

    private String isbn;
    private String nombre;
    private int numeroDePaginas;
    private int annio;
    private String codigoAutor;
    private int idCategoria;
    private Autor autor;
    private Categoria categoria;

    public Libro() {
    }

    public Libro(String isbn) {
        this.isbn = isbn;
    }

    public Libro(String isbn, String nombre, int numeroDePaginas, int annio, String codigoAutor, int idCategoria) {
        this.isbn = isbn;
        this.nombre = nombre;
        this.numeroDePaginas = numeroDePaginas;
        this.annio = annio;
        this.codigoAutor = codigoAutor;
        this.idCategoria = idCategoria;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getNumeroDePaginas() {
        return numeroDePaginas;
    }

    public void setNumeroDePaginas(int numeroDePaginas) {
        this.numeroDePaginas = numeroDePaginas;
    }

    public int getAnnio() {
        return annio;
    }

    public void setAnnio(int annio) {
        this.annio = annio;
    }

    public String getCodigoAutor() {
        return codigoAutor;
    }

    public void setCodigoAutor(String codigoAutor) {
        this.codigoAutor = codigoAutor;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public Autor getAutor() {
        return autor;
    }

    public void setAutor(Autor autor) {
        this.autor = autor;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    @Override
    public String toString() {
        return "Libro{" + "isbn=" + isbn + ", nombre=" + nombre + ", numeroDePaginas=" + numeroDePaginas + ", annio=" + annio + ", codigoAutor=" + codigoAutor + ", idCategoria=" + idCategoria + '}';
    }

    public List<Libro> consultarLibros() {
        List<Libro> listaLibros = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM libros;";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Libro lib;
            while (rs.next()) {
                lib = new Libro();
                lib.setIsbn(rs.getString("isbn"));
                lib.setNombre(rs.getString("nombre"));
                lib.setNumeroDePaginas(rs.getInt("numeroDePaginas"));
                lib.setAnnio(rs.getInt("annio"));
                lib.setCodigoAutor(rs.getString("codigoAutor"));
                lib.setIdCategoria(rs.getInt("idCategoria"));
                Autor a = new Autor(lib.getCodigoAutor()).consultarAutor();
                lib.setAutor(a);
                Categoria c = new Categoria(lib.getIdCategoria()).consultarCategoria();
                lib.setCategoria(c);
                listaLibros.add(lib);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return listaLibros;
    }

    public List<Libro> consultarLibrosPorIsbn(String isbn) {
        List<Libro> listaLibros = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "select * from libros where isbn like '%" + isbn + "%';";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Libro lib;
            while (rs.next()) {
                lib = new Libro();
                lib.setIsbn(rs.getString("isbn"));
                lib.setNombre(rs.getString("nombre"));
                lib.setNumeroDePaginas(rs.getInt("numeroDePaginas"));
                lib.setAnnio(rs.getInt("annio"));
                lib.setCodigoAutor(rs.getString("codigoAutor"));
                lib.setIdCategoria(rs.getInt("idCategoria"));
                Autor a = new Autor(lib.getCodigoAutor()).consultarAutor();
                lib.setAutor(a);
                Categoria c = new Categoria(lib.getIdCategoria()).consultarCategoria();
                lib.setCategoria(c);
                listaLibros.add(lib);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return listaLibros;
    }

    public List<Libro> consultarLibrosPorNombre(String nombre) {
        List<Libro> listaLibros = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "select * from libros where nombre like '%" + nombre + "%';";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Libro lib;
            while (rs.next()) {
                lib = new Libro();
                lib.setIsbn(rs.getString("isbn"));
                lib.setNombre(rs.getString("nombre"));
                lib.setNumeroDePaginas(rs.getInt("numeroDePaginas"));
                lib.setAnnio(rs.getInt("annio"));
                lib.setCodigoAutor(rs.getString("codigoAutor"));
                lib.setIdCategoria(rs.getInt("idCategoria"));
                Autor a = new Autor(lib.getCodigoAutor()).consultarAutor();
                lib.setAutor(a);
                Categoria c = new Categoria(lib.getIdCategoria()).consultarCategoria();
                lib.setCategoria(c);
                listaLibros.add(lib);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return listaLibros;
    }

    public List<Libro> consultarLibrosPorAnnio(String annio) {
        List<Libro> listaLibros = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "select * from libros where annio ="+annio+";";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Libro lib;
            while (rs.next()) {
                lib = new Libro();
                lib.setIsbn(rs.getString("isbn"));
                lib.setNombre(rs.getString("nombre"));
                lib.setNumeroDePaginas(rs.getInt("numeroDePaginas"));
                lib.setAnnio(rs.getInt("annio"));
                lib.setCodigoAutor(rs.getString("codigoAutor"));
                lib.setIdCategoria(rs.getInt("idCategoria"));
                Autor a = new Autor(lib.getCodigoAutor()).consultarAutor();
                lib.setAutor(a);
                Categoria c = new Categoria(lib.getIdCategoria()).consultarCategoria();
                lib.setCategoria(c);
                listaLibros.add(lib);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return listaLibros;
    }
    
    public List<Libro> consultarLibrosPorAutor(String autor) {
        List<Libro> listaLibros = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "select * from libros where codigoAutor in(select codigo from autores where nombre like '%"+autor+"%');";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Libro lib;
            while (rs.next()) {
                lib = new Libro();
                lib.setIsbn(rs.getString("isbn"));
                lib.setNombre(rs.getString("nombre"));
                lib.setNumeroDePaginas(rs.getInt("numeroDePaginas"));
                lib.setAnnio(rs.getInt("annio"));
                lib.setCodigoAutor(rs.getString("codigoAutor"));
                lib.setIdCategoria(rs.getInt("idCategoria"));
                Autor a = new Autor(lib.getCodigoAutor()).consultarAutor();
                lib.setAutor(a);
                Categoria c = new Categoria(lib.getIdCategoria()).consultarCategoria();
                lib.setCategoria(c);
                listaLibros.add(lib);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return listaLibros;
    }
     public List<Libro> consultarLibrosPorCategoria(String categoria) {
        List<Libro> listaLibros = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "select * from libros where idCategoria in(select id from categorias  where nombre like '%"+categoria+"%');";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Libro lib;
            while (rs.next()) {
                lib = new Libro();
                lib.setIsbn(rs.getString("isbn"));
                lib.setNombre(rs.getString("nombre"));
                lib.setNumeroDePaginas(rs.getInt("numeroDePaginas"));
                lib.setAnnio(rs.getInt("annio"));
                lib.setCodigoAutor(rs.getString("codigoAutor"));
                lib.setIdCategoria(rs.getInt("idCategoria"));
                Autor a = new Autor(lib.getCodigoAutor()).consultarAutor();
                lib.setAutor(a);
                Categoria c = new Categoria(lib.getIdCategoria()).consultarCategoria();
                lib.setCategoria(c);
                listaLibros.add(lib);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return listaLibros;
    }

    public Libro consultarLibro() {
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM libros WHERE isbn='" + this.isbn + "';";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            if (rs.next()) {
                this.nombre = rs.getString("nombre");
                this.numeroDePaginas = rs.getInt("numeroDePaginas");
                this.annio = rs.getInt("annio");
                this.codigoAutor = rs.getString("codigoAutor");
                this.idCategoria = rs.getInt("idCategoria");
                this.autor = new Autor(this.codigoAutor).consultarAutor();
                this.categoria = new Categoria(this.idCategoria).consultarCategoria();
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

    public boolean guardarLibro() {
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO libros\n"
                + "(isbn, nombre, numeroDePaginas, annio, codigoAutor, idCategoria)\n"
                + "VALUES('" + this.isbn + "', '" + this.nombre + "', " + this.numeroDePaginas
                + ", " + this.annio + ", '" + this.codigoAutor + "', " + this.idCategoria + ");";
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

    public boolean actualizarLibro() {
        ConexionBD conexion = new ConexionBD();
        String sql = "UPDATE libros\n"
                + "SET nombre='" + this.nombre + "', numeroDePaginas=" + this.numeroDePaginas
                + ", annio=" + this.annio + ", codigoAutor='" + this.codigoAutor + "', idCategoria=" + this.idCategoria + "\n"
                + "WHERE isbn='" + this.isbn + "';";
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

    public boolean eliminarLibro() {
        ConexionBD conexion = new ConexionBD();
        String sql = "DELETE FROM libros\n"
                + "WHERE isbn='" + this.isbn + "';";
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
