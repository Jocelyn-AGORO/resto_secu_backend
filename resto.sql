-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 04 juil. 2024 à 12:50
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `resto`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `motDePasse` varchar(255) NOT NULL,
  `telephone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id_client`, `nom`, `prenom`, `email`, `motDePasse`, `telephone`) VALUES
(1, 'Dupont', 'Jean', 'jean.dupont@example.com', 'password123', '0601020304'),
(2, 'Martin', 'Sophie', 'sophie.martin@example.com', 'password123', '0605060708'),
(3, 'Bernard', 'Luc', 'luc.bernard@example.com', 'password123', '0608091011'),
(4, 'Dubois', 'Emma', 'emma.dubois@example.com', 'password123', '0612131415'),
(5, 'Moreau', 'Marie', 'marie.moreau@example.com', 'password123', '0616171819'),
(6, 'Bernardssss', 'Luc', 'luc.bernard@example.com', '$2a$08$pxFDUHO5Md7A8Vf3PiufauAvQh5idpLUF3ziD/2lLIBSnrn.MumL.', '0608091011'),
(7, 'Bernardssss', 'Luc', 'luc10.bernard@example.com', '$2a$08$Wd/RciiQq9KkYSi3WKn3y.iD7MYwZSxlkxQlQ3Tqsq35ar117pUHq', '0608091011'),
(8, 'Bernardssss', 'Luc', 'luc11.bernard@example.com', '$2a$08$DiXiy8Oy0Kq8pWG.G50rwOaltdehR39tp3d.GbdnnG.OZm/iZfPJm', '0608091011'),
(9, '11Bernardssss', 'Luc', 'luc11.bernard@example.com', 'password123', '0608091011'),
(10, 'Bernardssss', 'Luc', 'luc11.bernard@example.com', '$2a$08$.wSx7ujOWcsludrNctlx6OuHdEtUp.DWz2aIdMRjn4DL/UcBmmtPW', '0608091011'),
(11, '11Bernardssss', 'Luc', 'luc11.bernard@example.com', 'password123', '0608091011'),
(12, '11Bernardssss', 'Luc', 'luc11.bernard@example.com', 'password123', '0608091011');

-- --------------------------------------------------------

--
-- Structure de la table `reservations`
--

CREATE TABLE `reservations` (
  `id_reservation` int(11) NOT NULL,
  `date_reservation` date DEFAULT NULL,
  `heure` time DEFAULT NULL,
  `nbr_personnes` int(11) DEFAULT NULL,
  `id_client` int(11) DEFAULT NULL,
  `id_table` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reservations`
--

INSERT INTO `reservations` (`id_reservation`, `date_reservation`, `heure`, `nbr_personnes`, `id_client`, `id_table`) VALUES
(1, '2024-07-10', '19:00:00', 2, 1, 1),
(2, '2024-07-11', '20:00:00', 4, 2, 3),
(3, '2024-07-12', '18:00:00', 3, 3, 5),
(4, '2024-07-13', '21:00:00', 6, 4, 7),
(5, '2024-07-14', '19:30:00', 4, 5, 9);

-- --------------------------------------------------------

--
-- Structure de la table `restaurants`
--

CREATE TABLE `restaurants` (
  `id_restaurant` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `restaurants`
--

INSERT INTO `restaurants` (`id_restaurant`, `nom`, `adresse`, `telephone`) VALUES
(1, 'Le Gourmet', '123 Rue de la Paix, Paris', '0140203040'),
(2, 'La Belle Époque', '456 Avenue des Champs, Paris', '0140506070'),
(3, 'Chez Pierre', '789 Boulevard Saint-Germain, Paris', '0140809010'),
(4, 'L’Épicurien', '101 Rue du Bac, Paris', '0140102030'),
(5, 'La Brasserie', '202 Rue de Rivoli, Paris', '0140304050');

-- --------------------------------------------------------

--
-- Structure de la table `tablerestaurants`
--

CREATE TABLE `tablerestaurants` (
  `id_table` int(11) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `nbr_places` int(11) DEFAULT NULL,
  `id_restaurant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tablerestaurants`
--

INSERT INTO `tablerestaurants` (`id_table`, `numero`, `nbr_places`, `id_restaurant`) VALUES
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

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id_reservation`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_table` (`id_table`);

--
-- Index pour la table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id_restaurant`);

--
-- Index pour la table `tablerestaurants`
--
ALTER TABLE `tablerestaurants`
  ADD PRIMARY KEY (`id_table`),
  ADD KEY `id_restaurant` (`id_restaurant`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id_reservation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id_restaurant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `tablerestaurants`
--
ALTER TABLE `tablerestaurants`
  MODIFY `id_table` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`id_table`) REFERENCES `tablerestaurants` (`id_table`);

--
-- Contraintes pour la table `tablerestaurants`
--
ALTER TABLE `tablerestaurants`
  ADD CONSTRAINT `tablerestaurants_ibfk_1` FOREIGN KEY (`id_restaurant`) REFERENCES `restaurants` (`id_restaurant`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
