const db = require('../config/db.config');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

const Client = function(client) {
    this.nom = client.nom;
    this.prenom = client.prenom;
    this.email = client.email;
    this.motDePasse = bcrypt.hashSync(client.motDePasse, 8);
    this.telephone = client.telephone;
};

Client.create = (newClient, result) => {
    const sql = "INSERT INTO clients (nom, prenom, email, motDePasse, telephone) VALUES (?, ?, ?, ?, ?)";
    const params = [newClient.nom, newClient.prenom, newClient.email, newClient.motDePasse, newClient.telephone];

    db.run(sql, params, function(err) {
        if (err) {
            console.log("error: ", err);
            result(err, null);
            return;
        }
        result(null, { id: this.lastID, ...newClient });
    });
};

Client.findById = (clientId, result) => {
    const sql = "SELECT * FROM clients WHERE id_client = ?";

    db.get(sql, [clientId], (err, row) => {
        if (err) {
            console.log("error: ", err);
            result(err, null);
            return;
        }
        if (row) {
            result(null, row);
            return;
        }
        result({ kind: "not_found" }, null);
    });
};

Client.findByEmail = (email, result) => {
    const sql = "SELECT * FROM clients WHERE email = ?";

    db.get(sql, [email], (err, row) => {
        if (err) {
            console.log("error: ", err);
            result(err, null);
            return;
        }
        if (row) {
            result(null, row);
            return;
        }
        result({ kind: "not_found" }, null);
    });
};

Client.prototype.generateAuthToken = function() {
    const token = jwt.sign({ id_client: this.id_client, email: this.email }, process.env.JWT_SECRET, {
        expiresIn: '1h'
    });
    return token;
};

module.exports = Client;