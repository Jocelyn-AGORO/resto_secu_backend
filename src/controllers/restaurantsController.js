const Restaurant = require('../models/restaurant');
const db = require('../config/db.config');

exports.restaurants = (req, res) => {
    Restaurant.findAll((err, data) => {
        if (err) {
            return res.status(500).send({
                message: err.message || "Some error occurred while retrieving the restaurants."
            });
        }
        res.send(data);
    });
};


exports.search = (req, res) => {
    if (!req.query.nom) {
        return res.status(400).send({
            message: "Nom can not be empty!"
        });
    }

    Restaurant.findByName(req.query.nom, (err, data) => {
        if (err) {
            return res.status(500).send({
                message: err.message || "Some error occurred while searching for the restaurant."
            });
        }
        res.send(data);
    });
};

exports.searchUnsafe = (req, res) => {
    if (!req.query.nom) {
        return res.status(400).send({
            message: "Nom can not be empty!"
        });
    }

    db.query(`SELECT * FROM Restaurants WHERE nom LIKE '%${req.query.nom}%'`, (err, data) => {
        if (err) {
            return res.status(500).send({
                message: "Some error occurred while searching for the restaurant."
            });
        }
        res.send(data);
    });
};
