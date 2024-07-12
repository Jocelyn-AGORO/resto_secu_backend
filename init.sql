-- Create tables
CREATE TABLE IF NOT EXISTS `clients` (
     id_client INTEGER PRIMARY KEY AUTOINCREMENT,
     nom TEXT,
     prenom TEXT,
     email TEXT,
     motDePasse TEXT NOT NULL,
     telephone TEXT
);

CREATE TABLE IF NOT EXISTS `restaurants` (
     id_restaurant INTEGER PRIMARY KEY AUTOINCREMENT,
     nom TEXT,
     adresse TEXT,
     telephone TEXT
);

CREATE TABLE IF NOT EXISTS `tablerestaurants` (
      id_table INTEGER PRIMARY KEY AUTOINCREMENT,
      numero INTEGER,
      nbr_places INTEGER,
      id_restaurant INTEGER,
      FOREIGN KEY (id_restaurant) REFERENCES `restaurants`(id_restaurant)
);

CREATE TABLE IF NOT EXISTS `reservations` (
  id_reservation INTEGER PRIMARY KEY AUTOINCREMENT,
  date_reservation DATE,
  heure TIME,
  nbr_personnes INTEGER,
  id_client INTEGER,
  id_table INTEGER,
  FOREIGN KEY (id_client) REFERENCES `clients`(id_client),
    FOREIGN KEY (id_table) REFERENCES `tablerestaurants`(id_table)
);

-- Start transaction
BEGIN TRANSACTION;

-- Insert data into clients table
INSERT INTO `clients` (nom, prenom, email, motDePasse, telephone) VALUES
('Dupont', 'Jean', 'jean.dupont@example.com', 'password123', '0601020304'),
('Martin', 'Sophie', 'sophie.martin@example.com', 'password123', '0605060708'),
('Bernard', 'Luc', 'luc.bernard@example.com', 'password123', '0608091011'),
('Dubois', 'Emma', 'emma.dubois@example.com', 'password123', '0612131415'),
('Moreau', 'Marie', 'marie.moreau@example.com', 'password123', '0616171819'),
('Bernardssss', 'Luc', 'luc.bernard@example.com', '$2a$08$pxFDUHO5Md7A8Vf3PiufauAvQh5idpLUF3ziD/2lLIBSnrn.MumL.', '0608091011'),
('Bernardssss', 'Luc', 'luc10.bernard@example.com', '$2a$08$Wd/RciiQq9KkYSi3WKn3y.iD7MYwZSxlkxQlQ3Tqsq35ar117pUHq', '0608091011'),
('Bernardssss', 'Luc', 'luc11.bernard@example.com', '$2a$08$DiXiy8Oy0Kq8pWG.G50rwOaltdehR39tp3d.GbdnnG.OZm/iZfPJm', '0608091011'),
('11Bernardssss', 'Luc', 'luc11.bernard@example.com', 'password123', '0608091011'),
('Bernardssss', 'Luc', 'luc11.bernard@example.com', '$2a$08$.wSx7ujOWcsludrNctlx6OuHdEtUp.DWz2aIdMRjn4DL/UcBmmtPW', '0608091011'),
('11Bernardssss', 'Luc', 'luc11.bernard@example.com', 'password123', '0608091011'),
('11Bernardssss', 'Luc', 'luc11.bernard@example.com', 'password123', '0608091011');

-- Insert data into restaurants table
INSERT INTO `restaurants` (nom, adresse, telephone) VALUES
('Le Gourmet', '123 Rue de la Paix, Paris', '0140203040'),
('La Belle Époque', '456 Avenue des Champs, Paris', '0140506070'),
('Chez Pierre', '789 Boulevard Saint-Germain, Paris', '0140809010'),
('L''Épicurien', '101 Rue du Bac, Paris', '0140102030'),
('La Brasserie', '202 Rue de Rivoli, Paris', '0140304050');

-- Insert data into tablerestaurants table
INSERT INTO `tablerestaurants` (numero, nbr_places, id_restaurant) VALUES
(1, 4, 1),
(2, 2, 1),
(3, 6, 2),
(4, 4, 2),
(5, 4, 3),
(6, 2, 3),
(7, 8, 4),
(8, 4, 4),
(9, 6, 5),
(10, 4, 5);

-- Insert data into reservations table
INSERT INTO `reservations` (date_reservation, heure, nbr_personnes, id_client, id_table) VALUES
 ('2024-07-10', '19:00:00', 2, 1, 1),
 ('2024-07-11', '20:00:00', 4, 2, 3),
 ('2024-07-12', '18:00:00', 3, 3, 5),
 ('2024-07-13', '21:00:00', 6, 4, 7),
 ('2024-07-14', '19:30:00', 4, 5, 9);

-- Commit transaction
COMMIT;