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
    db.query("INSERT INTO Clients SET ?", newClient, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(err, null);
            return;
        }
        result(null, { id: res.insertId, ...newClient });
    });
};

Client.findById = (clientId, result) => {
    db.query(`SELECT * FROM Clients WHERE id_client = ${clientId}`, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(err, null);
            return;
        }
        if (res.length) {
            result(null, res[0]);
            return;
        }
        result({ kind: "not_found" }, null);
    });
};

Client.findByEmail = (email, result) => {
    db.query(`SELECT * FROM Clients WHERE email = ?`, [email], (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(err, null);
            return;
        }
        if (res.length) {
            result(null, res[0]);
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
