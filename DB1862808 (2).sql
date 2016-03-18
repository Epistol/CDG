
-- --------------------------------------------------------

--
-- Structure de la table `Categories`
--

CREATE TABLE IF NOT EXISTS `Categories` (
`id_categ` int(5) NOT NULL,
  `lib_categ` varchar(255) COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci COMMENT='categories';

-- --------------------------------------------------------

--
-- Structure de la table `Difficulte`
--

CREATE TABLE IF NOT EXISTS `Difficulte` (
  `id_difficulte` int(1) NOT NULL,
  `lib_difficulte` varchar(255) COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci COMMENT='difficulte de chaque recette';

-- --------------------------------------------------------

--
-- Structure de la table `Favoris_recette`
--

CREATE TABLE IF NOT EXISTS `Favoris_recette` (
`id_favoris` int(10) NOT NULL,
  `id_recette` int(10) NOT NULL,
  `id_user` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci COMMENT='recette_favorisé par un membre';

-- --------------------------------------------------------

--
-- Structure de la table `Infos`
--

CREATE TABLE IF NOT EXISTS `Infos` (
  `id_infos` int(10) NOT NULL COMMENT 'id qui correspond au id de users',
  `id_utilisateur` int(5) NOT NULL,
  `sexe` tinytext COLLATE latin1_german1_ci NOT NULL COMMENT 'M ou F',
  `age` tinyint(3) NOT NULL COMMENT 'de 0 a 255 ans !',
  `ville` varchar(255) COLLATE latin1_german1_ci NOT NULL COMMENT 'ville',
  `codepost` smallint(5) NOT NULL COMMENT 'code postal',
  `date_naiss` date NOT NULL COMMENT 'date de naissance',
  `newsletter` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'inscrit à la newsletter ? 0 = non',
  `univ1_prefere` int(50) NOT NULL,
  `univ2_prefere` int(50) NOT NULL,
  `univ3_prefere` int(50) NOT NULL,
  `univ4_prefere` int(50) NOT NULL,
  `univ5_prefere` int(50) NOT NULL,
  `univ6_prefere` int(50) NOT NULL,
  `univ7_prefere` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci COMMENT='les infos utilisateurs';

-- --------------------------------------------------------

--
-- Structure de la table `Ingredients`
--

CREATE TABLE IF NOT EXISTS `Ingredients` (
`id_ingr` int(10) NOT NULL,
  `lib_ingr` varchar(255) COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Ing_recette`
--

CREATE TABLE IF NOT EXISTS `Ing_recette` (
`id_liens` int(10) NOT NULL COMMENT 'id de chaque lien ingredient/recette',
  `id_recette` int(10) NOT NULL,
  `id_ingr` int(10) NOT NULL,
  `quantite` varchar(255) COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci COMMENT='lien entre ingrédients et recette';

-- --------------------------------------------------------

--
-- Structure de la table `Recette`
--

CREATE TABLE IF NOT EXISTS `Recette` (
`id_recette` int(10) NOT NULL,
  `date_crea` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_author` int(10) NOT NULL COMMENT 'auteur lié',
  `category` int(25) NOT NULL COMMENT 'catégorie de la recette',
  `difficulte` int(1) NOT NULL COMMENT 'difficulté (de 1 à 3)',
  `temps_preparation` varchar(255) COLLATE latin1_german1_ci NOT NULL,
  `temps_cuisson` varchar(255) COLLATE latin1_german1_ci NOT NULL COMMENT 'temps en minutes (ou défini comme repos=nuit, etc)',
  `temps_repos` varchar(255) COLLATE latin1_german1_ci NOT NULL COMMENT 'pareil en temps',
  `univers` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci COMMENT='les recettes';

-- --------------------------------------------------------

--
-- Structure de la table `Univers`
--

CREATE TABLE IF NOT EXISTS `Univers` (
`id_univ` int(10) NOT NULL COMMENT 'id',
  `lib_uni` varchar(255) COLLATE latin1_german1_ci NOT NULL COMMENT 'description'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------



--
-- Structure de la table `utilisateurs`
--

CREATE TABLE IF NOT EXISTS `Utilisateurs` (
`id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `confirmation_token` varchar(60) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `reset_token` varchar(60) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `Utilisateurs`
--

INSERT INTO `Utilisateurs` (`id`, `username`, `email`, `password`, `confirmation_token`, `confirmed_at`, `reset_token`, `reset_at`) VALUES
(1, 'Epi', 'mikaleb@live.fr', 'Test', NULL, NULL, NULL, NULL),
(2, 'Toto', 'coucou@gmail.com', 'Toto', NULL, NULL, NULL, NULL),
(14, 'Epistol', 'epistolshow@gmail.com', '$2y$10$I94iOmd6duE1FfAMMkfWR.blKSKKYuRIrMRaHSGB1XPmsM8oTATOS', NULL, '2015-07-28 02:11:47', '0', NULL);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `Categories`
--
ALTER TABLE `Categories`
 ADD PRIMARY KEY (`id_categ`);

--
-- Index pour la table `Difficulte`
--
ALTER TABLE `Difficulte`
 ADD PRIMARY KEY (`id_difficulte`);

--
-- Index pour la table `Favoris_recette`
--
ALTER TABLE `Favoris_recette`
 ADD PRIMARY KEY (`id_favoris`), ADD KEY `indexuser` (`id_user`), ADD KEY `index_recette` (`id_recette`);

--
-- Index pour la table `Infos`
--
ALTER TABLE `Infos`
 ADD PRIMARY KEY (`id_infos`,`id_utilisateur`), ADD UNIQUE KEY `id_infos` (`id_infos`,`id_utilisateur`), ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Index pour la table `Ingredients`
--
ALTER TABLE `Ingredients`
 ADD PRIMARY KEY (`id_ingr`);

--
-- Index pour la table `Ing_recette`
--
ALTER TABLE `Ing_recette`
 ADD PRIMARY KEY (`id_liens`), ADD KEY `id_recette` (`id_recette`), ADD KEY `index2ingr` (`id_ingr`), ADD KEY `quantite` (`quantite`);

--
-- Index pour la table `Recette`
--
ALTER TABLE `Recette`
 ADD PRIMARY KEY (`id_recette`) COMMENT 'primaires recette id et sa timestamp', ADD UNIQUE KEY `date_crea` (`date_crea`), ADD KEY `univers` (`univers`), ADD KEY `diff` (`difficulte`), ADD KEY `auth` (`id_author`), ADD KEY `index_categ` (`category`);

--
-- Index pour la table `Univers`
--
ALTER TABLE `Univers`
 ADD PRIMARY KEY (`id_univ`);


--
-- Index pour la table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `Categories`
--
ALTER TABLE `Categories`
MODIFY `id_categ` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Favoris_recette`
--
ALTER TABLE `Favoris_recette`
MODIFY `id_favoris` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Ingredients`
--
ALTER TABLE `Ingredients`
MODIFY `id_ingr` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Ing_recette`
--
ALTER TABLE `Ing_recette`
MODIFY `id_liens` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id de chaque lien ingredient/recette';
--
-- AUTO_INCREMENT pour la table `Recette`
--
ALTER TABLE `Recette`
MODIFY `id_recette` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Univers`
--
ALTER TABLE `Univers`
MODIFY `id_univ` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id';

--
-- AUTO_INCREMENT pour la table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `Favoris_recette`
--
ALTER TABLE `Favoris_recette`
ADD CONSTRAINT `Favoris_recette_ibfk_1` FOREIGN KEY (`id_recette`) REFERENCES `Recette` (`id_recette`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `Favoris_recette_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `Utilisateur` (`id_utilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `Infos`
--
ALTER TABLE `Infos`
ADD CONSTRAINT `Infos_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `Utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `Ing_recette`
--
ALTER TABLE `Ing_recette`
ADD CONSTRAINT `Ing_recette_ibfk_1` FOREIGN KEY (`id_recette`) REFERENCES `Recette` (`id_recette`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `Ing_recette_ibfk_2` FOREIGN KEY (`id_ingr`) REFERENCES `Ingredients` (`id_ingr`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `Recette`
--
ALTER TABLE `Recette`
ADD CONSTRAINT `Recette_ibfk_1` FOREIGN KEY (`id_author`) REFERENCES `Utilisateur` (`id_utilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `Recette_ibfk_2` FOREIGN KEY (`category`) REFERENCES `Categories` (`id_categ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `Recette_ibfk_3` FOREIGN KEY (`difficulte`) REFERENCES `Difficulte` (`id_difficulte`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `Recette_ibfk_4` FOREIGN KEY (`univers`) REFERENCES `Univers` (`id_univ`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
