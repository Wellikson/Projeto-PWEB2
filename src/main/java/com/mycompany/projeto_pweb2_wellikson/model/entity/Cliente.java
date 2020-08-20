/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projeto_pweb2_wellikson.model.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

/**
 *
 * @author wellikson
 */
@Entity
@Table(name = "tb_cliente")
public class Cliente implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_cliente;

    @NotNull(message = "{obrigatorio}")
    private String nome;

    @NotNull(message = "{obrigatorio}")
    private String telefone;

    @NotNull(message = "{obrigatorio}")
    private String senha;

    @OneToMany(mappedBy = "cliente",
            cascade = {CascadeType.REMOVE},
            fetch = FetchType.EAGER)
    List<Locacao> locacoes;

    public Integer getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(Integer id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public List<Locacao> getLocacoes() {
        return locacoes;
    }

    public void setLocacoes(List<Locacao> locacoes) {
        this.locacoes = locacoes;
    }

    public int nlocacoes() {
        return locacoes.size();
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String locacoes() {
        String todas = "";
        if (locacoes != null) {
            for (int i = 0; i < locacoes.size(); i++) {
                todas = todas + locacoes.get(i).dados() + "<br>";
            }
        } else {
            todas = "Sem Locaçoes no Momento!";
        }
        return todas;
    }

}
