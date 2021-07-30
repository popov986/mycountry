

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(64) DEFAULT NULL,
  `last_name` varchar(64) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_by` varchar(32) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


INSERT INTO `users` (`id`, `first_name`, `last_name`, `birthdate`, `username`, `password`, `status`, `created_by`, `created_on`) VALUES
	(1, 'John', 'Smith', '1986-09-19', 'john.smith@gmail.com', 'add9e56827331620e4f236355d213965d2b2fbb8494bf8a4a589aa2c69a1dc71', 1, 'admin', '2021-07-30 10:53:44');


CREATE TABLE IF NOT EXISTS `user_country` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `alpha2Code` varchar(2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_alpha2Code` (`user_id`,`alpha2Code`),
  CONSTRAINT `fk_user_code` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;


INSERT INTO `user_country` (`id`, `user_id`, `alpha2Code`, `created_at`) VALUES
	(22, 1, 'FR', '2021-07-29 17:52:23'),
	(23, 1, 'MK', '2021-07-29 17:57:35');

CREATE TABLE IF NOT EXISTS `user_country_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_country_id` int(10) unsigned NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_user_country` (`user_country_id`),
  CONSTRAINT `fk_user_country` FOREIGN KEY (`user_country_id`) REFERENCES `user_country` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;


INSERT INTO `user_country_comments` (`id`, `user_country_id`, `comment`, `created_at`) VALUES
	(14, 22, 'â€œQui vivra verraâ€', '2021-07-29 17:53:45'),
	(15, 22, ' â€œQuand on a pas ce que lâ€™on aime, il faut aimer ce que lâ€™on aâ€', '2021-07-29 17:54:05'),
	(16, 22, 'â€œIl nâ€™y a pas plus sourd que celui qui ne veut pas entendreâ€', '2021-07-29 17:54:19'),
	(22, 23, 'The history of the region begins with the kingdom of Paeonia, a mixed Thraco-Illyrian polity.', '2021-07-29 17:58:24');

