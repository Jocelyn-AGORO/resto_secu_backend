const db = require('../config/db.config');

const Reservation = function(reservation) {
    this.date_reservation = reservation.date_reservation;
    this.heure = reservation.heure;
    this.nbr_personnes = reservation.nbr_personnes;
    this.id_client = reservation.id_client;
    this.id_table = reservation.id_table;
};

Reservation.create = (newReservation, result) => {
    db.query("INSERT INTO Reservations SET ?", newReservation, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(err, null);
            return;
        }
        result(null, { id: res.insertId, ...newReservation });
    });
};

module.exports = Reservation;
