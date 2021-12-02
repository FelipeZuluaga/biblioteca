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
        "guardar",
        "eliminar",
        "actualizar",
        "listar",
        "consultarIndividual"
    });

    String proceso = "" + request.getParameter("proceso");

    // Validación de parámetros utilizados en todos los procesos.
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
        // ------------------------------------------------------------------------------------- //
        // -----------------------------------INICIO PROCESOS----------------------------------- //
        // ------------------------------------------------------------------------------------- //
        if (proceso.equals("guardar")) {

            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            // creación de objeto y llamado a método guardar  
            String isbn = request.getParameter("isbn");
            String nombre = request.getParameter("nombre");
            int numeroDePaginas = Integer.parseInt(request.getParameter("numeroDePaginas"));
            int annio = Integer.parseInt(request.getParameter("annio"));
            String codigoAutor = request.getParameter("codigoAutor");
            int idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
            Libro l = new Libro();
            l.setIsbn(isbn);
            l.setNombre(nombre);
            l.setNumeroDePaginas(numeroDePaginas);
            l.setAnnio(annio);
            l.setCodigoAutor(codigoAutor);
            l.setIdCategoria(idCategoria);

            if (l.guardarLibro()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminar")) {
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado a método eliminar
            String isbn = request.getParameter("isbn");
            Libro l = new Libro();
            l.setIsbn(isbn);
            if (l.eliminarLibro()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("listar")) {
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado al metodo listar
            try {
                List<Libro> lista = new Libro().consultarLibros();
                respuesta += "\"" + proceso + "\": true,\"Libros\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Libros\":[]";
                Logger.getLogger(Libro.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("consultarIndividual")) {
            //Solicitud de parámetros enviados desde el frontned
            //, uso de request.getParameter("nombre parametro")
            //creación de objeto y llamado al metodo consultarIndividual
            try {
                String isbn = request.getParameter("isbn");
                Libro obj = new Libro(isbn).consultarLibro();
                respuesta += "\"" + proceso + "\": true,\"Libro\":" + new Gson().toJson(obj);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\" Libro\":null";
                Logger.getLogger(Libro.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("actualizar")) {
            //creación de objeto y llamado al metodo actualizar
            String isbn = request.getParameter("isbn");
            String nombre = request.getParameter("nombre");
            int numeroDePaginas = Integer.parseInt(request.getParameter("numeroDePaginas"));
            int annio = Integer.parseInt(request.getParameter("annio"));
            String codigoAutor = request.getParameter("codigoAutor");
            int idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
            Libro l = new Libro();
            l.setIsbn(isbn);
            l.setNombre(nombre);
            l.setNumeroDePaginas(numeroDePaginas);
            l.setAnnio(annio);
            l.setCodigoAutor(codigoAutor);
            l.setIdCategoria(idCategoria);
            if (l.actualizarLibro()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        }

        // ------------------------------------------------------------------------------------- //
        // -----------------------------------FIN PROCESOS-------------------------------------- //
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
