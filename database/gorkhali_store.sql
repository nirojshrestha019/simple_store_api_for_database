
DROP DATABASE IF EXISTS gorkhali_store;
CREATE DATABASE IF NOT EXISTS gorkhali_store;
USE gorkhali_store;


DROP TABLE IF EXISTS `address_detail`,
                     `customer`,
                     `orders`,
                     `product_inventory`, 
                     `order_items`;

CREATE TABLE `customer` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` int(11) NOT NULL,
  PRIMARY KEY (`c_id`),
  UNIQUE KEY `email` (`email`)

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `address_detail` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `street_name` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  PRIMARY KEY (`a_id`),
  FOREIGN KEY (c_id) REFERENCES customer(c_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `product_inventory` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `price` float(15) NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `orders` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `status` ENUM('pending', 'completed', 'cancelled') NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`o_id`),
  FOREIGN KEY (c_id) REFERENCES customer(c_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `order_items` (
  `o_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `sale_price` float(15) NOT NULL,
  `sale_qty` varchar(11) NOT NULL,
  PRIMARY KEY (`o_id`, `p_id`),
  FOREIGN KEY (o_id) REFERENCES orders(o_id),
  FOREIGN KEY (p_id) REFERENCES product_inventory(p_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `customer` (`c_id`, `first_name`, `last_name`, `email`, `phone_number`) VALUES (1, 'Isadore', 'O\'Hara', 'brenna77@example.org', 1827385);
INSERT INTO `customer` (`c_id`, `first_name`, `last_name`, `email`, `phone_number`) VALUES (2, 'Ford', 'McLaughlin', 'gudrun23@example.org', 1840583);
INSERT INTO `customer` (`c_id`, `first_name`, `last_name`, `email`, `phone_number`) VALUES (3, 'Athena', 'Schowalter', 'edgar36@example.net', 9573936);
INSERT INTO `customer` (`c_id`, `first_name`, `last_name`, `email`, `phone_number`) VALUES (4, 'Keven', 'Howe', 'karlie.flatley@example.net', 1476946);
INSERT INTO `customer` (`c_id`, `first_name`, `last_name`, `email`, `phone_number`) VALUES (5, 'Marguerite', 'Fahey', 'camren.wolff@example.net', 4839495);
INSERT INTO `customer` (`c_id`, `first_name`, `last_name`, `email`, `phone_number`) VALUES (6, 'Robin', 'Nitzsche', 'turcotte.eriberto@example.com', 2394058);
INSERT INTO `customer` (`c_id`, `first_name`, `last_name`, `email`, `phone_number`) VALUES (7, 'Charlie', 'Von', 'hope.rowe@example.com', 2748694);
INSERT INTO `customer` (`c_id`, `first_name`, `last_name`, `email`, `phone_number`) VALUES (8, 'Nikita', 'Durgan', 'megane54@example.net', 2849503);
INSERT INTO `customer` (`c_id`, `first_name`, `last_name`, `email`, `phone_number`) VALUES (9, 'Maurine', 'Thiel', 'saul.fritsch@example.com', 1839473);
INSERT INTO `customer` (`c_id`, `first_name`, `last_name`, `email`, `phone_number`) VALUES (10, 'Raegan', 'Welch', 'fred78@example.com', 9338594);
INSERT INTO `customer` (`c_id`, `first_name`, `last_name`, `email`, `phone_number`) VALUES (11, 'Theron', 'Aufderhar', 'viola09@example.com', 2839574);
INSERT INTO `customer` (`c_id`, `first_name`, `last_name`, `email`, `phone_number`) VALUES (12, 'Annabelle', 'Jacobi', 'nconsidine@example.org', 2839504);
INSERT INTO `customer` (`c_id`, `first_name`, `last_name`, `email`, `phone_number`) VALUES (13, 'Ella', 'Abbott', 'wschinner@example.com', 1849506);
INSERT INTO `customer` (`c_id`, `first_name`, `last_name`, `email`, `phone_number`) VALUES (14, 'Otto', 'Farrell', 'dstamm@example.org', 3940385);
INSERT INTO `customer` (`c_id`, `first_name`, `last_name`, `email`, `phone_number`) VALUES (15, 'Friedrich', 'Mante', 'vladimir.howell@example.org', 8394059);
INSERT INTO `customer` (`c_id`, `first_name`, `last_name`, `email`, `phone_number`) VALUES (16, 'Deondre', 'Bartell', 'eadams@example.net', 8473960);
INSERT INTO `customer` (`c_id`, `first_name`, `last_name`, `email`, `phone_number`) VALUES (17, 'Kevin', 'Littel', 'lola70@example.net', 2958694);
INSERT INTO `customer` (`c_id`, `first_name`, `last_name`, `email`, `phone_number`) VALUES (18, 'Marcella', 'Schowalter', 'antonette76@example.org', 9473658);
INSERT INTO `customer` (`c_id`, `first_name`, `last_name`, `email`, `phone_number`) VALUES (19, 'Karianne', 'Collins', 'langosh.nathen@example.com', 9483756);
INSERT INTO `customer` (`c_id`, `first_name`, `last_name`, `email`, `phone_number`) VALUES (20, 'Viva', 'Rippin', 'dwiza@example.net', 2839495);

INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (1, 1, 'id', 'Port Krystinastad', 'Kansas', 'Mali', 'fhrv');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (2, 2, 'quae', 'Port Electa', 'Alabama', 'Australia', 'qwoy');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (3, 3, 'nobis', 'Alysonborough', 'Illinois', 'Netherlands', 'uddx');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (4, 4, 'temporibus', 'West Friedrich', 'Missouri', 'Liberia', 'eiyc');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (5, 5, 'aut', 'New Alleneberg', 'Vermont', 'Suriname', 'mhen');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (6, 6, 'vel', 'Lake Irwinshire', 'Illinois', 'France', 'vhqk');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (7, 7, 'odit', 'Macejkovicville', 'Oklahoma', 'Dominican Republic', 'emxs');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (8, 8, 'iusto', 'North Kaelyn', 'Minnesota', 'Tonga', 'jhrk');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (9, 9, 'atque', 'West Mona', 'WestVirginia', 'Gabon', 'vrxg');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (10, 10, 'dolorum', 'New Fayside', 'Nebraska', 'Andorra', 'dfgl');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (11, 11, 'et', 'East Paulaberg', 'Illinois', 'Antigua and Barbuda', 'skuw');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (12, 12, 'optio', 'Balistreritown', 'California', 'Eritrea', 'rurp');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (13, 13, 'accusantium', 'Nyatown', 'California', 'Palau', 'lfcr');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (14, 14, 'rerum', 'West Ulices', 'NewHampshire', 'Saint Pierre and Miquelon', 'aacd');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (15, 15, 'quod', 'Padbergview', 'Mississippi', 'Northern Mariana Islands', 'penl');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (16, 16, 'asperiores', 'Kassulkefort', 'SouthCarolina', 'Pitcairn Islands', 'ffpj');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (17, 17, 'itaque', 'Kaelynfurt', 'Washington', 'Mali', 'tefh');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (18, 18, 'dignissimos', 'Lake Shaina', 'Virginia', 'Marshall Islands', 'shol');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (19, 19, 'cumque', 'Lake Alexandrabury', 'Pennsylvania', 'Netherlands Antilles', 'mewz');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (20, 20, 'et', 'New Mariellefort', 'Kansas', 'Burkina Faso', 'ppla');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (21, 1, 'maxime', 'West Carmine', 'Wyoming', 'Aruba', 'cvmy');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (22, 2, 'qui', 'Jerdefurt', 'Arizona', 'Kenya', 'zsvt');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (23, 3, 'quam', 'Willton', 'Alaska', 'Montenegro', 'eucs');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (24, 4, 'aliquid', 'East Rosemary', 'Pennsylvania', 'Montserrat', 'yurm');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (25, 5, 'totam', 'North Lucyhaven', 'RhodeIsland', 'Botswana', 'mbix');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (26, 6, 'quisquam', 'Edfort', 'Wyoming', 'Saint Kitts and Nevis', 'ybxn');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (27, 7, 'vero', 'East Tyree', 'Minnesota', 'Ireland', 'jhiu');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (28, 8, 'sunt', 'Port Ronny', 'Utah', 'Finland', 'qsum');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (29, 9, 'libero', 'South Waylon', 'Iowa', 'Oman', 'guyl');
INSERT INTO `address_detail` (`a_id`, `c_id`, `street_name`, `city`, `province`, `country`, `postal_code`) VALUES (30, 10, 'eos', 'West Carter', 'WestVirginia', 'Tanzania', 'zzas');

INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (1, 'Rem quasi odio ea possimus.', '1578.86', 14);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (2, 'Placeat error nam et adipisci cum nostrum ratione.', '392.3', 75);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (3, 'Odit aperiam sit tenetur ratione et minima.', '4368.54', 62);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (4, 'Aut repellendus animi quia ea atque nostrum totam fugiat.', '5395.25', 68);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (5, 'Eum sed aut ducimus voluptate.', '8896.12', 53);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (6, 'Necessitatibus possimus sed tempora reprehenderit rerum molestiae recusandae est.', '871.87', 68);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (7, 'Nisi iusto sit labore commodi ea reiciendis esse.', '7335.15', 59);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (8, 'Sit dolorem voluptates exercitationem necessitatibus.', '8364.35', 66);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (9, 'Modi velit porro nihil consequatur qui fuga adipisci.', '5990.49', 16);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (10, 'Voluptatibus labore ut voluptas et qui veritatis nobis.', '7969.14', 72);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (11, 'Maxime praesentium voluptatem sunt laudantium.', '589.67', 24);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (12, 'Dolores facilis quae qui nostrum molestiae.', '2924.13', 51);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (13, 'Necessitatibus quidem odit molestiae nobis aut modi aut.', '6119.73', 37);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (14, 'Quod incidunt autem voluptatem voluptate voluptatem.', '9395.4', 23);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (15, 'Doloribus nobis inventore tenetur iure ut hic commodi ipsam.', '7729.9', 11);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (16, 'Qui blanditiis dolorem dolor et.', '66.66', 44);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (17, 'Ad quis aut voluptates enim omnis exercitationem distinctio.', '7265.75', 17);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (18, 'Voluptatibus excepturi autem voluptas consequatur quia nostrum perferendis.', '3452.84', 34);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (19, 'Distinctio libero libero velit autem eius reprehenderit.', '6711.11', 38);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (20, 'Sapiente est ullam aspernatur.', '6152.92', 66);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (21, 'Itaque at dolores molestiae unde voluptatem vero.', '285.93', 26);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (22, 'Magnam qui vero totam corrupti aut.', '2576.98', 43);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (23, 'Quia laborum consequatur dolorem inventore.', '243.03', 20);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (24, 'Aliquid minima ut enim.', '777.43', 18);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (25, 'Sapiente consequuntur voluptas consectetur dolor fuga est in.', '3757.44', 41);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (26, 'Ut et enim voluptatem nesciunt est.', '5803.67', 42);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (27, 'Eum magnam voluptatem consequatur repellendus aut.', '4040.22', 36);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (28, 'Expedita dolore libero perspiciatis omnis qui a.', '8853.37', 63);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (29, 'Voluptate id earum nihil.', '4951.24', 68);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (30, 'Quisquam consectetur quidem et modi dolor consequatur.', '4756.22', 39);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (31, 'Natus nobis cumque sint maiores voluptas non non.', '8355.52', 21);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (32, 'Tempore magni saepe deleniti provident in ex.', '9455.87', 40);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (33, 'Error officiis quasi odit vel architecto deleniti et.', '7703.84', 33);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (34, 'Ut est laudantium nesciunt blanditiis fugit dolor.', '7527.74', 42);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (35, 'Maiores aut qui vero fuga reiciendis cumque pariatur.', '6359.65', 47);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (36, 'Et unde unde repudiandae sed et.', '7516.75', 72);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (37, 'Excepturi repellendus doloremque ratione eum impedit nisi.', '9072.37', 40);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (38, 'Modi dicta cumque sed repudiandae excepturi ut similique.', '2878.34', 29);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (39, 'Officiis quo veritatis ea laborum nobis temporibus.', '8965.8', 63);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (40, 'Sit hic voluptatem quidem a.', '5514.41', 35);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (41, 'Fugiat ab iste eius et harum rerum.', '199.68', 75);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (42, 'Temporibus reprehenderit dolore recusandae ut aut optio et.', '1257.09', 62);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (43, 'Est sint qui explicabo nostrum est nobis expedita consequatur.', '1459.1', 72);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (44, 'Ut maxime ab ipsa amet reiciendis est voluptate.', '1223.8', 40);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (45, 'Cupiditate veritatis sunt nostrum eaque fugiat.', '513.21', 61);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (46, 'Possimus nihil expedita explicabo explicabo sunt adipisci.', '5920.35', 20);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (47, 'Modi ut accusamus optio non qui.', '4964.46', 15);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (48, 'Cupiditate aperiam facilis inventore id reprehenderit voluptatem recusandae.', '7608.35', 30);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (49, 'Consequuntur accusamus corrupti deserunt harum ex autem aliquam.', '3916.43', 46);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (50, 'Minima a voluptatem qui voluptatem.', '5985.93', 71);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (51, 'Repudiandae aliquid mollitia illum similique corrupti deserunt.', '9803.31', 11);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (52, 'Repellendus expedita odit placeat error enim.', '8676.61', 12);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (53, 'Tenetur iusto vel ea ab mollitia perferendis eum.', '1144.84', 32);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (54, 'Aliquid et modi suscipit et sed illo quis.', '5586.65', 72);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (55, 'Quo possimus ipsum iure qui rerum quia qui maiores.', '2810.57', 12);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (56, 'Non ratione rerum voluptatum sit.', '4995.5', 44);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (57, 'In odit ut hic eius debitis aspernatur aliquid.', '3684.19', 63);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (58, 'Ea earum aut eveniet cumque vel.', '8547.77', 47);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (59, 'Sed non expedita sed consequatur voluptatem minima.', '8980.51', 55);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (60, 'Aperiam quibusdam minus quos error quia ipsum.', '4113.49', 21);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (61, 'Veritatis enim sequi nihil odio accusamus molestiae officiis esse.', '6073.53', 15);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (62, 'Corrupti et hic laborum consequuntur illo fuga.', '2296.02', 18);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (63, 'Non eveniet dolorem tempora.', '2655.1', 64);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (64, 'Dolore voluptate et velit dolor.', '961.99', 28);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (65, 'Sit est sit voluptatum et et porro velit.', '418.86', 66);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (66, 'Et consequuntur omnis quisquam nostrum optio.', '9893.2', 44);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (67, 'Hic dolores placeat labore libero ab commodi optio asperiores.', '9880.33', 26);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (68, 'Beatae quos quae voluptas modi itaque.', '2104.53', 32);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (69, 'Illum itaque fugiat necessitatibus aliquid possimus perferendis qui.', '3298.96', 54);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (70, 'Necessitatibus molestiae ducimus sit aut et nam blanditiis laudantium.', '8940.35', 32);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (71, 'Amet accusantium est vero ut.', '5863.32', 72);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (72, 'Qui beatae quia enim dolor rerum quia explicabo.', '7846.78', 19);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (73, 'Quia vitae aut eligendi in ut perspiciatis dolore repudiandae.', '1792.36', 50);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (74, 'Culpa impedit id atque est esse.', '4097.63', 48);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (75, 'Rem aliquid illo tempora explicabo consectetur.', '4685.46', 71);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (76, 'Quia quasi voluptas eius maxime explicabo.', '7786.61', 52);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (77, 'Corporis vel iure quia.', '8405.65', 31);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (78, 'Excepturi necessitatibus architecto ipsa earum provident maxime.', '7622.02', 35);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (79, 'Sapiente nesciunt ut enim totam.', '5400', 25);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (80, 'At deserunt voluptas architecto laborum.', '7804.89', 66);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (81, 'Unde ut voluptatibus maiores veniam.', '1690.23', 65);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (82, 'Quam omnis aliquid ut et ad aut suscipit.', '2556.13', 43);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (83, 'Id maxime quaerat eum.', '1243.92', 62);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (84, 'Reprehenderit deleniti non aliquam minus rerum sunt eum.', '7760.46', 34);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (85, 'Quidem qui temporibus deleniti aut rerum.', '3012.67', 65);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (86, 'Minus et autem ut facere ut quo aut.', '7626.01', 56);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (87, 'Facilis velit autem libero laudantium facere dolorem eaque magni.', '2218.69', 60);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (88, 'Eos voluptates amet vitae magnam ut.', '326.44', 15);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (89, 'Omnis veniam nam repellat possimus sequi velit.', '9903.72', 20);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (90, 'At et animi sunt vero unde aut dignissimos est.', '4297.68', 11);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (91, 'Culpa ab qui quisquam aut sit.', '3313.09', 68);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (92, 'Sed non nulla non reiciendis corrupti autem possimus.', '6554.64', 25);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (93, 'Id laboriosam repellendus non tempore aut.', '1524.7', 69);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (94, 'Possimus rerum recusandae ut facilis eligendi fugiat.', '5441.39', 32);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (95, 'Nisi molestias laboriosam ut iure ipsam voluptatibus quisquam.', '6301.19', 41);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (96, 'Rem praesentium quas fugiat mollitia delectus.', '7929.36', 55);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (97, 'Laboriosam hic sint ut et ex alias.', '181.98', 66);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (98, 'Eius eos asperiores nisi animi quibusdam magnam.', '1138.33', 33);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (99, 'Neque hic porro soluta doloremque et.', '7735.71', 45);
INSERT INTO `product_inventory` (`p_id`, `title`, `price`, `qty`) VALUES (100, 'Cumque saepe vero laborum sit ratione.', '4395.44', 60);

INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (1, 1, 'pending', '1996-07-02');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (2, 2, 'cancelled', '2015-03-08');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (3, 3, 'completed', '2018-02-22');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (4, 4, 'pending', '1983-02-20');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (5, 5, 'cancelled', '2007-07-20');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (6, 6, 'pending', '2001-06-19');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (7, 7, 'completed', '2013-07-23');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (8, 8, 'cancelled', '2016-05-18');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (9, 9, 'pending', '2000-07-22');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (10, 10, 'pending', '1980-05-24');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (11, 11, 'pending', '1972-02-18');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (12, 12, 'cancelled', '2012-06-19');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (13, 13, 'cancelled', '1992-11-29');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (14, 14, 'pending', '1997-10-26');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (15, 15, 'pending', '2004-06-26');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (16, 16, 'completed', '1997-06-10');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (17, 17, 'cancelled', '2000-11-27');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (18, 18, 'cancelled', '1988-06-22');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (19, 19, 'pending', '1984-06-02');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (20, 20, 'pending', '1970-12-22');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (21, 1, 'pending', '1997-10-27');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (22, 2, 'pending', '2009-05-28');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (23, 3, 'pending', '1987-10-10');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (24, 4, 'completed', '1991-01-21');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (25, 5, 'completed', '1986-11-24');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (26, 6, 'completed', '2000-11-19');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (27, 7, 'completed', '1989-03-26');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (28, 8, 'cancelled', '1979-07-31');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (29, 9, 'completed', '1994-01-14');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (30, 10, 'completed', '2007-02-11');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (31, 11, 'pending', '2016-02-27');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (32, 12, 'pending', '1985-04-30');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (33, 13, 'cancelled', '1989-10-19');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (34, 14, 'pending', '2016-06-20');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (35, 15, 'pending', '2017-12-31');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (36, 16, 'completed', '2013-01-16');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (37, 17, 'pending', '1974-04-24');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (38, 18, 'cancelled', '2004-02-11');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (39, 19, 'cancelled', '1973-03-16');
INSERT INTO `orders` (`o_id`, `c_id`, `status`, `date`) VALUES (40, 20, 'cancelled', '2002-07-28');

INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (1, 1, '5403.18', '3');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (2, 2, '667.66', '1');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (3, 3, '8295.67', '3');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (4, 4, '258.66', '3');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (5, 5, '6948.94', '3');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (6, 6, '7078.76', '5');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (7, 7, '3006.33', '2');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (8, 8, '7359.18', '3');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (9, 9, '7389.73', '1');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (10, 10, '1523.42', '2');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (11, 11, '5679.67', '1');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (12, 12, '7572.78', '4');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (13, 13, '6272.47', '5');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (14, 14, '3243.98', '2');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (15, 15, '3528.39', '5');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (16, 16, '1823.62', '5');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (17, 17, '9375.56', '3');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (18, 18, '6.62', '4');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (19, 19, '6150.31', '3');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (20, 20, '6700.3', '2');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (21, 21, '7721.49', '1');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (22, 22, '6624.34', '5');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (23, 23, '8869.5', '2');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (24, 24, '4385.6', '1');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (25, 25, '888.54', '2');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (26, 26, '3167.9', '2');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (27, 27, '5651.86', '1');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (28, 28, '3023.17', '4');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (29, 29, '3187.44', '4');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (30, 30, '91.34', '1');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (31, 31, '6604.72', '4');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (32, 32, '2552.6', '2');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (33, 33, '4164.52', '3');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (34, 34, '32', '1');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (35, 35, '5780.9', '4');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (36, 36, '9200.96', '2');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (37, 37, '4074.56', '3');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (38, 38, '6081.16', '3');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (39, 39, '2136.53', '4');
INSERT INTO `order_items` (`o_id`, `p_id`, `sale_price`, `sale_qty`) VALUES (40, 40, '8189.86', '1');