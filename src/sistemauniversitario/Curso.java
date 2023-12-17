package sistemauniversitario;

public class Curso {
    private int codigoCurso;
    private String nomeCurso;
    private String departamento;
    private int codigoDisciplina;

    // Construtor
    public Curso(int codigoCurso, String nomeCurso, String departamento, int codigoDisciplina) {
        this.codigoCurso = codigoCurso;
        this.nomeCurso = nomeCurso;
        this.departamento = departamento;
        this.codigoDisciplina = codigoDisciplina;
    }

    // Métodos getters
    public int getCodigoCurso() {
        return codigoCurso;
    }

    public String getNomeCurso() {
        return nomeCurso;
    }

    public String getDepartamento() {
        return departamento;
    }

    public int getCodigoDisciplina() {
        return codigoDisciplina;
    }

    // Métodos setters
    public void setCodigoCurso(int codigoCurso) {
        this.codigoCurso = codigoCurso;
    }

    public void setNomeCurso(String nomeCurso) {
        this.nomeCurso = nomeCurso;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    public void setCodigoDisciplina(int codigoDisciplina) {
        this.codigoDisciplina = codigoDisciplina;
    }

    @Override
    public String toString() {
        return "Curso [codigoCurso=" + codigoCurso + ", nomeCurso=" + nomeCurso + ", departamento=" + departamento
                + ", codigoDisciplina=" + codigoDisciplina + "]";
    }
}

