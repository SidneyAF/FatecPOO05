package br.com.fatepg.bikeUp;

import java.util.ArrayList;

public class User {

    private String CPF;
    private String login;
    private String senha;
    private String nome;
    private String telefone;
    private String tipo;

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public User(String CPF, String nome, String telefone, String login, String senha, String tipo) {
        this.CPF = CPF;
        this.login = login;
        this.senha = senha;
        this.nome = nome;
        this.telefone = telefone;
        this.tipo = tipo;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getCPF() {
        return CPF;
    }

    public void setCPF(String CPF) {
        this.CPF = CPF;
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



    public static User getUser(String login, String senha)
            throws Exception {
        String SQL = "SELECT * FROM USUARIO " + "WHERE nm_login = ? AND nm_senha = ? ";
        Object parameters[] = {login, senha};
        ArrayList<Object[]> list = DataBaseConnector.getQuery(SQL, parameters);

        if (list.isEmpty()) {
            return null;
        } else {
            Object row[] = list.get(0);
            User u = new User((String) (row[0]),
                    (String) row[1],
                    (String) row[2],
                    (String) row[3],
                    (String) row[4],
                    (String) row[5]);
            return u;
        }
    }

    public static ArrayList<Object[]> getRanking() throws Exception {
        String SQL = "SELECT COUNT(*), B.NM_MODELO, SUM(A.VL_TOTAL) FROM ALUGUEL A, BIKE B WHERE A.FK_ID_BIKE = B.ID_BIKE GROUP BY B.NM_MODELO";
        ArrayList<Object[]> list = DataBaseConnector.getQuery(SQL, new Object[]{});
        if (list.isEmpty()) {
            return null;
        } else {
            Object row[] = list.get(0);
            Object b[] = {row[0],
                row[1],
                row[2]};
            list.add(b);
        }
        return list;
    }

}
