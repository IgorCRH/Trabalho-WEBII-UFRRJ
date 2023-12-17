package sistemauniversitario;

public class Aluno {

    private int matricula;
    private String nome;
    private String cpf;
    private String email;
    private String login;

    // Construtor
    public Aluno(int matricula, String nome, String cpf, String email, String login) {
        this.matricula = matricula;
        this.nome = nome;
        this.cpf = cpf;
        this.email = email;
        this.login = login;
    }

    // Métodos getters
    public int getMatricula() {
        return matricula;
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
    
    public String getLogin () {
    	return login;
    }

    // Métodos setters
    public void setMatricula(int matricula) {
        this.matricula = matricula;
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
    
    public void setLogin(String login) {
    	this.login = login;
    }

    @Override
    public String toString() {
        return "Aluno [matricula=" + matricula + ", nome=" + nome + ", cpf=" + cpf + ", email=" + email + "]";
    }
}

