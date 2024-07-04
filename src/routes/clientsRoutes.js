const { authenticateToken } = require('../middleware/auth');

module.exports = app => {
    const clients = require("../controllers/clientsController");

    app.post("/clients", clients.create);
    app.post("/clients/unsafe", clients.createUnsafe); 

    app.post("/clients/login", clients.login);
    app.post("/clients/loginUnsafe", clients.loginUnsafe);
    
    app.get("/clients/:clientId", clients.findOne);
};
