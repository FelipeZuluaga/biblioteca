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
public class DemoGuardar {

    public static void main(String[] args) {
        Autor a = new Autor();
        a.setCodigo("654321");
        a.setNombre("Mario Mendoza");
        a.setNacionalidad("Colombiano");
        if (a.guardarAutor()) {
            System.out.println("Ejecutó");
        } else {
            System.out.println("No Ejecutó");
        }
    }
}
