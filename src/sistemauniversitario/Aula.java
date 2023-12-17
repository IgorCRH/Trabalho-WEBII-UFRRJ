package sistemauniversitario;

import java.sql.Date;

public class Aula {
    private int id;
    private Date data;
    private int codigoDisciplina;

    // Construtor
    public Aula(int id, Date data, int codigoDisciplina) {
        this.id = id;
        this.data = data;
        this.codigoDisciplina = codigoDisciplina;
    }

    // Métodos getters
    public int getId() {
        return id;
    }

    public Date getData() {
        return data;
    }

    public int getCodigoDisciplina() {
        return codigoDisciplina;
    }

    // Métodos setters
    public void setId(int id) {
        this.id = id;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public void setCodigoDisciplina(int codigoDisciplina) {
        this.codigoDisciplina = codigoDisciplina;
    }

    @Override
    public String toString() {
        return "Aula [id=" + id + ", data=" + data + ", codigoDisciplina=" + codigoDisciplina + "]";
    }
}

