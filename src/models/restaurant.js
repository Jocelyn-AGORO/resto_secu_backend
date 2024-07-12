const db = require('../config/db.config');

const Restaurant = function(restaurant) {
    this.nom = restaurant.nom;
    this.adresse = restaurant.adresse;
    this.telephone = restaurant.telephone;
};

Restaurant.findAll = (result) => {
    const sql = "SELECT * FROM restaurants";

    db.all(sql, [], (err, rows) => {
        if (err) {
            console.log("error: ", err);
            result(err, null);
            return;
        }
        result(null, rows);
    });
};

Restaurant.findByName = (name, result) => {
    const sql = "SELECT * FROM restaurants WHERE nom LIKE ?";

    db.all(sql, [`%${name}%`], (err, rows) => {
        if (err) {
            console.log("error: ", err);
            result(err, null);
            return;
        }
        result(null, rows);
    });
};

module.exports = Restaurant;