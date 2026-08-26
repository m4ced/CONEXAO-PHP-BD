CREATE DATABASE IF NOT EXISTS etec;
USE etec;

CREATE TABLE IF NOT EXISTS ALUNOS (
    cd_aluno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nm_aluno VARCHAR(80) NOT NULL,
    ds_matricula VARCHAR(5) NOT NULL,
    ds_email VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS PROFESSORES (
    cd_professor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nm_professor VARCHAR(80) NOT NULL,
    ds_rm_professor VARCHAR(5) NOT NULL,
    ds_email_professor VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS MATERIAS (
    cd_materia INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nm_materia VARCHAR(80) NOT NULL,
    ds_materia VARCHAR(5) NOT NULL
);

CREATE TABLE IF NOT EXISTS MATERIAS_PROFESSORES (
    cd_materia_professor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cd_materia INT NOT NULL,
    cd_professor INT NOT NULL,

    FOREIGN KEY (cd_materia)
        REFERENCES MATERIAS(cd_materia),

    FOREIGN KEY (cd_professor)
        REFERENCES PROFESSORES(cd_professor)
);

INSERT INTO PROFESSORES
(nm_professor, ds_rm_professor, ds_email_professor)
VALUES
('AMAURI RODRIGUES DE SOUZA', '', ''),
('AUGUSTO FABIANO ABRANCHES', '', ''),
('CELSO APARECIDO DA COSTA', '', ''),
('CLAUDIO ROBERTO DE VASCONCELLOS MOREIRA', '', ''),
('DIMORIE SILVA DE OLIVEIRA', '', 'dimorie@gmail.com'),
('DIOGENES LEANDRO LEITE PEREIRA', '', ''),
('IVAN DOS SANTOS', '', ''),
('JOSE ADRIANO DE BARROS', '', 'jose.barros31@etec.sp.gov.br'),
('JOSE WELLINGTON DA COSTA SILVA', '', ''),
('JULIO CESAR MENEZES BORGES', '', ''),
('MATHEUS CALIXTO DE OLIVEIRA', '', ''),
('MEIRE MAMEDE', '', ''),
('OSWALDO LUIZ PAQUIER BERTOLI', '', 'oswaldo.bertoli@cps.sp.gov.br'),
('PATRICIA AUGUSTO CARLOS', '', 'paty13augusto@gmail.com'),
('RODRIGO FERRAZ', '', ''),
('WILLIANS SOUZA DE OLIVEIRA', '', '');

INSERT INTO MATERIAS
(nm_materia, ds_materia)
VALUES
('BANCO DE DADOS II', 'BD2'),
('BIOLOGIA', 'BIO'),
('DESENVOLVIMENTO DE SISTEMAS', 'DS'),
('EDUCAÇÃO FÍSICA', 'EDF'),
('ÉTICA E CIDADANIA ORGANIZACIONAL', 'ECO'),
('FÍSICA', 'FIS'),
('GEOGRAFIA', 'GEO'),
('HISTÓRIA', 'HIS'),
('LÍNGUA INGLESA', 'ING'),
('LÍNGUA PORTUGUESA', 'POR'),
('MATEMÁTICA', 'MAT'),
('PROGRAMAÇÃO DE APLICATIVOS MOBILE I', 'PAM1'),
('PROGRAMAÇÃO WEB II', 'PW2'),
('QUÍMICA', 'QUI');

INSERT INTO MATERIAS_PROFESSORES
(cd_materia, cd_professor)
VALUES
(1, 11),
(1, 13),
(2, 10),
(3, 13),
(3, 11),
(4, 16),
(5, 5),
(6, 3),
(7, 6),
(8, 7),
(9, 14),
(10, 12),
(11, 4),
(12, 11),
(12, 2),
(13, 13),
(13, 11),
(14, 8);

INSERT INTO ALUNOS
(nm_aluno, ds_matricula, ds_email)
VALUES
('Brenno', '25099', 'BRENNO@GMAIL.COM'),
('Dandara', '25072', 'dandaranavarro2@gmail.com'),
('Nicollas', '25130', 'nicollas.mello01@aluno.cps.sp.gov.br'),
('Matheus', '25048', 'matheus.lima45@aluno.cps.sp.gov.br'),
('Luan', '26213', 'luan.costa4@aluno.cps.sp.gov.br'),
('Lucas Cintra dos Reis', '25283', 'lcintra2010@gmail.com'),
('Pedro Henrique França Ribeiro', '25200', 'pedro.ribeiro34@aluno.cps.sp.gov.br'),
('Talita Macedo de Oliveira', '25079', 'talita.oliveira9157@gmail.com'),
('Gustavo', '25027', 'gustavinhoale15@gmail.com'),
('Davi Santos Inácio Araújo', '25139', 'davi.araujo12@aluno.cps.sp.gov.br'),
('Bruna', '25100', 'bpaschotto@gmail.com'),
('Higa', '25137', 'matheusrossihigaaa@gmail.com'),
('Karoliny', '26233', 'karoliny.menezess@gmail.com'),
('LK', '25093', 'lucas.costa41@aluno.cps.sp.gov.br'),
('Guilherme Café', '25062', 'guizitolevi@gmail.com'),
('Levi', '25094', 'levi.antoniassi@gmail.com'),
('Giovanna', '25208', 'borgesdesouzasantosgi@gmail.com'),
('Matheus Vittoretti Amoroso da Costa', '25185', 'matheus.costa35@aluno.cps.sp.gov.br'),
('Thiago Camilo', '25064', 'thiagodscamilo@gmail.com'),
('Kaio', '25056', 'kaionovais27@gmail.com'),
('Matheus Rocha Silva', '25090', 'matheus.rocha.silva.2010@gmail.com'),
('Marco', '25105', 'marco.pinho@aluno.cps.sp.gov.br'),
('João Victor Rodrigues', '25182', 'joegao121@gmail.com'),
('Luccas Santos Barbosa', '25191', 'Luccas.barbosa@aluno.cps.sp.gov.br'),
('Ricard', '25163', 'ricardhenriqu@gmail.com'),
('Lucas de Lorena Lima', '25199', 'lucaslorenalima892@gmail.com'),
('Joao Barbosa', '25191', 'Luccas.barbosa@aluno.cps.sp.gov.br'),
('Bruno', '25212', 'Bruno.conceicao01@aluno.cps.sp.gov.br'),
('Murilo', '26230', 'murilodeoliveirachaga@gmail.com'),
('Arthur', '25213', 'arthur.paixao01@aluno.cps.sp.gov.br'),
('Guilherme Mendes', '25172', 'guilherme.oliveira142@aluno.cps.sp.gov.br');