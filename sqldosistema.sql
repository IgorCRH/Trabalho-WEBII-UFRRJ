-- Tabela Aluno
CREATE TABLE Aluno (
    Matricula INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50),
	Login VARCHAR(30),
    CPF VARCHAR(14),
	Senha VARCHAR(30),
    Email VARCHAR(50)
);

-- Tabela Professor
CREATE TABLE Professor (
    CodigoRegistro INT PRIMARY KEY,
    Nome VARCHAR(50),
	Login VARCHAR(30),
    CPF VARCHAR(14),
    Email VARCHAR(50),
	Senha VARCHAR(30),
    Salario DECIMAL(10, 2),
    Departamento VARCHAR(50)
);

-- Tabela FuncionarioAdministrativo
CREATE TABLE FuncionarioAdministrativo (
    CodigoRegistro INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50),
	Login VARCHAR(30),
    CPF VARCHAR(14),
    Email VARCHAR(50),
	Senha VARCHAR(30),
    Salario DECIMAL(10, 2),
    Departamento VARCHAR(50)
);

-- Tabela Cursos
CREATE TABLE Cursos (
    CodigoCurso INT AUTO_INCREMENT PRIMARY KEY,
    NomeCurso VARCHAR(50),
    Departamento VARCHAR(50)
);

-- Tabela Disciplinas
CREATE TABLE Disciplinas (
    CodigoDisciplina INT AUTO_INCREMENT PRIMARY KEY,
    NomeDisciplina VARCHAR(50),
	CodigoCurso INT,
    Departamento VARCHAR(50),
	FOREIGN KEY (CodigoCurso) REFERENCES Cursos(CodigoCurso)
);

CREATE TABLE Turma_Disciplina (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NumeroTurma INT,
    CodigoDisciplina INT,
	UNIQUE (NumeroTurma),
    FOREIGN KEY (CodigoDisciplina) REFERENCES Disciplinas(CodigoDisciplina)
);

-- Tabela Turma_Disciplina
CREATE TABLE Turma_Aluno (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NumeroTurma INT,
    MatriculaAluno INT,
    FOREIGN KEY (NumeroTurma) REFERENCES Turma_Disciplina(NumeroTurma),
	FOREIGN KEY (MatriculaAluno) REFERENCES Aluno(Matricula)
);

-- Tabela Aulas
CREATE TABLE Aulas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Data DATE,
    CodigoDisciplina INT,
	IDTurmaAluno INT,
	FOREIGN KEY (IDTurmaAluno) REFERENCES Turma_Aluno(ID),
    FOREIGN KEY (CodigoDisciplina) REFERENCES Disciplinas(CodigoDisciplina)
);

-- Tabela Frequencia
CREATE TABLE Frequencia (
    IDAula INT,
    CodigoDisciplina INT,
    AlunosPresentes TEXT,
    PRIMARY KEY (IDAula, CodigoDisciplina),
    FOREIGN KEY (IDAula) REFERENCES Aulas(ID),
    FOREIGN KEY (CodigoDisciplina) REFERENCES Disciplinas(CodigoDisciplina)
);

-- Inserir 5 alunos
INSERT INTO Aluno (Matricula, Nome, Login, CPF, Senha, Email) VALUES
(1, 'Alice Silva', 'alice', '123.456.789-01', 'senha_alice', 'alice@email.com'),
(2, 'Bob Santos', 'bob', '234.567.890-12', 'senha_bob', 'bob@email.com'),
(3, 'Carol Oliveira', 'carol', '345.678.901-23', 'senha_carol', 'carol@email.com'),
(4, 'David Lima', 'david', '456.789.012-34', 'senha_david', 'david@email.com'),
(5, 'Eva Pereira', 'eva', '567.890.123-45', 'senha_eva', 'eva@email.com');

-- Inserir 5 disciplinas
INSERT INTO Disciplinas (CodigoDisciplina, NomeDisciplina, Departamento) VALUES
(1, 'Matemática', 'Departamento de Ciências Exatas'),
(2, 'História', 'Departamento de Humanidades'),
(3, 'Física', 'Departamento de Ciências Exatas'),
(4, 'Literatura', 'Departamento de Humanidades'),
(5, 'Química', 'Departamento de Ciências Exatas');

