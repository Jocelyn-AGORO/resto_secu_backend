CREATE TABLE Clients (
    id_client INT AUTO_INCREMENT  PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    email VARCHAR(50),
    motDePasse VARCHAR(255) NOT NULL,
    telephone VARCHAR(15)
);

CREATE TABLE Restaurants (
    id_restaurant INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    adresse VARCHAR(100),
    telephone VARCHAR(15)
);

CREATE TABLE TableRestaurants (
    id_table INT AUTO_INCREMENT PRIMARY KEY,
    numero INT,
    nbr_places INT,
    id_restaurant INT,
    FOREIGN KEY (id_restaurant) REFERENCES Restaurants(id_restaurant)
);

CREATE TABLE Reservations (
    id_reservation INT AUTO_INCREMENT  PRIMARY KEY,
    date_reservation DATE,
    heure TIME,
    nbr_personnes INT,
    id_client INT,
    id_table INT,
    FOREIGN KEY (id_client) REFERENCES Clients(id_client),
    FOREIGN KEY (id_table) REFERENCES TableRestaurants(id_table)
);

INSERT INTO Clients (id_client, nom, prenom, email, motDePasse, telephone) VALUES
(1, 'Dupont', 'Jean', 'jean.dupont@example.com', 'password123', '0601020304'),
(2, 'Martin', 'Sophie', 'sophie.martin@example.com', 'password123', '0605060708'),
(3, 'Bernard', 'Luc', 'luc.bernard@example.com', 'password123', '0608091011'),
(4, 'Dubois', 'Emma', 'emma.dubois@example.com', 'password123', '0612131415'),
(5, 'Moreau', 'Marie', 'marie.moreau@example.com', 'password123', '0616171819');

INSERT INTO Restaurants (id_restaurant, nom, adresse, telephone) VALUES
(1, 'Le Gourmet', '123 Rue de la Paix, Paris', '0140203040'),
(2, 'La Belle Époque', '456 Avenue des Champs, Paris', '0140506070'),
(3, 'Chez Pierre', '789 Boulevard Saint-Germain, Paris', '0140809010'),
(4, 'L’Épicurien', '101 Rue du Bac, Paris', '0140102030'),
(5, 'La Brasserie', '202 Rue de Rivoli, Paris', '0140304050');


INSERT INTO TableRestaurants (id_table, numero, nbr_places, id_restaurant) VALUES
(1, 1, 4, 1),
(2, 2, 2, 1),
(3, 3, 6, 2),
(4, 4, 4, 2),
(5, 5, 4, 3),
(6, 6, 2, 3),
(7, 7, 8, 4),
(8, 8, 4, 4),
(9, 9, 6, 5),
(10, 10, 4, 5);


INSERT INTO Reservations (id_reservation, date_reservation, heure, nbr_personnes, id_client, id_table) VALUES
(1, '2024-07-10', '19:00:00', 2, 1, 1),
(2, '2024-07-11', '20:00:00', 4, 2, 3),
(3, '2024-07-12', '18:00:00', 3, 3, 5),
(4, '2024-07-13', '21:00:00', 6, 4, 7),
(5, '2024-07-14', '19:30:00', 4, 5, 9);
