const sqlite3 = require('sqlite3').verbose();
const path = require('path');
require('dotenv').config();

const dbPath =   path.resolve(__dirname, '../../restaurants.db');

const db = new sqlite3.Database(dbPath, sqlite3.OPEN_READWRITE,(err) => {
  if (err) {
    console.error('Error de connexion à la base de données : ', err.message);
  } else {
    console.log('Connecté à la base de données SQLite avec succès.');
  }
});

module.exports = db;