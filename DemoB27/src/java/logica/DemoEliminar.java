/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

/**
 *
 * @author fido
 */
public class DemoEliminar {

    public static void main(String[] args) {
        Autor a = new Autor();
        a.setCodigo("654321");
        if (a.eliminarAutor()) {
            System.out.println("Ejecutó");
        } else {
            System.out.println("No Ejecutó");
        }
    }
}
