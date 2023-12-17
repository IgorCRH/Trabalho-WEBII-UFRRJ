package sistemauniversitario;

public class Frequencia {
    private int idAula;
    private int codigoDisciplina;
    private String alunosPresentes;

    // Construtor
    public Frequencia(int idAula, int codigoDisciplina, String alunosPresentes) {
        this.idAula = idAula;
        this.codigoDisciplina = codigoDisciplina;
        this.alunosPresentes = alunosPresentes;
    }

    // Métodos getters
    public int getIdAula() {
        return idAula;
    }

    public int getCodigoDisciplina() {
        return codigoDisciplina;
    }

    public String getAlunosPresentes() {
        return alunosPresentes;
    }

    // Métodos setters
    public void setIdAula(int idAula) {
        this.idAula = idAula;
    }

    public void setCodigoDisciplina(int codigoDisciplina) {
        this.codigoDisciplina = codigoDisciplina;
    }

    public void setAlunosPresentes(String alunosPresentes) {
        this.alunosPresentes = alunosPresentes;
    }

    @Override
    public String toString() {
        return "Frequencia [idAula=" + idAula + ", codigoDisciplina=" + codigoDisciplina + ", alunosPresentes="
                + alunosPresentes + "]";
    }
}

