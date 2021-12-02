/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.util.List;

/**
 *
 * @author fido
 */
public class DemoConsultar {

    public static void main(String[] args) {
        Autor a = new Autor();
        List<Autor> lista = a.consultarAutores();
        for(Autor ax: lista){
            System.out.println(ax);
        }
    }
}
