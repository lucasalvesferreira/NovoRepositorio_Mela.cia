var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

router.get("/", function(req, res) {
    usuarioController.testar(req, res);
});

router.get("/listar", function(req, res) {
    usuarioController.listar(req, res);
});

router.post("/cadastrar", function(req, res) {
    usuarioController.cadastrar(req, res);
});
router.post("/cadastrarCanteiro/:idEmpresa", function(req, res){
    usuarioController.cadastrarCanteiro(req, res);
})

router.post("/autenticar", function(req, res) {
    usuarioController.entrar(req, res);
});
  
module.exports = router;