/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projeto_pweb2_wellikson.model.entity;

import java.io.Serializable;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

/**
 *
 * @author wellikson
 */
@SessionScoped
@Named("clientelogado")
public class ClienteLogado implements Serializable {

    private Cliente cliente;

    public void login(Cliente cliente) {
        this.cliente = cliente;
    }

    public String getNome() {
        return cliente.getNome();
    }

    public Integer getId(){
        return cliente.getId_cliente();
    }
    public boolean isLogado() {
        return cliente != null;
    }
    
}
