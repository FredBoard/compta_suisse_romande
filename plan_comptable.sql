-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 12 déc. 2024 à 09:47
-- Version du serveur : 10.6.17-MariaDB
-- Version de PHP : 8.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bill_v3`
--

-- --------------------------------------------------------

--
-- Structure de la table `r_plan_comptable`
--

CREATE TABLE `r_plan_comptable` (
  `id_compta` int(11) NOT NULL,
  `BID` int(11) NOT NULL,
  `compte` varchar(150) NOT NULL,
  `type` varchar(50) NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT 0,
  `bilan_A_P` varchar(250) NOT NULL DEFAULT 'na',
  `bilan_grp` varchar(250) NOT NULL DEFAULT 'na',
  `bilan_cat` varchar(250) NOT NULL DEFAULT 'na',
  `remarque` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Liste des charges et produits';

--
-- Déchargement des données de la table `r_plan_comptable`
--

INSERT INTO `r_plan_comptable` (`id_compta`, `BID`, `compte`, `type`, `used`, `bilan_A_P`, `bilan_grp`, `bilan_cat`, `remarque`) VALUES
(1, 1, 'Actifs', 'Actif', 0, 'na', 'na', 'na', ''),
(2, 1, 'Passif', 'Passif', 0, 'na', 'na', 'na', ''),
(3, 1, 'Chiffre d\'affaires résultant des ventes et des prestations de services', 'Produit', 0, 'na', 'na', 'na', ''),
(4, 1, 'Charges de matériel, de marchandises et de prestations de tiers', 'Charge', 0, 'na', 'na', 'na', ''),
(5, 1, 'Charges de personnel', 'Charge', 0, 'na', 'na', 'na', ''),
(6, 1, 'Autres charges d\'exploitation, Amortissements et ajustement de valeur, Résultat financier', 'Charge', 0, 'na', 'na', 'na', ''),
(7, 1, 'Résultat des activités annexes d\'exploitation', 'Résultat', 0, 'na', 'na', 'na', ''),
(8, 1, 'Résultats extraordinaires et hors exploitation', 'Résultat', 0, 'na', 'na', 'na', ''),
(9, 1, 'Clôture', 'Clôture', 0, 'na', 'na', 'na', ''),
(10, 1, 'Actifs circulants', 'Actif', 0, 'na', 'na', 'na', ''),
(14, 1, 'Actifs immobilisés', 'Actif', 0, 'na', 'na', 'na', ''),
(20, 1, 'Dettes à court terme', 'Passif', 0, 'na', 'na', 'na', ''),
(24, 1, 'Dettes à long terme', 'Passif', 0, 'na', 'na', 'na', ''),
(28, 1, 'Capital propre (raisons individuelles)', 'Passif', 0, 'na', 'na', 'na', ''),
(100, 1, 'Liquidités', 'Actif', 0, 'na', 'na', 'na', ''),
(106, 1, 'Avoirs à court terme cotés en bourse', 'Actif', 0, 'na', 'na', 'na', ''),
(110, 1, 'Créances résultant de livraisons et prestations', 'Actif', 0, 'na', 'na', 'na', ''),
(114, 1, 'Autres créances à court terme', 'Actif', 0, 'na', 'na', 'na', ''),
(120, 1, 'Stocks et prestations non facturées', 'Actif', 0, 'na', 'na', 'na', ''),
(130, 1, 'Compte de régularisation de l\'actif', 'Actif', 0, 'na', 'na', 'na', ''),
(140, 1, 'Immobilisations financières', 'Actif', 0, 'na', 'na', 'na', ''),
(148, 1, 'Participations', 'Actif', 0, 'na', 'na', 'na', ''),
(150, 1, 'Immobilisations corporelles meubles', 'Actif', 0, 'na', 'na', 'na', ''),
(160, 1, 'Immobilisations corporelles immeubles', 'Actif', 0, 'na', 'na', 'na', ''),
(170, 1, 'Immobilisations incorporelles', 'Actif', 0, 'na', 'na', 'na', ''),
(180, 1, 'Capital non versé : capital social, capital de fondation', 'Actif', 0, 'na', 'na', 'na', ''),
(200, 1, 'Dettes à court terme résultant d\'achats et de prestations de services', 'Passif', 0, 'na', 'na', 'na', ''),
(210, 1, 'Dettes à court terme rémunérés', 'Passif', 0, 'na', 'na', 'na', ''),
(220, 1, 'Autres dettes à court terme', 'Passif', 0, 'na', 'na', 'na', ''),
(230, 1, 'Passifs de régularisation et provisions à court terme', 'Passif', 0, 'na', 'na', 'na', ''),
(240, 1, 'Dettes à long terme rémunérées', 'Passif', 0, 'na', 'na', 'na', ''),
(250, 1, 'Autres dettes à long terme', 'Passif', 0, 'na', 'na', 'na', ''),
(260, 1, 'Provisions à long termes et provisions légales', 'Passif', 0, 'na', 'na', 'na', ''),
(280, 1, 'Capital social ou capital de fondation', 'Passif', 0, 'na', 'na', 'na', ''),
(290, 1, 'Réserves / bénéfices et pertes', 'Passif', 0, 'na', 'na', 'na', ''),
(1000, 1, 'Caisse', 'Actif', 1, 'ACTIF', 'Actifs circulants', 'Liquidités', ''),
(1020, 1, 'Banque Postfinance en CHF', 'Actif', 1, 'ACTIF', 'Actifs circulants', 'Liquidités', ''),
(1021, 1, 'Banque Postfinance en USD', 'Actif', 0, 'ACTIF', 'Actifs circulants', 'Liquidités', ''),
(1022, 1, 'Banque Postfinance en EURO', 'Actif', 0, 'ACTIF', 'Actifs circulants', 'Liquidités', ''),
(1060, 1, 'Titres', 'Actif', 0, 'ACTIF', 'Actifs circulants', 'Avoirs à court terme cotés en bourse', ''),
(1069, 1, 'Ajustement de la valeur des titres', 'Actif', 0, 'ACTIF', 'Actifs circulants', 'Avoirs à court terme cotés en bourse', ''),
(1100, 1, 'Créances provenant de livraisons et de prestations (Débiteurs)', 'Actif', 1, 'ACTIF', 'Actifs circulants', 'Créances résultant de livraisons et prestations', 'Factures envoyée chez le client mais pas encore payées'),
(1109, 1, 'Ducroire', 'Actif', 0, 'ACTIF', 'Actifs circulants', 'Créances résultant de livraisons et prestations', ''),
(1110, 1, 'Créances résultant de livr. et prest. envers les sociétés du groupe', 'Actif', 0, 'ACTIF', 'Actifs circulants', 'Créances résultant de livraisons et prestations', ''),
(1140, 1, 'Avances et prêts', 'Actif', 1, 'ACTIF', 'Actifs circulants', 'Autres créances à court terme', ''),
(1149, 1, 'Ajustement de la valeur des avances et des prêts', 'Actif', 0, 'ACTIF', 'Actifs circulants', 'Autres créances à court terme', ''),
(1170, 1, 'Impôt préalable: TVA s/matériel, marchandises, prestations, et énergie, classe 4', 'Actif', 0, 'ACTIF', 'Actifs circulants', 'Autres créances à court terme', ''),
(1171, 1, 'Impôt préalable: TVA s/investissements et autres charges d\'exploitation, classes 1 et 5/8', 'Actif', 0, 'ACTIF', 'Actifs circulants', 'Autres créances à court terme', ''),
(1176, 1, 'Impôt anticipé', 'Actif', 0, 'ACTIF', 'Actifs circulants', 'Autres créances à court terme', ''),
(1180, 1, 'Créances envers les assurances sociales et institutions de prévoyance', 'Actif', 0, 'ACTIF', 'Actifs circulants', 'Autres créances à court terme', ''),
(1189, 1, 'Impôt à la source', 'Actif', 0, 'ACTIF', 'Actifs circulants', 'Autres créances à court terme', ''),
(1190, 1, 'Autres créances à court terme', 'Actif', 0, 'ACTIF', 'Actifs circulants', 'Autres créances à court terme', ''),
(1199, 1, 'Ajustement de la valeur des créances à court terme', 'Actif', 0, 'ACTIF', 'Actifs circulants', 'Autres créances à court terme', ''),
(1200, 1, 'Stocks', 'Actif', 0, 'ACTIF', 'Actifs circulants', 'Stocks et prestations non facturées', ''),
(1210, 1, 'Matières premières', 'Actif', 0, 'ACTIF', 'Actifs circulants', 'Stocks et prestations non facturées', ''),
(1220, 1, 'Matières auxiliaires', 'Actif', 0, 'ACTIF', 'Actifs circulants', 'Stocks et prestations non facturées', ''),
(1230, 1, 'Matières consommables', 'Actif', 1, 'ACTIF', 'Actifs circulants', 'Stocks et prestations non facturées', ''),
(1250, 1, 'Marchandises en consignation', 'Actif', 0, 'ACTIF', 'Actifs circulants', 'Stocks et prestations non facturées', ''),
(1260, 1, 'Stocks de produits finis', 'Actif', 0, 'ACTIF', 'Actifs circulants', 'Stocks et prestations non facturées', ''),
(1270, 1, 'Produit en cours de fabrication', 'Actif', 0, 'ACTIF', 'Actifs circulants', 'Stocks et prestations non facturées', ''),
(1280, 1, 'Travaux en cours', 'Actif', 1, 'ACTIF', 'Actifs circulants', 'Stocks et prestations non facturées', ''),
(1300, 1, 'Actifs de régularisation', 'Actif', 1, 'ACTIF', 'Actifs circulants', 'Compte de régularisation de l\'actif', 'https://www.youtube.com/watch?v=ZBi7G9jmGHk je paye une facture d\'avance pour l\'anneé prochaine.'),
(1300, 2, 'Actifs de régularisation', 'Actif', 0, 'ACTIF', 'Actifs circulants', 'Compte de régularisation de l’actif', ''),
(1301, 1, 'Produits à recevoir', 'Actif', 1, 'ACTIF', 'Actifs circulants', 'Compte de régularisation de l\'actif', ''),
(1400, 1, 'Titres de l\'actif immobilisé', 'Actif', 0, 'ACTIF', 'Actifs immobilisés', 'Immobilisations financières', ''),
(1409, 1, 'Ajustement de la valeur des titres', 'Actif', 0, 'ACTIF', 'Actifs immobilisés', 'Immobilisations financières', ''),
(1440, 1, 'Prêts', 'Actif', 0, 'ACTIF', 'Actifs immobilisés', 'Immobilisations financières', ''),
(1441, 1, 'Hypothèques', 'Actif', 0, 'ACTIF', 'Actifs immobilisés', 'Immobilisations financières', ''),
(1449, 1, 'Ajustement de la valeur des créances à long terme', 'Actif', 0, 'ACTIF', 'Actifs immobilisés', 'Immobilisations financières', ''),
(1480, 1, 'Participations', 'Actif', 0, 'ACTIF', 'Actifs immobilisés', 'Participations', ''),
(1489, 1, 'Ajustement de la valeur des participations', 'Actif', 0, 'ACTIF', 'Actifs immobilisés', 'Participations', ''),
(1500, 1, 'Machines et appareils', 'Actif', 1, 'ACTIF', 'Actifs immobilisés', 'Immobilisations corporelles meubles', ''),
(1509, 1, 'Ajustement de la valeur des machines et appareils', 'Actif', 1, 'ACTIF', 'Actifs immobilisés', 'Immobilisations corporelles meubles', ''),
(1510, 1, 'Mobilier et installations', 'Actif', 0, 'ACTIF', 'Actifs immobilisés', 'Immobilisations corporelles meubles', ''),
(1519, 1, 'Ajustement de la valeur du mobilier et des installations', 'Actif', 0, 'ACTIF', 'Actifs immobilisés', 'Immobilisations corporelles meubles', ''),
(1520, 1, 'Machines de bureau', 'Actif', 0, 'ACTIF', 'Actifs immobilisés', 'Immobilisations corporelles meubles', ''),
(1521, 1, 'Infrastructures informatiques', 'Actif', 0, 'ACTIF', 'Actifs immobilisés', 'Immobilisations corporelles meubles', ''),
(1522, 1, 'Système de communication', 'Actif', 0, 'ACTIF', 'Actifs immobilisés', 'Immobilisations corporelles meubles', ''),
(1525, 1, 'Appareils électroniques de mesure et de contrôle', 'Actif', 0, 'ACTIF', 'Actifs immobilisés', 'Immobilisations corporelles meubles', 'https://www.lpg-fiduciaire-de-suisse.ch/fr/publications/comptabilite/plan-comptable-pour-les-entreprises-suisses'),
(1529, 1, 'Ajustement de la valeur des machines de bureau, inf. et syst. comm.', 'Actif', 0, 'ACTIF', 'Actifs immobilisés', 'Immobilisations corporelles meubles', ''),
(1530, 1, 'Véhicules (Automobiles)', 'Actif', 0, 'ACTIF', 'Actifs immobilisés', 'Immobilisations corporelles meubles', ''),
(1539, 1, 'Ajustement de la valeur des véhicules', 'Actif', 0, 'ACTIF', 'Actifs immobilisés', 'Immobilisations corporelles meubles', ''),
(1540, 1, 'Outillages et appareils', 'Actif', 0, 'ACTIF', 'Actifs immobilisés', 'Immobilisations corporelles meubles', ''),
(1549, 1, 'Ajustement de la valeur des outillages et appareils', 'Actif', 0, 'ACTIF', 'Actifs immobilisés', 'Immobilisations corporelles meubles', ''),
(1600, 1, 'Immeubles d\'exploitation', 'Actif', 0, 'ACTIF', 'Actifs immobilisés', 'Immobilisations corporelles immeubles', ''),
(1609, 1, 'Ajustement de la valeur des immeubles d\'exploitation', 'Actif', 0, 'ACTIF', 'Actifs immobilisés', 'Immobilisations corporelles immeubles', ''),
(1700, 1, 'Brevets, know-how, licences, droits, développement', 'Actif', 0, 'ACTIF', 'Actifs immobilisés', 'Immobilisations incorporelles', ''),
(1709, 1, 'Ajustement de la valeur des brevets, know-how, licences, droits, dév.', 'Actif', 0, 'ACTIF', 'Actifs immobilisés', 'Immobilisations incorporelles', ''),
(1770, 1, 'Goodwill', 'Actif', 0, 'ACTIF', 'Actifs immobilisés', 'Immobilisations incorporelles', ''),
(1779, 1, 'Ajustement de la valeur des goodwill', 'Actif', 0, 'ACTIF', 'Actifs immobilisés', 'Immobilisations incorporelles', ''),
(1800, 1, 'Frais de fondation', 'Actif', 0, 'ACTIF', 'Actifs immobilisés', 'Capital non versé : capital social, capital de fondation', 'https://www.lpg-fiduciaire-de-suisse.ch/fr/publications/comptabilite/plan-comptable-pour-les-entreprises-suisses'),
(1850, 1, 'Capital de fondation non versé', 'Actif', 1, 'ACTIF', 'Actifs immobilisés', 'Capital non versé : capital social, capital de fondation', ''),
(2000, 1, 'Dettes résultant d\'achats et de prestation de services (créanciers)', 'Passif', 0, 'PASSIF', 'Dettes à court terme', 'Dettes à court terme résultant d\'achats et de prestations de services', ''),
(2030, 1, 'Acomptes de clients', 'Passif', 0, 'PASSIF', 'Dettes à court terme', 'Dettes à court terme résultant d\'achats et de prestations de services', ''),
(2050, 1, 'Dettes résultant d\'achats et de prestations de services envers des sociétés du groupe', 'Passif', 0, 'PASSIF', 'Dettes à court terme', 'Dettes à court terme résultant d\'achats et de prestations de services', ''),
(2100, 1, 'Dettes bancaires', 'Passif', 0, 'PASSIF', 'Dettes à court terme', 'Dettes à court terme rémunérés', ''),
(2120, 1, 'Engagements de financement par leasing', 'Passif', 0, 'PASSIF', 'Dettes à court terme', 'Dettes à court terme rémunérés', ''),
(2140, 1, 'Autres dettes à court terme rémunérées', 'Passif', 0, 'PASSIF', 'Dettes à court terme', 'Dettes à court terme rémunérés', ''),
(2200, 1, 'TVA due', 'Passif', 0, 'PASSIF', 'Dettes à court terme', 'Autres dettes à court terme', ''),
(2201, 1, 'Décompte TVA', 'Passif', 0, 'PASSIF', 'Dettes à court terme', 'Autres dettes à court terme', ''),
(2206, 1, 'Impôt anticipé dû', 'Passif', 0, 'PASSIF', 'Dettes à court terme', 'Autres dettes à court terme', ''),
(2208, 1, 'Impôts directs', 'Passif', 0, 'PASSIF', 'Dettes à court terme', 'Autres dettes à court terme', ''),
(2210, 1, 'Autres dettes à court terme', 'Passif', 0, 'PASSIF', 'Dettes à court terme', 'Autres dettes à court terme', ''),
(2261, 1, 'Dividendes', 'Passif', 0, 'PASSIF', 'Dettes à court terme', 'Autres dettes à court terme', ''),
(2270, 1, 'Assurances sociales et institutions de prévoyance', 'Passif', 0, 'PASSIF', 'Dettes à court terme', 'Autres dettes à court terme', ''),
(2279, 1, 'Impôt à la source', 'Passif', 0, 'PASSIF', 'Dettes à court terme', 'Autres dettes à court terme', ''),
(2300, 1, 'Charges à payer', 'Passif', 1, 'PASSIF', 'Dettes à court terme', 'Passifs de régularisation et provisions à court terme', ''),
(2301, 1, 'Produits encaissés d\'avance', 'Passif', 0, 'PASSIF', 'Dettes à court terme', 'Passifs de régularisation et provisions à court terme', ''),
(2330, 1, 'Provisions à court terme', 'Passif', 0, 'PASSIF', 'Dettes à court terme', 'Passifs de régularisation et provisions à court terme', ''),
(2400, 1, 'Dettes bancaires', 'Passif', 0, 'PASSIF', 'Dettes à long terme', 'Dettes à long terme rémunérées', ''),
(2420, 1, 'Engagements de financement par leasing', 'Passif', 0, 'PASSIF', 'Dettes à long terme', 'Dettes à long terme rémunérées', ''),
(2430, 1, 'Emprunts obligataires', 'Passif', 0, 'PASSIF', 'Dettes à long terme', 'Dettes à long terme rémunérées', ''),
(2450, 1, 'Emprunts', 'Passif', 0, 'PASSIF', 'Dettes à long terme', 'Dettes à long terme rémunérées', ''),
(2451, 1, 'Hypothèques', 'Passif', 0, 'PASSIF', 'Dettes à long terme', 'Dettes à long terme rémunérées', ''),
(2500, 1, 'Autres dettes à long terme', 'Passif', 0, 'PASSIF', 'Dettes à long terme', 'Autres dettes à long terme', ''),
(2600, 1, 'Provisions', 'Passif', 0, 'PASSIF', 'Dettes à long terme', 'Provisions à long termes et provisions légales', ''),
(2800, 1, 'Capital', 'Passif', 1, 'PASSIF', 'Fonds propres', 'Capital social ou capital de fondation', ''),
(2810, 1, 'Apport de capital / prélèvements sur capital, commanditaire A', 'Passif', 0, 'PASSIF', 'Fonds propres', 'Capital social ou capital de fondation', ''),
(2820, 1, 'Apports de capital / prélèvements sur capital', 'Passif', 0, 'PASSIF', 'Fonds propres', 'Capital social ou capital de fondation', ''),
(2831, 1, 'Bénéfice / perte de l\'exercice, associé A', 'Passif', 0, 'PASSIF', 'Fonds propres', 'Capital social ou capital de fondation', ''),
(2850, 1, 'Compte privé', 'Passif', 0, 'PASSIF', 'Fonds propres', 'Capital social ou capital de fondation', ''),
(2891, 1, 'Bénéfice / perte de l\'exercice', 'Passif', 0, 'PASSIF', 'Fonds propres', 'Capital social ou capital de fondation', ''),
(2900, 1, 'Réserves légales issues du capital', 'Passif', 0, 'PASSIF', 'Fonds propres', 'Réserves / bénéfices et pertes', ''),
(2930, 1, 'Réserves sur participations propres au capital', 'Passif', 0, 'PASSIF', 'Fonds propres', 'Réserves / bénéfices et pertes', ''),
(2940, 1, 'Réserves d\'évaluation', 'Passif', 0, 'PASSIF', 'Fonds propres', 'Réserves / bénéfices et pertes', ''),
(2950, 1, 'Réserves légales issues du bénéfice', 'Passif', 0, 'PASSIF', 'Fonds propres', 'Réserves / bénéfices et pertes', ''),
(2960, 1, 'Réserves libres', 'Passif', 0, 'PASSIF', 'Fonds propres', 'Réserves / bénéfices et pertes', ''),
(2970, 1, 'Bénéfice / perte reporté', 'Passif', 0, 'PASSIF', 'Fonds propres', 'Réserves / bénéfices et pertes', ''),
(2979, 1, 'Bénéfice / perte de l\'exercice', 'Passif', 0, 'PASSIF', 'Fonds propres', 'Réserves / bénéfices et pertes', ''),
(2980, 1, 'Propres actions, parts sociales, droits de participations (poste négatif)', 'Passif', 0, 'PASSIF', 'Fonds propres', 'Réserves / bénéfices et pertes', ''),
(2990, 1, 'Résultat reporté', 'Passif', 0, 'PASSIF', 'Fonds propres', 'Réserves / bénéfices et pertes', ''),
(3000, 1, 'Ventes de produits fabriqués', 'Produit', 0, 'Chiffre d\'affaires résultant des ventes', 'Chiffre d\'affaires résultant des ventes', 'na', ''),
(3200, 1, 'Ventes de marchandises', 'Produit', 0, 'Chiffre d\'affaires résultant des ventes', 'Chiffre d\'affaires résultant des ventes', 'na', ''),
(3600, 1, 'Autres ventes et prestations de services', 'Produit', 0, 'Chiffre d\'affaires résultant des ventes', 'Chiffre d\'affaires résultant des ventes', 'na', ''),
(3601, 1, 'Ventes et prestations de services', 'Produit', 1, 'Chiffre d\'affaires résultant des ventes', 'Chiffre d\'affaires résultant des ventes', 'na', ''),
(3602, 1, 'Ventes et prestations de services pour la Commune de Corgémont', 'Produit', 1, 'Chiffre d\'affaires résultant des ventes', 'Chiffre d\'affaires résultant des ventes', 'na', ''),
(3603, 1, 'Ventes et prestations de services pour la P\'tite Julotte', 'Produit', 1, 'Chiffre d\'affaires résultant des ventes', 'Chiffre d\'affaires résultant des ventes', 'na', ''),
(3604, 1, 'Ventes et prestations de services pour Inomed Technology SA', 'Produit', 1, 'Chiffre d\'affaires résultant des ventes', 'Chiffre d\'affaires résultant des ventes', 'na', ''),
(3605, 1, 'Ventes et prestations de services pour IndustrialPark Sàrl', 'Produit', 1, 'Chiffre d\'affaires résultant des ventes', 'Chiffre d\'affaires résultant des ventes', 'na', ''),
(3700, 1, 'Prestations propres', 'Produit', 0, 'Chiffre d\'affaires résultant des ventes', 'Chiffre d\'affaires résultant des ventes', 'na', ''),
(3710, 1, 'Consommations propres', 'Produit', 0, 'Chiffre d\'affaires résultant des ventes', 'Chiffre d\'affaires résultant des ventes', 'na', ''),
(3800, 1, 'Escompte', 'Charge', 0, 'Chiffre d\'affaires résultant des ventes', 'Déductions sur ventes', 'na', ''),
(3805, 1, 'Pertes sur clients, variation du ducroire', 'Charge', 0, 'Chiffre d\'affaires résultant des ventes', 'Déductions sur ventes', 'na', ''),
(3900, 1, 'Variation des stocks de produits semi-finis', 'Produit / Charge', 0, 'Chiffre d\'affaires résultant des ventes', 'Variation de stocks', 'na', ''),
(3901, 1, 'Variation des stocks de produits finis', 'Produit / Charge', 0, 'Chiffre d\'affaires résultant des ventes', 'Variation de stocks', 'na', ''),
(3940, 1, 'Variation de la valeur des prestations non facturées', 'Produit / Charge', 0, 'Chiffre d\'affaires résultant des ventes', 'Variation de stocks', 'na', ''),
(4000, 1, 'Charges de matériel de l\'atelier', 'Charge', 0, 'Charges d\'achats', 'Charges d\'achats', 'na', ''),
(4200, 1, 'Achats de marchandises destinées à la revente', 'Charge', 1, 'Charges d\'achats', 'Charges d\'achats', 'na', ''),
(4300, 1, 'Achats', 'Charge', 0, 'Charges d\'achats', 'Charges d\'achats', 'na', ''),
(4320, 1, 'Achat de matériel pour atelier/laboratoire ', 'Charge', 1, 'Charges d\'achats', 'Charges d\'achats', 'na', ''),
(4400, 1, 'Prestations / travaux de tiers', 'Charge', 0, 'Charges d\'achats', 'Charges d\'achats', 'na', ''),
(4500, 1, 'Charges d\'énergie pour l\'exploitation', 'Charge', 0, 'Charges d\'achats', 'Charges d\'achats', 'na', ''),
(4900, 1, 'Déductions sur les charges', 'Produit', 0, 'Produits d\'achats', 'Déductions obtenues sur les charges d\'achats', 'na', ''),
(5000, 1, 'Salaires', 'Charge', 1, 'Charges de personnel', 'Charges de personnel', 'na', ''),
(5700, 1, 'Charges sociales AVS', 'Charge', 1, 'Charges de personnel', 'Assurances sociales', 'na', ''),
(5800, 1, 'Autres charges du personnel', 'Charge', 0, 'Charges de personnel', 'Autres charges du personnel', 'na', ''),
(5900, 1, 'Charges de personnels temporaires', 'Charge', 0, 'Charges de personnel', 'na', 'na', ''),
(6000, 1, 'Charges de locaux ( Loyer )', 'Charge', 0, 'Autres charges d\'exploitation', 'na', 'na', ''),
(6100, 1, 'Entretien, réparations et remplacement des inst. servant à l\'exploitation', 'Charge', 0, 'Autres charges d\'exploitation', 'na', 'na', ''),
(6105, 1, 'Leasing immobilisations corporelles meubles', 'Charge', 0, 'Autres charges d\'exploitation', 'na', 'na', ''),
(6200, 1, 'Charges de vhc et de transport', 'Charge', 0, 'Autres charges d\'exploitation', 'na', 'na', ''),
(6210, 1, 'Charges téléphone et internet', 'Charge', 1, 'Autres charges d\'exploitation', 'na', 'na', 'Wingo, Téléphone'),
(6220, 1, 'Charges véhicules (Réparation, service et nettoyage)', 'Charge', 1, 'Autres charges d\'exploitation', 'na', 'na', 'https://www.lpg-fiduciaire-de-suisse.ch/fr/publications/comptabilite/plan-comptable-pour-les-entreprises-suisses'),
(6230, 1, 'Charges véhicules (Carburant)', 'Charge', 1, 'Autres charges d\'exploitation', 'na', 'na', 'https://www.lpg-fiduciaire-de-suisse.ch/fr/publications/comptabilite/plan-comptable-pour-les-entreprises-suisses'),
(6240, 1, 'Charges véhicules (Assurances)', 'Charge', 1, 'Autres charges d\'exploitation', 'na', 'na', 'https://www.lpg-fiduciaire-de-suisse.ch/fr/publications/comptabilite/plan-comptable-pour-les-entreprises-suisses'),
(6260, 1, 'Leasing et location de véhicules', 'Charge', 0, 'Autres charges d\'exploitation', 'na', 'na', ''),
(6270, 1, 'Part privées charge de véhicules', 'Charge', 0, 'Autres charges d\'exploitation', 'na', 'na', ''),
(6300, 1, 'Assurances-choses, droits, taxes, autorisations', 'Charge', 0, 'Autres charges d\'exploitation', 'na', 'na', ''),
(6400, 1, 'Charges d\'énergie et évacuation des déchets', 'Charge', 1, 'Autres charges d\'exploitation', 'na', 'na', 'Sacs Müve'),
(6500, 1, 'Charges d\'administration et d\'informatique', 'Charge', 1, 'Autres charges d\'exploitation', 'na', 'na', 'Affranchissements dédouanements'),
(6570, 1, 'Charges et leasing d\'informatique', 'Charge', 0, 'Autres charges d\'exploitation', 'na', 'na', ''),
(6600, 1, 'Publicité', 'Charge', 0, 'Autres charges d\'exploitation', 'na', 'na', ''),
(6601, 1, 'Promotion de l\'entreprise', 'Charge', 1, 'Autres charges d\'exploitation', 'na', 'na', 'Par ex Restaurants'),
(6700, 1, 'Autres charges d\'exploitation', 'Charge', 0, 'Autres charges d\'exploitation', 'na', 'na', ''),
(6791, 1, 'Parts privées aux frais généraux', 'Charge', 0, 'Autres charges d\'exploitation', 'na', 'na', ''),
(6800, 1, 'Amortissement et ajustement de valeur des postes sur immobilisations corporelles', 'Charge', 0, 'Autres charges d\'exploitation', 'na', 'na', ''),
(6900, 1, 'Charges financières', 'Charge', 0, 'Autres charges d\'exploitation', 'na', 'na', ''),
(6940, 1, 'Frais bancaire', 'Charge', 1, 'Autres charges d\'exploitation', 'na', 'na', 'Frais Postfinance'),
(6950, 1, 'Produits financiers', 'Produit', 0, 'Autres charges d\'exploitation', 'na', 'na', ''),
(7000, 1, 'Produits accessoires', 'Produit', 0, 'Résultat des activités annexes d\'exploitation', 'Activités accessoires (portefeuille de titres)', 'na', ''),
(7010, 1, 'Charges accessoires', 'Charge', 0, 'Résultat des activités annexes d\'exploitation', 'Activités accessoires (portefeuille de titres)', 'na', ''),
(7500, 1, 'Produits des immeubles d\'exploitation', 'Produit', 0, 'Résultat des activités annexes d\'exploitation', 'Résultat des immeubles', 'na', ''),
(7510, 1, 'Charges des immeubles d\'exploitation', 'Charge', 0, 'Résultat des activités annexes d\'exploitation', 'Résultat des immeubles', 'na', ''),
(8000, 1, 'Charges hors exploitation', 'Charge', 0, 'Résultat exceptionnels et hors exploitation', 'na', 'na', ''),
(8100, 1, 'Produits hors exploitation', 'Produit', 0, 'Résultat exceptionnels et hors exploitation', 'na', 'na', ''),
(8500, 1, 'Charges extraordinaires, exceptionnelles ou hors période', 'Charge', 0, 'Résultat exceptionnels et hors exploitation', 'na', 'na', ''),
(8510, 1, 'Produits extraordinaires, exceptionnels ou hors période', 'Produit', 0, 'Résultat exceptionnels et hors exploitation', 'na', 'na', ''),
(8900, 1, 'Impôts directs', 'Charge', 0, 'Résultat exceptionnels et hors exploitation', 'na', 'na', ''),
(9000, 1, 'Compte de résultat', 'Produit / Charge', 1, 'Clôture', 'na', 'na', ''),
(9010, 1, 'Compte de résultat II', 'Produit / Charge', 1, 'Clôture', 'na', 'na', ''),
(9200, 1, 'Bénéfice / perte de l\'exercice', 'Produit / Charge', 1, 'Clôture', 'na', 'na', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `r_plan_comptable`
--
ALTER TABLE `r_plan_comptable`
  ADD UNIQUE KEY `ID_BID` (`id_compta`,`BID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
