package br.com.fatepg.bikeUp;

import java.util.ArrayList;

public class Aluguel {

    private int idBike;
    private double vlTotal;
    private String tipoPagamento;
    private String loginUsuario;
      private String hrRetirado;
      private String hrDevolucao;

    public Aluguel(int idBike,double vlTotal,String tipoPagamento, String loginUsuario, String hrRetirado,String hrDevolucao) {
        this.idBike = idBike;
        this.hrRetirado = hrRetirado;
        this.vlTotal = vlTotal;
        this.hrDevolucao = hrDevolucao;
        this.tipoPagamento = tipoPagamento;
        this.loginUsuario = loginUsuario;
    }

    public int getIdBike() {
        return idBike;
    }

    public void setIdBike(int idBike) {
        this.idBike = idBike;
    }

    public String getHrRetirado() {
        return hrRetirado;
    }

    public void setHrRetirado(String hrRetirado) {
        this.hrRetirado = hrRetirado;
    }

    public double getVlTotal() {
        return vlTotal;
    }

    public void setVlTotal(double vlTotal) {
        this.vlTotal = vlTotal;
    }

    public String getHrDevolucao() {
        return hrDevolucao;
    }

    public void setHrDevolucao(String hrDevolucao) {
        this.hrDevolucao = hrDevolucao;
    }

    public String getTipoPagamento() {
        return tipoPagamento;
    }

    public void setTipoPagamento(String tipoPagamento) {
        this.tipoPagamento = tipoPagamento;
    }

    public String getLoginUsuario() {
        return loginUsuario;
    }

    public void setLoginUsuario(String loginUsuario) {
        this.loginUsuario = loginUsuario;
    }

    public static void addAluguel(int idBike, String hrRetirado, String loginUsuario) throws Exception {
        String SQL = "INSERT INTO ALUGUEL (FK_ID_BIKE, HR_RETIRADO, VL_TOTAL, HR_DEVOLUCAO, TP_PAGAMENTO, FK_NM_LOGIN)"
                + "VALUES (?,?,0,'00:00:00','',?)";
        Object parameters[] = {idBike, hrRetirado, loginUsuario};
        DataBaseConnector.execute(SQL, parameters);
    }

    public static void editAluguel(int idBike, String hrDevolucao, double valorTotal, String tipoPagamento, String loginUsuario) throws Exception {
        String SQL = "UPDATE ALUGUEL SET HR_DEVOLUCAO = ?, VL_TOTAL = ?, TP_PAGAMENTO = ? WHERE FK_ID_BIKE = ? AND FK_NM_LOGIN = ?";
        Object parameters[] = {hrDevolucao, valorTotal, tipoPagamento, idBike, loginUsuario};
        DataBaseConnector.execute(SQL, parameters);
    }

    public static ArrayList<Aluguel> getAluguelUsuario(String login) throws Exception {
        String SQL = "SELECT a.fk_id_bike,a.hr_retirado,a.vl_total,a.hr_devolucao, a.tp_pagamento, a.fk_nm_login from aluguel a, usuario u where a.fk_nm_login = u.nm_login and u.nm_login = ?";
        Object parameters[] = {login};
        ArrayList<Aluguel> aluguel = new ArrayList<>();
        ArrayList<Object[]> list = DataBaseConnector.getQuery(SQL, parameters);
        for (int i = 0; i < list.size(); i++) {
            Object row[] = list.get(i);
            Aluguel a = new Aluguel(
                    (int) row[0],
                    (double) row[1],
                    (String) row[2],
                    (String) row[3],
                    (String) row[4],
                    (String) row[5]);
            aluguel.add(a);
        }
        return aluguel;
    }

    public static ArrayList<Aluguel> getAluguel() throws Exception {
        String SQL = "SELECT * "
                + "from aluguel";
        ArrayList<Aluguel> aluguel = new ArrayList<>();
        ArrayList<Object[]> list = DataBaseConnector.getQuery(SQL, new Object[]{});
        for (int i = 0; i < list.size(); i++) {
            Object row[] = list.get(i);
            Aluguel a = new Aluguel(
                    (int) row[0],
                    (double) row[1],
                    (String) row[2],
                    (String) row[3],
                    (String) row[4],
                    (String) row[5]
            );
            aluguel.add(a);
        };
        return aluguel;
    }

}


