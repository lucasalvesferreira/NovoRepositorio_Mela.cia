var database = require("../database/config")

function listar() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
        SELECT * FROM usuario;
    `;
    console.log("Executando a instrução SQL: \n"+instrucao);
    return database.executar(instrucao);
}

function entrar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucao = `
        SELECT * FROM Empresa WHERE email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n"+instrucao);
    return database.executar(instrucao);
}

function cadastrar(cnpj, razao, responsavel, email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", cnpj, razao, responsavel, email, senha);
    var instrucao = `
        INSERT INTO Empresa (CNPJ, razaoEmp, responsavel, email, senha) VALUES ('${cnpj}', '${razao}', '${responsavel}', '${email}', '${senha}');
    `;
    console.log("Executando a instrução SQL: \n"+instrucao);
    return database.executar(instrucao);
}
function cadastrarFazenda(estado, cidade, logradouro, numero, complemento, qtd_canteiros, idEmpresa) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", estado, cidade, logradouro, numero, complemento, qtd_canteiros, idEmpresa);
    var instrucao = `
        INSERT INTO fazenda (estado, cidade, logradouro, numero, complemento, qtd_canteiros, fkEmpresa) VALUES
         ('${estado}', '${cidade}', '${logradouro}', ${numero}, '${complemento}', ${qtd_canteiros}, ${idEmpresa});
    `;
    console.log("Executando a instrução SQL: \n"+instrucao);
    return database.executar(instrucao);
}
function cadastrarFuncionario(nome_f, senha_f, email_f, tel_f, fkfaz_f, idEmpresa) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome_f, senha_f, email_f, tel_f, fkfaz_f, idEmpresa);
    var instrucao = `
            INSERT INTO funcionario (nomeFunc, senhaFunc, emailFunc, telefone, fkFazenda) VALUES
             ('${nome_f}', '${senha_f}', '${email_f}', '${tel_f}', ${fkfaz_f});
        `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    entrar,
    cadastrar,
    listar,
    cadastrarFazenda,
    cadastrarFuncionario
};