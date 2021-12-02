<%-- 
    Document   : Archivo de peticiones
    Created on : dd/mm/yyyy, hh:mm: AM/PM
    Author     : nombre autor
--%>

<%@page import="logica.Libro"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"%>

<%    // Iniciando respuesta JSON.
    String respuesta = "{";
    //Lista de procesos o tareas a realizar 
    List<String> tareas = Arrays.asList(new String[]{
        "consultarIndividualIsbn",
        "consultarIndividualNombre",
        "consultarIndividualAnnio",
        "consultarIndividualAutor",
        "consultarIndividualCategoria"
    });
    String proceso = "" + request.getParameter("proceso");
    // Validación de parámetros utilizados en todos los procesos.
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
        // ------------------------------------------------------------------------------------- //
        // -----------------------------------INICIO PROCESOS----------------------------------- //
        // ------------------------------------------------------------------------------------- //
        if (proceso.equals("consultarIndividualIsbn")) {
            try {
                String isbn = request.getParameter("isbn");
                List<Libro> lista = new Libro().consultarLibrosPorIsbn(isbn);
                respuesta += "\"" + proceso + "\": true,\"Libros\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Libros\":[]";
                Logger.getLogger(Libro.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("consultarIndividualNombre")) {
            try {
                String nombre = request.getParameter("nombre");
                List<Libro> lista = new Libro().consultarLibrosPorNombre(nombre);
                respuesta += "\"" + proceso + "\": true,\"Libros\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Libros\":[]";
                Logger.getLogger(Libro.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("consultarIndividualAnnio")) {
            try {
                String annio = request.getParameter("annio");
                List<Libro> lista = new Libro().consultarLibrosPorAnnio(annio);
                respuesta += "\"" + proceso + "\": true,\"Libros\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Libros\":[]";
                Logger.getLogger(Libro.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("consultarIndividualAutor")) {
            try {
                String autor = request.getParameter("autor");
                List<Libro> lista = new Libro().consultarLibrosPorAutor(autor);
                respuesta += "\"" + proceso + "\": true,\"Libros\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Libros\":[]";
                Logger.getLogger(Libro.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("consultarIndividualCategoria")) {
            try {
                String categoria = request.getParameter("categoria");
                List<Libro> lista = new Libro().consultarLibrosPorCategoria(categoria);
                respuesta += "\"" + proceso + "\": true,\"Libros\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Libros\":[]";
                Logger.getLogger(Libro.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        // -----------------------------------FIN PROCESOS-------------------------------------- //
        // ------------------------------------------------------------------------------------- //
        // ------------------------------------------------------------------------------------- //
        // Proceso desconocido.
    } else {
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";
    }
    // Responder como objeto JSON codificación ISO 8859-1.
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>

