package br.com.fatepg.bikeUp;

public class Aluguel {
    private int idBike;
    private String hrRetirado;
    private double vlTotal;
    private String hrDevolucao;
    private String tipoPagamento;
    private String loginUsuario;

    public Aluguel(int idBike, String hrRetirado, double vlTotal, String hrDevolucao, String tipoPagamento, String loginUsuario) {
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
    
    public static void addAluguel(int idBike, String hrRetirado, String loginUsuario) throws Exception{
        String SQL = "INSERT INTO ALUGUEL (FK_ID_BIKE, HR_RETIRADO, VL_TOTAL, HR_DEVOLUCAO, TP_PAGAMENTO, FK_NM_LOGIN)" +
        "VALUES (?,?,0,'00:00:00','',?)";
        Object parameters[] = {idBike, hrRetirado, loginUsuario};
        DataBaseConnector.execute(SQL, parameters);
    }
}
