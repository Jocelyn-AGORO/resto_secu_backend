const db = require('../config/db.config');

const Reservation = function(reservation) {
    this.date_reservation = reservation.date_reservation;
    this.heure = reservation.heure;
    this.nbr_personnes = reservation.nbr_personnes;
    this.id_client = reservation.id_client;
    this.id_table = reservation.id_table;
};

Reservation.create = (newReservation, result) => {
    const sql = `INSERT INTO reservations (date_reservation, heure, nbr_personnes, id_client, id_table) 
                 VALUES (?, ?, ?, ?, ?)`;
    const params = [
        newReservation.date_reservation,
        newReservation.heure,
        newReservation.nbr_personnes,
        newReservation.id_client,
        newReservation.id_table
    ];

    db.run(sql, params, function(err) {
        if (err) {
            console.log("error: ", err);
            result(err, null);
            return;
        }
        result(null, { id: this.lastID, ...newReservation });
    });
};

module.exports = Reservation;