-- Inserir 5 cursos
INSERT INTO Cursos (CodigoCurso, NomeCurso, Departamento) VALUES
(1, 'Engenharia Civil', 'Departamento de Engenharia'),
(2, 'História da Arte', 'Departamento de Artes'),
(3, 'Ciência da Computação', 'Departamento de Ciências Exatas'),
(4, 'Letras', 'Departamento de Humanidades'),
(5, 'Química Industrial', 'Departamento de Ciências Exatas');

-- Inserir 5 professores
INSERT INTO Professor (CodigoRegistro, Nome, Login, CPF, Senha, Email, Salario, Departamento) VALUES
(1, 'Prof. Silva', 'prof_silva', '111.222.333-44', 'senha_prof_silva', 'prof_silva@email.com', 5000.00, 'Departamento de Engenharia'),
(2, 'Prof. Santos', 'prof_santos', '222.333.444-55', 'senha_prof_santos', 'prof_santos@email.com', 5500.00, 'Departamento de Artes'),
(3, 'Prof. Oliveira', 'prof_oliveira', '333.444.555-66', 'senha_prof_oliveira', 'prof_oliveira@email.com', 6000.00, 'Departamento de Ciências Exatas'),
(4, 'Prof. Lima', 'prof_lima', '444.555.666-77', 'senha_prof_lima', 'prof_lima@email.com', 6500.00, 'Departamento de Humanidades'),
(5, 'Prof. Pereira', 'prof_pereira', '555.666.777-88', 'senha_prof_pereira', 'prof_pereira@email.com', 7000.00, 'Departamento de Ciências Exatas');

-- Inserir 2 funcionários administrativos
INSERT INTO FuncionarioAdministrativo (CodigoRegistro, Nome, Login, CPF, Senha, Email, Salario, Departamento) VALUES
(1, 'Func. Admin1', 'func_admin1', '111.222.333-44', 'senha_func_admin1', 'func_admin1@email.com', 4000.00, 'Departamento de Engenharia'),
(2, 'Func. Admin2', 'func_admin2', '222.333.444-55', 'senha_func_admin2', 'func_admin2@email.com', 4500.00, 'Departamento de Artes');

INSERT INTO Turma_Disciplina (NumeroTurma, CodigoDisciplina) VALUES
    (101, 1),
    (102, 1),
    (103, 1),
    (104, 1);

-- Inserir turmas para a disciplina de História (supondo CodigoDisciplina = 2)
INSERT INTO Turma_Disciplina (NumeroTurma, CodigoDisciplina) VALUES
    (201, 2),
    (202, 2),
    (203, 2),
    (204, 2);

-- Inserir turmas para a disciplina de Física (supondo CodigoDisciplina = 3)
INSERT INTO Turma_Disciplina (NumeroTurma, CodigoDisciplina) VALUES
    (301, 3),
    (302, 3),
    (303, 3),
    (304, 3);

-- Inserir turmas para a disciplina de Literatura (supondo CodigoDisciplina = 4)
INSERT INTO Turma_Disciplina (NumeroTurma, CodigoDisciplina) VALUES
    (401, 4),
    (402, 4),
    (403, 4),
    (404, 4);
	
INSERT INTO Turma_Aluno (NumeroTurma, MatriculaAluno) VALUES
(101, (SELECT Matricula FROM Aluno WHERE Nome = 'Alice Silva')),
(101, (SELECT Matricula FROM Aluno WHERE Nome = 'Bob Santos')),
(101, (SELECT Matricula FROM Aluno WHERE Nome = 'Carol Oliveira'));


INSERT INTO Turma_Aluno (NumeroTurma, MatriculaAluno) VALUES
(201, (SELECT Matricula FROM Aluno WHERE Nome = 'David Lima')),
(201, (SELECT Matricula FROM Aluno WHERE Nome = 'Eva Pereira'));
	