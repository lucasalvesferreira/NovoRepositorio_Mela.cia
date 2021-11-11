const express = require('express');
const { ArduinoDataTemp } = require('./newserial')
const router = express.Router();


router.get('/', (request, response, next) => {

    let sumUmidade = ArduinoDataTemp.listUmidade.reduce((a, b) => a + b, 0);
    let averageUmidade = (sumUmidade / ArduinoDataTemp.listUmidade.length).toFixed(2);

    let sumTemperatura = ArduinoDataTemp.listTemperatura.reduce((a, b) => a + b, 0);
    let averageTemperatura = (sumTemperatura / ArduinoDataTemp.listTemperatura.length).toFixed(2);
    console.log(averageTemperatura)
    response.json({
        temperatura: ArduinoDataTemp.listTemperatura,
        umidade: ArduinoDataTemp.listUmidade,
        total: ArduinoDataTemp.listTemperatura.length,
        averageTemperatura: isNaN(averageTemperatura) ? 0 : averageTemperatura,
        averageUmidade: isNaN(averageUmidade) ? 0 : averageUmidade
    });

});

module.exports = router;