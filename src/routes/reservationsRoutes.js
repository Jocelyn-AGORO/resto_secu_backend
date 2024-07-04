const { authenticateToken } = require('../middleware/auth');

module.exports = app => {
    const reservations = require("../controllers/reservationsController");

    // app.post("/reservations", authenticateToken, reservations.create);
    app.post("/reservations", reservations.create);
    app.post("/reservationsUnsafe", reservations.createUnsafe);
};
