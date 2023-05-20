-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: streaming
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `artiste`
--

DROP TABLE IF EXISTS `artiste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artiste` (
  `ID_artiste` int NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Prénom` varchar(50) DEFAULT NULL,
  `Nationalité` varchar(50) DEFAULT NULL,
  `Date_naissance` date DEFAULT NULL,
  `Fonction` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_artiste`),
  CONSTRAINT `profession` CHECK ((`Fonction` in (_utf8mb4'Acteur',_utf8mb4'Réalisateur')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artiste`
--

LOCK TABLES `artiste` WRITE;
/*!40000 ALTER TABLE `artiste` DISABLE KEYS */;
INSERT INTO `artiste` VALUES (1,'Marques Duatre','Paul','France','1995-12-08','Réalisateur'),(2,'Dolan','Xavier','Québec','1989-03-20','Réalisateur'),(3,'Chapelle','Damien','Belgique','1988-12-08','Réalisateur'),(4,'Seraille','Leonor','France','1989-06-16','Réalisateur'),(5,'mysius','Léa','France','1989-04-04','Réalisateur'),(6,'Bunel','Marie','France','1961-05-27','Acteur'),(7,'Durand','Tom','France','1998-03-16','Acteur'),(8,'Morvan','Quentin','Fance','2001-06-24','Acteur'),(9,'Barbe','Thierry','France','1965-11-05','Acteur'),(10,'Dorval','Anne','Québec','1960-11-08','Acteur'),(11,'Roy','Lise','Québec','1953-12-08','Acteur'),(12,'Clément','Suzanne','Québec','1969-05-12','Acteur'),(13,'Legend','John','Amérique','1978-12-28','Acteur'),(14,'Goodman','John','Amérique','1952-06-20','Acteur'),(15,'Foy','Claire','Angleterre','1964-04-16','Acteur'),(16,'Holland','André','Amérique','1979-12-28','Acteur'),(17,'Richard','Nathalie','France','1963-01-06','Acteur'),(18,'Ostaszewska','Maja','Pologne','1972-04-03','Acteur'),(19,'Merlant','Noémie','France','1988-11-27','Acteur'),(20,'Amalric','Mathieu','France','1965-10-25','Acteur'),(21,'Abita','Noée','France','1999-03-18','Acteur'),(22,'Gastambide','Frank','France','1978-10-31','Réalisateur'),(23,'Herrero','Fanny','France','1974-06-07','Réalisateur'),(24,'Gotesman','Igor','France','1986-01-20','Réalisateur'),(25,'Dong-hyeok','Hwang','Sud-Coréen','1971-05-21','Réalisateur'),(26,'Bruneau','Eric','Canada','1983-04-21','Acteur'),(27,'Boutella','Shirine','Algérie','1990-07-22','Acteur'),(28,'Gueye','Mariama','France','1989-10-15','Acteur'),(29,'Darmon','Gerard','France','1948-02-29','Acteur'),(30,'Yoo','Gong','Sud-Coréen','1979-07-10','Acteur');
/*!40000 ALTER TABLE `artiste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caracterise`
--

DROP TABLE IF EXISTS `caracterise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caracterise` (
  `ID_oeuvre` int NOT NULL,
  `ID_genre` int NOT NULL,
  PRIMARY KEY (`ID_oeuvre`,`ID_genre`),
  KEY `ID_catégorie` (`ID_genre`),
  CONSTRAINT `caracterise_ibfk_1` FOREIGN KEY (`ID_oeuvre`) REFERENCES `oeuvre` (`ID_oeuvre`),
  CONSTRAINT `caracterise_ibfk_2` FOREIGN KEY (`ID_genre`) REFERENCES `genre` (`ID_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracterise`
--

LOCK TABLES `caracterise` WRITE;
/*!40000 ALTER TABLE `caracterise` DISABLE KEYS */;
INSERT INTO `caracterise` VALUES (1,1),(5,1),(6,1),(7,1),(10,1),(16,1),(17,1),(2,2),(3,2),(4,2),(8,3),(13,3),(14,3),(11,4),(18,4),(19,4),(9,5),(12,5),(20,5),(15,6);
/*!40000 ALTER TABLE `caracterise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episode`
--

DROP TABLE IF EXISTS `episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `episode` (
  `Numéro_ep` int NOT NULL,
  `Titre_ep` varchar(50) DEFAULT NULL,
  `Durée_ep` int DEFAULT NULL,
  `Description_ep` text,
  `Numéro_1` int NOT NULL,
  PRIMARY KEY (`Numéro_ep`),
  KEY `Numéro_1` (`Numéro_1`),
  CONSTRAINT `episode_ibfk_1` FOREIGN KEY (`Numéro_1`) REFERENCES `saison` (`Numéro`),
  CONSTRAINT `episode_chk_1` CHECK ((`Durée_ep` > 0)),
  CONSTRAINT `episode_chk_2` CHECK ((`Durée_ep` > 0)),
  CONSTRAINT `episode_chk_3` CHECK ((`Durée_ep` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode`
--

LOCK TABLES `episode` WRITE;
/*!40000 ALTER TABLE `episode` DISABLE KEYS */;
INSERT INTO `episode` VALUES (1,'Buisiness Plan',27,'Les rêves de start-up de Joseph Hazan s\'écroulent une nouvelle fois, et son père le presse pour reprendre la boucherie familiale. Mais une information inattendue lui donne une soudaine d\'inspiration. ',4),(2,'Deal',30,'Quand son projet de coffee-shop se retrouve dans une impasse, Joseph se décarcasse pour remettre son business dans le droit chemin. Il reçoit l\'aide inattendue de l\'idole de son père, Enrico Macias. ',4),(3,'Les porcs d\'Amterdam',30,'À Amsterdam, Joseph et son père se réconcilient chaleureusement. Aure se prépare à prendre son vol pour Tokyo afin de rejoindre sa petite amie. Or, la situation dégénère lorsque Gérard se retrouve impliqué dans une bagarre avec des prostituées. ',4),(4,'Plantade',31,'Ludmyla est chargée de repiquer les boutures d\'Amsterdam, Aure se charge de la gestion de l\'affaire, Gérard doit retaper la boucherie et Joseph tente de trouver des fonds. Clémentine lui pose un nouvel ultimatum afin qu\'il respecte ses promesses. ',4),(5,'Pastraweed',31,'Dépassé par l\'ampleur des travaux, Gérard reçoit l\'aide inespérée d\'une experte de la décoration. À la campagne, les nouveaux voisins terrorisent involontairement la famille en venant à chaque fois sans prévenir. ',4),(6,'Terminus',27,'Un événement inattendu laisse la famille au bord de la faillite et l\'oblige à faire face à une criminelle impitoyable. Il vaut mieux prendre les devants avant que tout ne soit perdu. ',4),(7,'Le droit chemin',32,'Un an plus tard, l\'entreprise est en plein essor et la famille mène une vie très confortable. Malheureusement, en emmenant ses enfants au travail, Jo commet une erreur fatale qui va lui coûter cher. ',7),(8,'Bande rivale',38,'Jo conclut un accord avec Jaurès. Il a cinq jours pour convaincre sa famille d\'abandonner la vente de cannabis. Aure, de son côté, imagine un nouveau système de blanchiment d\'argent. ',7),(9,'Le bouillon',36,'Avec l\'arrivée du botaniste et Ludmila hors-jeu, Aure est obligée de se faire passer pour sa grand-mère. Gérard emmène Catherine rencontrer Enrico Macias. ',7),(10,'Dernier petit cadeau',29,'Une visite de Jaurès met la famille dans une situation délicate. Élodie lance un ultimatum à Aure alors que Olivier découvre que Clémentine les a manipulés. ',7),(11,'Exposé plein sud',34,'Tandis que Jo, Gérard et Olivier s\'adaptent à leur nouvel environnement, un homme de poigne exige un entretien avec Jaurès. Aïda tente de percer un secret de famille. ',7),(12,'Burrata',30,'Gérard trouve un moyen original de déjouer la sécurité de la prison, mais l\'entreprise prend une tournure inattendue. L\'enquête d\'Aïda révèle une grosse surprise. ',7),(13,'Plein nord',34,'Détenus loin de chez eux dans un mystérieux monastère, les Hazan rencontrent un nouveau baron de la drogue. Ils aggravent aussitôt une situation déjà peu prometteuse. ',8),(14,'Showtime',39,'En tentant désespérément de gagner du temps, Jo et Olive s\'embarquent dans une aventure stupéfiante. Pendant ce temps, Clem convainc Youssef de contacter un ancien co-détenu. ',8),(15,'Les dix commandements',39,'Après avoir persuadé Léonard de tester son nouveau produit, la famille doit trouver rapidement un moyen d\'en produire davantage. De son côté, Catherine se retrouve face à un dilemme. ',8),(16,'Boukha pour tout le monde',33,'Avec le sérum de vérité du Dr Cliff, les secrets de famille n\'en finissent pas de tomber. Un tuyau d\'Enrico permet à Aïda de monter une mission de sauvetage officielle. ',8),(17,'Comme par hasard',33,'Quand le sort s\'acharne, la famille se décourage. Une autre chance de jouer les héros se présente pour Clem et Youssef. De son côté, Catherine participe à un projet d\'évasion. ',8),(18,'Mazel tov',34,'Une urgence médicale place Clem et Youssef en position délicate. Pendant ce temps, Aure suit son instinct et entame une course effrénée vers la liberté. ',8),(19,'Un, deux, trois, soleil',60,'Ruiné et prêt à tout, Gi-hun accepte de participer à un jeu mystérieux. Mais dès la première épreuve, la promesse d\'argent facile fait place à l\'horreur.',5),(20,'Enfer',63,'Le groupe organise un vote pour décider s\'il continue ou abandonne l\'aventure. Mais la réalité du monde extérieur peut s\'avérer aussi impitoyable que le jeu ',5),(21,'L\'homme au parapluie',54,'Plusieurs joueurs passent à l\'épreuve suivante, aussi délicieuse que mortelle. Certain sont plus avantagés que les autres. Jun-ho réussit quant à lui s\'infiltrer.',5),(22,'L\'équipe avant tout',55,'Les joueurs forment des alliances. La nuit tombée, personne n\'est à l\'abri au dortoir. Pour la troisième épreuve, l\'équipe de Gi-hun doit penser de façon stratégique.',5),(23,'Un monde juste',52,'Gi-hun et son équipe se relaient pour monter la garde toute la nuit. Les hommes masqués rencontrent des ennuis dans leur propre camp de conspirateurs.',5),(24,'Gganbu',62,'Les joeurs se mettent par deux pour la quatrième épreuve. Gi-hun est aux prises avec le dilemme moral. Tandis que Swang-woo choisit de se préserver, Sae-byeok se livre.',5),(25,'VIP',58,'Les invités VIP sont acceuillis avec les honneurs aux premières loges du spectacle. La pression du cinquième match est tellement forte que certains joueurs craquent.',5),(26,'Leader',32,'Avant la dernières épreuve, la méfiance et le dégoût règnent parmi les finalistes. Jun-ho s\'enfuit, bien décidé à révéler les sombres dessous de la compétition. ',5),(27,'Jour de chance ',56,'La dernière manche constitue un test tout aussi cruel, mais cette fois, la conclusion repose entre les mains d\'un seul joueur. Le cerveau du jeu sort de l\'ombre...',5),(28,'Faut faire rire la France, mon frère!',44,'Nezir, humoriste fauché, pèse le pour et le contre d\'un nouveau boulot. Son amie Aïssa teste des anecdoctes osées et Bling, le propriétaire du club, se déchaîne sur scène.',3),(29,'Toucher le succès du doight',40,'La nouvelle notoriété d\'Aïssa provoque quelques tensions. Nezir et Bling s\'attellent à leur projet secret et Apolline s\'inscrit à une scène ouvert pour les débutants.',3),(30,'Le noir, ça va avec tout ',48,'Bling se voit offrir une chance d\'écrire pour la télé, Aïssa s\'inspire d\'une embrouille avec la police et Apolline demande à Nezir de l\'aider à peaufiner son spectacle.',3),(31,'Vas-y, Pistache',48,'Une belle opportunité place Aïssa devant un choix déchirant. Nezir jongle entre son job et une scène ouverte pour son quartier. De son côté, Apolline gagne en confiance.',3),(32,'Un tramway nommé Nezir',49,'Une mmésaventure rapproche Bling et Nezir. Aïssa doit faire face à une annonce imprévue et gérer un moment d\'antenne gênant. Les mensonges d\'Apolline la rattrapent.',3),(33,'Bonsoir, l\'Olympia',49,'Tandis qu\'Aïssa se prépare pour son show, Nezir élabore sa revanche sur Tifflot. Apolline traverse une lourde crise familliale et Bling commence à retrouver la gnaque.',3),(34,'Episode 1',30,'Clément, petit livreur de drogue, toujours accompagné de ses deux potes d\'enfance William et Brahim, rêve de devenir rappeur. Et une livraison en bas de Skyrock lui donne l\'occasion de s\'inviter dans l\'émission spéciale consacrée à Mastar.',2),(35,'Episode 2',32,'Le feat que Clément, alias Apash, a enregistré avec Mastar fait un tabac sur les sites de streaming et le jeune rappeur intéresse la maison de disque Oméga Music France. ',2),(36,'Episode 3',32,'Il est temps pour Apash de signer un contrat. Mais entre Mounir, son ancien producteur, qui règne sur les trafics de drogue de la cité et la maison de disque Oméga qui lui propose un très mauvais deal, le choix est difficile à faire...',2),(37,'Episode 4',31,'Soutenu par Mastar et produit par Omega, Apash commence l\'enregistrement de son album. Il est accompagné par Sno, le meilleur beatmaker du milieu. Mais alors que tout semble se passer pour le mieux, Mastar découvre que l\'équipe d\'Apash l\'a trahi. ',2),(38,'Episode 5',31,'Apash est en promo pour la sortie de son album. Mais sa rivalité avec Mastar occupe tout l\'espace médiatique et l\'empêche de parler de sa musique. Grâce à Inès, il parvient à être invité dans une grosse émission de télévision... ',2),(39,'Episode 6',30,'Apash a été humilié en direct à la télévision, et doit trouver un moyen de renverser cette situation. William lui propose de faire un concert surprise... ',2),(40,'Episode 7',28,'Alors que le succès d\'Apash est célébré lors de son propre Planète Rap sur Skyrock, Mastar repère un rappeur, Karnage, en prison, et lui fait une proposition...',2),(41,'Episode 8',27,'William a convaincu Apash de gérer leur tournée eux-mêmes sans la maison de disque. Ils doivent rassembler suffisamment d\'argent en faisant des showcases dans des chichas. Seulement un club pose problème : il est dans le quartier du rappeur Karnage.',2),(42,'Episode 9',30,'Un morceau de jeunesse de Clément subversif a fuité sur les réseaux. La polémique menace la tournée. En conflit avec Omega, William part en quête d\'une nouvelle maison de disque, tandis que Clément cherche une solution du côté de chez Mounir. ',2),(43,'Episode 10',30,'Clément, William et Brahim n\'ont que deux semaines pour remplir la salle de la seule date de tournée qui a été maintenue. Apash pense à faire un coup marketing avec une seule idée en tête : sauver sa jeune carrière.',2),(44,'Episode 11',38,'Cela fait maintenant un an qu\'Apash est mort; toujours dans le milieu du rap, William et Brahim, qui ont bénéficié du parrainage de Mastar et Sno, lancent une maison de disques pour rendre hommage à leur ami disparu. ',6),(45,'Episode 12',36,'En dépit de retours favorables sur les réseaux sociaux, Lalpha hésite à se lancer à nouveau dans la musique; William et Brahim redoublent d\'efforts pour convaincre la jeune femme de signer un contrat avec leur maison de disques.',6),(46,'Episode 13',36,'Lalpha est en studio pour enregistrer son premier album, avec la collaboration de Sno. Rapidement, des différends artistiques viennent compliquer leur travail. Au même moment, la sortie du film de Mastar provoque des incidents.',6),(47,'Episode 14',30,'Lalpha se rend à Marseille pour un nouveau clip; des menaces pèsent sur le tournage, qui pourrait bien être remis en question; en tant que patron de la maison Apash Music, William doit assurer la protection de son artiste.',6),(48,'Episode 15',30,'La notoriété de Lalpha atteint un niveau qui lui vaut enfin l\'attention des médias. La jeune femme, qui a longtemps tout fait pour garder de lourds secrets, va devoir maintenant assumer son passé. ',6),(49,'Episode 16',35,'Maintenant que son passé l\'a rattrapée, Lalpha se dit prête à abandonner l\'univers de la musique, mais avant toute chose, elle doit assurer la protection de sa famille, à présent vulnérable. ',6),(50,'Episode 17',34,'Bien décidée à ne plus se laisser faire, Lalpha élabore un audacieux stratagème pour revenir sur le devant de la scène musicale. La jeune rappeuse est plus déterminée et puissante que jamais.  ',6),(51,'Episode 18',29,'Persuadé de savoir qui a tué Apash, Brahim prend tous les risques pour le venger. Terriblement inquiet, William se lance à sa recherche pour empêcher qu\'une nouvelle tragédie n\'ait lieu. ',6),(52,'Episode 19',45,'Tout est fin prêt pour le lancement de l\'album de Lalpha. Mais les menaces à l\'encontre de la jeune rappeuse ne se sont pas complètement éteintes. Lalpha doit rester sur ses gardes. ',6),(53,'Episode 1',20,'Saison 1 episode 1',1),(54,'Episode 2',21,'Saison 1 episode 2',1),(55,'Episode 3',20,'Saison 1 episode 3',1),(56,'Episode 4',21,'Saison 1 episode 4',1),(57,'Episode 5',21,'Saison 1 episode 5',1);
/*!40000 ALTER TABLE `episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film` (
  `ID_film` int NOT NULL,
  `Durée` int DEFAULT NULL,
  PRIMARY KEY (`ID_film`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES (0,0),(10,25),(11,13),(12,22),(13,16),(20,96),(21,102),(22,139),(30,128),(31,105),(32,141),(40,98),(41,99),(50,105),(51,135),(52,96);
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `ID_genre` int NOT NULL,
  `Libellé` varchar(50) DEFAULT NULL,
  `Description` text,
  PRIMARY KEY (`ID_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Dramatique','Oeuvre qui désigne le drame, les émotions pouvant amener à la tragédie'),(2,'Fiction','Oeuvre construite sur la base d\'un monde imaginaire '),(3,'Romance','Oeuvre qui développe le sentiment de l\'amour'),(4,'Comédie','Oeuvre qui suscite le rire'),(5,'Thriller','Oevure qui provoque des sensation fortes '),(6,'Action','Oeuvre qui met en scène une succession de scènes spectaculaires');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jouer`
--

DROP TABLE IF EXISTS `jouer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jouer` (
  `ID_artiste` int NOT NULL,
  `ID_oeuvre` int NOT NULL,
  PRIMARY KEY (`ID_artiste`,`ID_oeuvre`),
  KEY `ID_oeuvre` (`ID_oeuvre`),
  CONSTRAINT `jouer_ibfk_1` FOREIGN KEY (`ID_artiste`) REFERENCES `artiste` (`ID_artiste`),
  CONSTRAINT `jouer_ibfk_2` FOREIGN KEY (`ID_oeuvre`) REFERENCES `oeuvre` (`ID_oeuvre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jouer`
--

LOCK TABLES `jouer` WRITE;
/*!40000 ALTER TABLE `jouer` DISABLE KEYS */;
INSERT INTO `jouer` VALUES (6,1),(7,2),(8,3),(9,4),(10,5),(11,6),(12,7),(13,8),(14,9),(15,10),(17,11),(18,12),(19,13),(20,14),(21,15),(26,16),(27,17),(28,18),(29,19),(30,20);
/*!40000 ALTER TABLE `jouer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oeuvre`
--

DROP TABLE IF EXISTS `oeuvre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oeuvre` (
  `ID_oeuvre` int NOT NULL,
  `Titre` varchar(50) NOT NULL,
  `Année` int DEFAULT NULL,
  `Catégorie` varchar(50) DEFAULT NULL,
  `Synopsis` text,
  `ID_film` int NOT NULL,
  `ID_serie` int NOT NULL,
  PRIMARY KEY (`ID_oeuvre`),
  KEY `ID_film` (`ID_film`),
  KEY `ID_serie` (`ID_serie`),
  CONSTRAINT `oeuvre_ibfk_1` FOREIGN KEY (`ID_film`) REFERENCES `film` (`ID_film`),
  CONSTRAINT `oeuvre_ibfk_2` FOREIGN KEY (`ID_serie`) REFERENCES `série` (`ID_serie`),
  CONSTRAINT `type_oeuvre` CHECK ((`Catégorie` in (_utf8mb4'Film',_utf8mb4'Série')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oeuvre`
--

LOCK TABLES `oeuvre` WRITE;
/*!40000 ALTER TABLE `oeuvre` DISABLE KEYS */;
INSERT INTO `oeuvre` VALUES (1,'Jeter lancre un seul jour',2018,'Film','Quand Adèle, prof danglais, laisse spontanément un jeune migrant dune quinzaine dannées se glisser clandestinement dans son groupe de collégiens au moment dembarquer sur le ferry pour l’Angleterre, elle',10,0),(2,'Garfield coquillage',2022,'Film','Quand la mer se retire, Killian erre sur limmense plage déserte avec son copain Maxime. Entre les algues et les débris, les deux garçons cherchent cet étrange coquillage orange qui séchoue sur les côtes depuis des décennies : le téléphone Garfield',11,0),(3,'Louis dans tous les sens',2018,'Film','Été 1980. Louis a quinze ans et en a passé la moitié à senfermer dans sa chambre. Incapable de sortir de chez lui, il passe des heures à retoucher une fresque peinte sur lun de ses murs. De jour comme de nuit, il écoute avec attention les conversations des voisins grâce à son talkie-walkie',12,0),(4,'Sauver sa peau',2018,'Film','Samia, 15 ans, refuse de se plier aux contraintes de confinement lors de lexercice attentat organisé par son collège et quitte inopinément la classe',13,0),(5,'Jai tué ma mère',2009,'Film','Hubert Minel naime pas sa mère. Adolescent, il la juge avec mépris, ne voit que ses pulls ringards, sa décoration kitch et les miettes de pain qui se logent à la commissure de ses lèvres quand elle mange bruyamment',20,0),(6,'Tom à la ferme',2013,'Film','Tom est un citadin branché, publicitaire et gay. Lorsque son petit ami Guillaume décède dans un accident de voiture, il se rend pour la première fois dans la ferme familiale où il fait la connaissance dAgathe et de Francis, la mère et le frère de Guillaume. Cette expédition à la campagne sannonce dautant plus difficile que Tom comprend quAgathe ne savait rien de lhomosexualité de son fils',21,0),(7,'Mommy',2014,'Film','Hubert Minel naime pas sa mère. Adolescent, il la juge avec mépris, ne voit que ses pulls ringards, sa décoration kitch et les miettes de pain qui se logent à la commissure de ses lèvres quand elle mange bruyamment.Tom a la ferme',22,0),(8,'Lalaland',2016,'Film','Au coeur de Los Angeles, une actrice en devenir prénommée Mia sert des cafés entre des auditions. De son côté, Sebastian, passionné de jazz, joue du piano dans des clubs miteux pour assurer sa subsistance. Tous deux sont bien loin de la vie rêvée à laquelle ils aspirent, mais ils développent des sentiments amoureux lun pour lautre',30,0),(9,'10 cloverfield lane',2016,'Film','Après un accident de voiture catastrophique, une jeune femme se réveille dans labri souterrain dun survivaliste. Il affirme lavoir sauvée dune attaque apocalyptique qui a fait du monde extérieur un lieu invivable. Cependant, ses actes de plus en plus suspects faisant douter la jeune femme de ses motivations, celle-ci devra séchapper de là pour découvrir la vérité',31,0),(10,'First Man',2018,'Film','Espérant atteindre la Lune avant la fin de la décennie, la NASA organise une série de missions dangereuses au début des années 1960. Lingénieur Neil Armstrong se joint au programme spatial, passant des années en formation et a risqué sa vie lors dessais de vol. Le 16 juillet 1969, la nation et le monde regardent avec émerveillement alors quArmstrong, Buzz Aldrin et Michael Collins entreprennent une mission historique à bord dApollo 11',32,0),(11,'Jeune femme',2017,'Film','Un chat sous le bras, des portes closes, rien dans les poches, voici Paula, de retour à Paris après une longue absence et une rupture amoureuse. Au fil des rencontres, la jeune femme est bien décidée à prendre un nouveau départ. Avec son énergie particulière, ses névroses et toujours avec panache',40,0),(12,'Body',1993,'Film','Cathy, une aide-soignante solitaire de quarante ans, na pas de conjoint, pas denfant et pas damis. A la dérive, elle mène une vie transparente sans débordements. Un jour, après une nuit de travail, sa soeur, avec qui elle est fâchée, lappelle pour lui souhaiter son anniversaire',41,0),(13,'Les olympiades',2021,'Film','Paris 13e, quartier des Olympiades. Emilie rencontre Camille qui est attiré par Nora qui elle-même croise le chemin de Amber. Trois filles et un garçon. Ils sont amis, parfois amants, souvent les deux',50,0),(14,'Le frantôme dIsmaël',2017,'Film','Il y a 21 ans, elle sest enfuie -- et 21 ans plus tard, Carlotta est de retour. Mais Islmael était occupé à se reconstruire une vie avec Sylvia et à travailler sur son prochain film -- les épreuves dun diplomate imprudent. Au fur et à mesure que les épreuves et les tribulations dIsmael se déroulent, le protagoniste de son film, Ivan Dédalus, le diplomate désoeuvré, drôle et téméraire',51,0),(15,'Ava',2020,'Film','Ava, 13 ans, est en vacances au bord de locéan quand elle apprend qu’elle va perdre la vue plus vite que prévu. Sa mère décide de faire comme si de rien n’était pour passer le plus bel été de leur vie. Ava affronte le problème à sa manière. Elle vole un grand chien noir qui appartient à un jeune homme en fuite',52,0),(16,'La nuit où Laurier Gaudreault s\'est réveillé',2021,'Série','Adaptation de la pièce de théâtre éponyme de Michel Marc Bouchard.',0,1),(17,'Validé',2021,'Série','Adaptation de la pièce de théâtre éponyme de Michel Marc Bouchard.',0,2),(18,'Drôle',2022,'Série',' Quatre jeunes comédiens essayent de se faire une place sur la scène du stand-up parisien',0,3),(19,'Family business',2021,'Série','Joseph, 35 ans, fourmille d’idées de business... même s\'il bosse toujours malgré lui dans la boucherie casher de son père Gérard. Lorsqu\'il apprend de source \"sûre\" que le cannabis va être légalisé, c’est la révélation. Son idée de génie : transformer, à l’aide de sa famille et de ses potes, la boucherie familiale en \"Beucherie\"...',0,4),(20,'Squid game',2021,'Série',' Tentés par un prix alléchant en cas de victoire, des centaines de joueurs désargentés acceptent de s\'affronter lors de jeux pour enfants aux enjeux mortels.',0,5);
/*!40000 ALTER TABLE `oeuvre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realiser`
--

DROP TABLE IF EXISTS `realiser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realiser` (
  `ID_artiste` int NOT NULL,
  `ID_oeuvre` int NOT NULL,
  PRIMARY KEY (`ID_artiste`,`ID_oeuvre`),
  KEY `ID_oeuvre` (`ID_oeuvre`),
  CONSTRAINT `realiser_ibfk_1` FOREIGN KEY (`ID_artiste`) REFERENCES `artiste` (`ID_artiste`),
  CONSTRAINT `realiser_ibfk_2` FOREIGN KEY (`ID_oeuvre`) REFERENCES `oeuvre` (`ID_oeuvre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realiser`
--

LOCK TABLES `realiser` WRITE;
/*!40000 ALTER TABLE `realiser` DISABLE KEYS */;
INSERT INTO `realiser` VALUES (1,1),(1,2),(1,3),(1,4),(2,5),(2,6),(2,7),(3,8),(3,9),(3,10),(4,11),(4,12),(5,13),(5,14),(5,15),(2,16),(22,17),(23,18),(24,19),(25,20);
/*!40000 ALTER TABLE `realiser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saison`
--

DROP TABLE IF EXISTS `saison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saison` (
  `Numéro` int NOT NULL,
  `Nb_episodes` int DEFAULT NULL,
  `Description_s` text,
  `Année_s` int DEFAULT NULL,
  `ID_serie` int NOT NULL,
  PRIMARY KEY (`Numéro`),
  KEY `ID_serie` (`ID_serie`),
  CONSTRAINT `saison_ibfk_1` FOREIGN KEY (`ID_serie`) REFERENCES `série` (`ID_serie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saison`
--

LOCK TABLES `saison` WRITE;
/*!40000 ALTER TABLE `saison` DISABLE KEYS */;
INSERT INTO `saison` VALUES (1,5,'Adaptation de la pièce de théâtre éponyme de Michel Marc Bouchard.\nAu début des années 1990, Mireille, son frère Julien et leur meilleur ami Laurier forment un trio inséparable. Les garçons viennent de remporter le championnat provincial de baseball et Mireille rêve de brûler les planches. Qui sait ce que l’avenir leur réserve ? Pourtant, une nuit d’octobre, en 1991, leurs destins sont à jamais bouleversés par un terrible incident et leurs routes se séparent.',2021,1),(2,10,'Saison 1:Clément, petit livreur de drogue, toujours accompagné de ses deux potes d\'enfance William et Brahim, rêve de devenir rappeur. Et une livraison en bas de Skyrock lui donne l\'occasion de s\'inviter dans l\'émission spéciale consacrée à Mastar, une légende du rap français...',2020,2),(3,6,' Quatre jeunes comédiens essayent de se faire une place sur la scène du stand-up parisien',2022,3),(4,6,'Saison 1: Apprenant que le cannabis va être légalisé, Joseph, entrepreneur raté, décide de transformer, avec l\'aide de sa famille et de ses amis, la boucherie casher de son père et d\'ouvrir le premier coffee-shop de marijuana de France. ',2020,4),(5,9,'Tentés par un prix alléchant en cas de victoire, des centaines de joueurs désargentés acceptent de saffronter lors de jeux pour enfants aux enjeux mortels.',2021,5),(6,9,'Saison 2: Un an après la mort tragique de Clément, William et Brahim lancent le label Apash Music pour honorer la mémoire de leur ami. Ils misent tout sur Sara, une jeune rappeuse qui, en plus de son combat pour exister en tant que femme dans le rap game, voit son passé trouble ressurgir.',2021,2),(7,6,'Saison 2: Obligé de choisir entre cultiver du cannabis et élever ses enfants, Jo tente de convaincre sa famille de tout arrêter. Mais les catastrophes s’enchaînent. ',2020,4),(8,6,'Saison 3: Sous la menace de tauliers du trafic de stupéfiants colombiens et de l\'imprévisible Léonard, ils sont contraints de reprendre leur production de pastraweed. Si Ludmila est la seule à savoir la fabriquer, le reste de la famille va devoir trouver un moyen de survivre et de potentiellement retrouver la liberté. ',2021,4);
/*!40000 ALTER TABLE `saison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `série`
--

DROP TABLE IF EXISTS `série`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `série` (
  `ID_serie` int NOT NULL,
  PRIMARY KEY (`ID_serie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `série`
--

LOCK TABLES `série` WRITE;
/*!40000 ALTER TABLE `série` DISABLE KEYS */;
INSERT INTO `série` VALUES (0),(1),(2),(3),(4),(5);
/*!40000 ALTER TABLE `série` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-25 10:29:02
