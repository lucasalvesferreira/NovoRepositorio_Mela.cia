var database = require("../database/config");

function buscarUltimasMedidas(idCanteiro,limite_linhas) {
    instrucaoSql = `select 
                        temperatura_lm35, 
                        umidade, 
                        hr_medida,
                        DATE_FORMAT(hr_medida,'%H:%i:%s') as momento_grafico
                        from medidas
                        where fkcanteiros = ${idCanteiro}
                        order by idMedidas desc limit ${limite_linhas}`;
    console.log("Executando a instrução SQL: \n"+instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idCanteiro) {
    instrucaoSql = `select temperatura_lm35, 
                            umidade, 
                            DATE_FORMAT(hr_medida,'%H:%i:%s') as momento_grafico, 
                            fkcanteiros 
                            from medidas where fkcanteiros = ${idCanteiro} 
                    order by idMedidas desc limit 1`;
                    
    console.log("Executando a instrução SQL: \n"+instrucaoSql);
    return database.executar(instrucaoSql);
}


function buscarMediaUmidade(idCanteiro) {
    instrucaoSql = ` select round( avg(umidade),2) as mediaUmi from medidas ;`;
                    
    console.log("Executando a instrução SQL: \n"+instrucaoSql);
    return database.executar(instrucaoSql);
}
function buscarMediaTemperatura(idCanteiro) {
    instrucaoSql = ` select round( avg(temperatura_lm35),2) as mediaTemp from medidas ;`;
                    
    console.log("Executando a instrução SQL: \n"+instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    buscarMediaUmidade,
    buscarMediaTemperatura
}