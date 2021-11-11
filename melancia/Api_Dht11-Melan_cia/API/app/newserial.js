const sensors = require('./sensors')
const SerialPort = require("serialport");
const Readline = SerialPort.parsers.Readline;

class ArduinoRead {

    constructor() {
        this.listTemp = [];
        this.__listDataTemp = [];
   
        
        this.listUmidade = [];
        this.__listDatahum = [];
    }

    get ListTemp() {
        return this.listTemp;
    }
    get ListUmidade() {
        return this.listUmidade;
    }


    fake_data() {
        setInterval(() => {
            
            let data_float = sensors.lm35(15, 40);
            

            if (this.listTemp.length === 59) {
                let sum = this.listTemp.reduce((a, b) => a + b, 0);
                while (this.listTemp.length > 0) {
                    this.listTemp.pop();
                } 
            }
            console.log('Temperatura', data_float.toFixed(2));
            this.listTemp.push(Number(data_float.toFixed(2)));

            
            let data_float2 = sensors.dht11(20, 60);
            
            
            if (this.listUmidade.length === 59) {
                let sum = this.listUmidade.reduce((a, b) => a + b, 0);
                while (this.listUmidade.length > 0) {
                    this.listUmidade.pop();
                } 
            }
            console.log('Umidade', data_float2[0]);
            this.listUmidade.push(data_float2[0]);
        }, 2000);
    }

    SetConnection() {

        SerialPort.list().then(listSerialDevices => {

            let listArduinoSerial = listSerialDevices.filter(serialDevice => {
                return serialDevice.vendorId == 2341 && serialDevice.productId == 43;
            });

            if (listArduinoSerial.length != 1) {
                this.fake_data();
                console.log("Arduino not found - Generating data");
            } else {
                console.log("Arduino found in the com %s", listArduinoSerial[0].comName);
                return listArduinoSerial[0].comName;
            }
        }).then(comName => {
            try {
                let arduino = new SerialPort(comName, { baudRate: 9600 });

                const parser = new Readline();
                arduino.pipe(parser);
                arduino.on('close',() => {
                    console.log('Lost Connection');
                    this.fake_data();
                });
                parser.on('data', (data) => {
                    console.log('data', data);

                    let split = data.split(" ");

                    let umidade = split[0];
                    let temperatura = split[1];


                    this.listUmidade.push(parseInt(umidade));
                    this.listTemp.push(parseFloat(temperatura))
                });
            } catch (e) {
                this.fake_data();
            }

        }).catch(error => console.log(error));
    }
}

const serial = new ArduinoRead();
serial.SetConnection();

module.exports.ArduinoDataTemp = { listUmidade: serial.ListUmidade, listTemperatura: serial.ListTemp}