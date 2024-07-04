const Client = require('../models/client');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const db = require('../config/db.config'); 


exports.create = (req, res) => {
    if (!req.body) {
        res.status(400).send({
            message: "Content can not be empty!"
        });
    }

    const client = new Client({
        nom: req.body.nom,
        prenom: req.body.prenom,
        email: req.body.email,
        motDePasse: req.body.motDePasse,
        telephone: req.body.telephone
    });

    Client.create(client, (err, data) => {
        if (err)
            res.status(500).send({
                message: err.message || "Some error occurred while creating the Client."
            });
        else res.send(data);
    });
};

exports.createUnsafe = (req, res) => {
    if (!req.body) {
        return res.status(400).send({
            message: "Content can not be empty!"
        });
    }

    const query = `INSERT INTO Clients (nom, prenom, email, motDePasse, telephone) VALUES ('${req.body.nom}', '${req.body.prenom}', '${req.body.email}', '${req.body.motDePasse}', '${req.body.telephone}')`;

    db.query(query, (err, result) => {  // Renommer res en result pour éviter les conflits
        if (err) {
            console.log("error: ", err);
            return res.status(500).send({
                message: err.message || "Some error occurred while creating the Client."
            });
        }
        res.send({ message: "Client created successfully" });
    });
};


exports.findOne = (req, res) => {
    Client.findById(req.params.clientId, (err, data) => {
        if (err) {
            if (err.kind === "not_found") {
                res.status(404).send({
                    message: `Not found Client with id ${req.params.clientId}.`
                });
            } else {
                res.status(500).send({
                    message: "Error retrieving Client with id " + req.params.clientId
                });
            }
        } else res.send(data);
    });
};

exports.login = (req, res) => {
    if (!req.body.email || !req.body.motDePasse) {
        return res.status(400).send({
            message: "Email and password can not be empty!"
        });
    }

    Client.findByEmail(req.body.email, (err, data) => {
        if (err) {
            if (err.kind === "not_found") {
                return res.status(404).send({
                    message: `Not found Client with email ${req.body.email}.`
                });
            } else {
                return res.status(500).send({
                    message: "Error retrieving Client with email " + req.body.email
                });
            }
        }

        bcrypt.compare(req.body.motDePasse, data.motDePasse, (err, result) => {
            if (result) {
                const token = jwt.sign({ id_client: data.id_client, email: data.email }, process.env.JWT_SECRET, {
                    expiresIn: '1h'
                });
                res.send({ message: "Login successful", token: token });
            } else {
                res.status(401).send({ message: "Invalid password" });
            }
        });
    });
};

exports.loginUnsafe = (req, res) => {
    if (!req.body.email || !req.body.motDePasse) {
        return res.status(400).send({
            message: "Email and password can not be empty!"
        });
    }

    db.query(`SELECT * FROM Clients WHERE email = '${req.body.email}' AND motDePasse = '${req.body.motDePasse}'`, (err, data) => {
        if (err) {
            return res.status(500).send({
                message: "Error retrieving Client with email " + req.body.email
            });
        }
        if (data.length) {
            res.send({ message: "Login successful", client: data[0] });
        } else {
            res.status(401).send({ message: "Invalid email or password" });
        }
    });
};
