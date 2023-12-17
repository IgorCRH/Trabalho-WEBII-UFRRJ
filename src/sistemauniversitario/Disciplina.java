package sistemauniversitario;

public class Disciplina {
    private int codigoDisciplina;
    private String nomeDisciplina;
    private String departamento;

    // Construtor
    public Disciplina(int codigoDisciplina, String nomeDisciplina, String departamento) {
        this.codigoDisciplina = codigoDisciplina;
        this.nomeDisciplina = nomeDisciplina;
        this.departamento = departamento;
    }

    // Métodos getters
    public int getCodigoDisciplina() {
        return codigoDisciplina;
    }

    public String getNomeDisciplina() {
        return nomeDisciplina;
    }

    public String getDepartamento() {
        return departamento;
    }

    // Métodos setters
    public void setCodigoDisciplina(int codigoDisciplina) {
        this.codigoDisciplina = codigoDisciplina;
    }

    public void setNomeDisciplina(String nomeDisciplina) {
        this.nomeDisciplina = nomeDisciplina;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    @Override
    public String toString() {
        return "Disciplina [codigoDisciplina=" + codigoDisciplina + ", nomeDisciplina=" + nomeDisciplina
                + ", departamento=" + departamento + "]";
    }
}

