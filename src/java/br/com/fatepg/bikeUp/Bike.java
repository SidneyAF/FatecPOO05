package br.com.fatepg.bikeUp;

import java.util.ArrayList;

public class Bike {

    private int id;
    private double valor;
    private String modelo;
    private String status;

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    
    public Bike(int id, double valor, String modelo, String status) {
        this.id = id;
        this.valor = valor;
        this.modelo = modelo;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


    public static ArrayList<Bike> getBikes() throws Exception {
        String SQL = "SELECT * from bike";
        ArrayList<Bike> bikes = new ArrayList<>();
        ArrayList<Object[]> list = DataBaseConnector.getQuery(SQL, new Object[]{});
        for(int i=0; i<list.size();i++){
            Object row[] = list.get(i);
            Bike b = new Bike(
                (int)row[0],
                (double)row[1],
                (String)row[2],
                (String)row[3]);
            bikes.add(b);
        }
        return bikes;
    }
    
    public static void addBike(int idBike, double precoHora, String modelo) throws Exception{
        String SQL = "INSERT INTO BIKE (ID_BIKE,VL_PRECOHORA, NM_MODELO, DSC_STATUS)" +
        "VALUES (?,?,?,'Disponível')";
        Object parameters[] = {idBike,precoHora, modelo};
        DataBaseConnector.execute(SQL, parameters);
    }
    
    public static void removeBike(int id) throws Exception{
    String SQL = "Delete from Bike where id_bike = ?";
        Object parameters[] = {id};
        DataBaseConnector.execute(SQL, parameters);
    }
    
    public static Bike getDadosBike(int id) throws Exception{
        String SQL = "SELECT * from bike where id_bike = ?";
        Object parameters [] = {id};
        ArrayList<Object[]> list = DataBaseConnector.getQuery(SQL, parameters);
        if (list.isEmpty()) {
            return null;
        } else {
            Object row[] = list.get(0);
            Bike b = new Bike((int) (row[0]),
                    (double) row[1],
                    (String) row[2],
                    (String) row[3]);
            return b;
        }
    }
    
    public static void editBike(int id, double precoHora, String modelo) throws Exception{
        String SQL = "UPDATE  BIKE SET VL_PRECOHORA = ?, NM_MODELO = ? " +
        "WHERE ID_BIKE = ?";
        Object parameters[] = {precoHora, modelo,id};
        DataBaseConnector.execute(SQL, parameters);
    }
    
    public static void reservaBike(int id, String status) throws Exception{
        String SQL = "UPDATE  BIKE SET DSC_STATUS = ? " +
        "WHERE ID_BIKE = ?";
        Object parameters[] = {status,id};
        DataBaseConnector.execute(SQL, parameters);
    }
    
    
}
