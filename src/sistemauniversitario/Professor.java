package sistemauniversitario;

public class Professor {
    private int codigoRegistro;
    private String nome;
    private String cpf;
    private String email;
    private double salario;
    private String departamento;
    private String login;

    // Construtor
    public Professor(int codigoRegistro, String nome, String cpf, String email, double salario, String departamento, String login) {
        this.codigoRegistro = codigoRegistro;
        this.nome = nome;
        this.cpf = cpf;
        this.email = email;
        this.salario = salario;
        this.departamento = departamento;
        this.login = login;
    }

    // Métodos getters
    public int getCodigoRegistro() {
        return codigoRegistro;
    }

    public String getNome() {
        return nome;
    }

    public String getCpf() {
        return cpf;
    }

    public String getEmail() {
        return email;
    }

    public double getSalario() {
        return salario;
    }

    public String getDepartamento() {
        return departamento;
    }
    
    public String getLogin () {
    	return login;
    }

    // Métodos setters
    public void setCodigoRegistro(int codigoRegistro) {
        this.codigoRegistro = codigoRegistro;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }
    
    public void setLogin(String login) {
    	this.login = login;
    }

    @Override
    public String toString() {
        return "Professor [codigoRegistro=" + codigoRegistro + ", nome=" + nome + ", cpf=" + cpf + ", email=" + email
                + ", salario=" + salario + ", departamento=" + departamento + "]";
    }
}

