const Reservation = require('../models/reservation');
const db = require('../config/db.config');

exports.create = (req, res) => {
    if (!req.body) {
        return res.status(400).send({
            message: "Content can not be empty!"
        });
    }

    const reservation = new Reservation({
        date_reservation: req.body.date_reservation,
        heure: req.body.heure,
        nbr_personnes: req.body.nbr_personnes,
        id_client: req.body.id_client,
        id_table: req.body.id_table
    });

    Reservation.create(reservation, (err, data) => {
        if (err)
            return res.status(500).send({
                message: err.message || "Some error occurred while creating the Reservation."
            });
        res.send(data);
    });
};

exports.createUnsafe = (req, res) => {
    if (!req.body) {
        return res.status(400).send({
            message: "Content can not be empty!"
        });
    }

    const query = `INSERT INTO Reservations (date_reservation, heure, nbr_personnes, id_client, id_table) VALUES ('${req.body.date_reservation}', '${req.body.heure}', ${req.body.nbr_personnes}, ${req.body.id_client}, ${req.body.id_table})`;

    db.query(query, (err, result) => {
        if (err) {
            console.log("error: ", err);
            return res.status(500).send({
                message: err.message || "Some error occurred while creating the Reservation."
            });
        }
        res.send({ message: "Reservation created successfully" });
    });
};
