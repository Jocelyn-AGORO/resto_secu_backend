const db = require('../config/db.config');

const Restaurant = function(restaurant) {
    this.nom = restaurant.nom;
    this.adresse = restaurant.adresse;
    this.telephone = restaurant.telephone;
};

Restaurant.findByName = (name, result) => {
    db.query(`SELECT * FROM Restaurants WHERE nom LIKE ?`, [`%${name}%`], (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(err, null);
            return;
        }
        result(null, res);
    });
};

module.exports = Restaurant;
