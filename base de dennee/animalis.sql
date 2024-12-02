-- Création de la base de données si elle n'existe pas
CREATE DATABASE IF NOT EXISTS `animalis`;
USE `animalis`;

-- Ajustements globaux
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Tables
CREATE TABLE `articles_commande` (
  `article_commande_id` int NOT NULL AUTO_INCREMENT,
  `commande_id` int NOT NULL,
  `produit_id` int NOT NULL,
  `quantite` int NOT NULL,
  `prix` decimal(10,0) NOT NULL,
  PRIMARY KEY (`article_commande_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `avis` (
  `avis_id` int NOT NULL AUTO_INCREMENT,
  `avis_utilisateur_id` int NOT NULL,
  `produit_id` int NOT NULL,
  `note_avis` int NOT NULL,
  `comment` text NOT NULL,
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`avis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `categorie` (
  `categorie_id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`categorie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `commandes` (
  `commande_id` int NOT NULL AUTO_INCREMENT,
  `utilisateur_id` int NOT NULL,
  `prix_total` decimal(10,0) NOT NULL,
  `statut` enum('en attente', 'payé', 'expédié', 'livré', 'annulé') NOT NULL DEFAULT 'en attente',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_mise_jour` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`commande_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `images` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `produit_id` int NOT NULL,
  `url` varchar(255) NOT NULL,
  `alt_text` varchar(255) NOT NULL,
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `produits` (
  `produit_id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `prix` decimal(10,0) NOT NULL,
  `quantite` int NOT NULL,
  `categorie_id` int NOT NULL,
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_mise_jour` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`produit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `promotions` (
  `promotion_id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `type_reduction` enum('percentage', 'fixed') NOT NULL,
  `date_promotion` date NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`promotion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `utilisateurs` (
  `utilisateur_id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `adresse` text NOT NULL,
  `ville` varchar(100) NOT NULL,
  `pays` varchar(100) NOT NULL,
  `code_postal` varchar(20) NOT NULL,
  `date_inscription` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` enum('client', 'admin') NOT NULL DEFAULT 'client',
  PRIMARY KEY (`utilisateur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

COMMIT;