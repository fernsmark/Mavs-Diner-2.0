-- phpMyAdmin SQL Dump
-- version 2.11.11.3
-- http://www.phpmyadmin.net
--
-- Host: omega.uta.edu
-- Generation Time: May 02, 2016 at 12:37 PM
-- Server version: 5.0.95
-- PHP Version: 5.1.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `sxr5833`
--

-- --------------------------------------------------------

--
-- Table structure for table `Cart`
--

DROP TABLE IF EXISTS `Cart`;
CREATE TABLE `Cart` (
  `restaurant_id` int(5) NOT NULL,
  `order_id` int(11) NOT NULL auto_increment,
  `food_item_id` int(11) NOT NULL,
  `customer_id` int(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY  (`order_id`,`food_item_id`,`customer_id`),
  KEY `restaurant_id` (`restaurant_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1072 ;

--
-- Dumping data for table `Cart`
--

INSERT INTO `Cart` (`restaurant_id`, `order_id`, `food_item_id`, `customer_id`, `quantity`) VALUES(10011, 1000, 1, 123, 1);
INSERT INTO `Cart` (`restaurant_id`, `order_id`, `food_item_id`, `customer_id`, `quantity`) VALUES(10011, 1000, 2, 123, 1);
INSERT INTO `Cart` (`restaurant_id`, `order_id`, `food_item_id`, `customer_id`, `quantity`) VALUES(10013, 1000, 16, 123, 1);
INSERT INTO `Cart` (`restaurant_id`, `order_id`, `food_item_id`, `customer_id`, `quantity`) VALUES(10013, 1000, 14, 123, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
CREATE TABLE `Customer` (
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `street_number` varchar(30) default NULL,
  `street_name` varchar(100) default NULL,
  `city` varchar(30) default NULL,
  `state` varchar(30) default NULL,
  `country` varchar(30) default NULL,
  `zip_code` int(11) default NULL,
  `password` varchar(50) NOT NULL,
  `customer_id` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`customer_id`),
  UNIQUE KEY `email_id` (`email_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=126 ;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`first_name`, `last_name`, `email_id`, `street_number`, `street_name`, `city`, `state`, `country`, `zip_code`, `password`, `customer_id`) VALUES('Swaroop', 'Raja Srinivas Setty', 'swa@gmail.com', '700', 'Mitchell Cir', 'Arlington', 'Tx', 'USA', 7603, '456', 123);
INSERT INTO `Customer` (`first_name`, `last_name`, `email_id`, `street_number`, `street_name`, `city`, `state`, `country`, `zip_code`, `password`, `customer_id`) VALUES('test', 'user', 'test@gmail.com', '700', 'W Mitchell Cir', 'Arlington', 'Tx', 'US', 76013, '123', 5);
INSERT INTO `Customer` (`first_name`, `last_name`, `email_id`, `street_number`, `street_name`, `city`, `state`, `country`, `zip_code`, `password`, `customer_id`) VALUES('Mr', 'Mr', 'aaa@aaa.com', '1007', 'Benge', 'Arlington ', 'Texas ', 'Usa ', 76018, '123', 6);
INSERT INTO `Customer` (`first_name`, `last_name`, `email_id`, `street_number`, `street_name`, `city`, `state`, `country`, `zip_code`, `password`, `customer_id`) VALUES('Mark', 'Fern', 'mark@gmail.com', '10', 'Street', 'Arlington ', 'Texas', 'US', 76010, '123', 125);

-- --------------------------------------------------------

--
-- Table structure for table `Food_Item`
--

DROP TABLE IF EXISTS `Food_Item`;
CREATE TABLE `Food_Item` (
  `food_item_id` int(11) NOT NULL auto_increment,
  `food_item_name` varchar(30) NOT NULL,
  `food_item_price` float NOT NULL,
  `food_item_description` varchar(100) default NULL,
  `restaurant_id` int(11) NOT NULL,
  `availability` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`food_item_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `Food_Item`
--

INSERT INTO `Food_Item` (`food_item_id`, `food_item_name`, `food_item_price`, `food_item_description`, `restaurant_id`, `availability`) VALUES(1, 'Pizza', 19.99, 'Cheese Burst', 10011, 1);
INSERT INTO `Food_Item` (`food_item_id`, `food_item_name`, `food_item_price`, `food_item_description`, `restaurant_id`, `availability`) VALUES(2, 'Burger', 9.99, 'Cheese ', 10011, 1);
INSERT INTO `Food_Item` (`food_item_id`, `food_item_name`, `food_item_price`, `food_item_description`, `restaurant_id`, `availability`) VALUES(3, 'Veggie', 6.29, 'Melted Cheddar and Mozzarella', 10011, 1);
INSERT INTO `Food_Item` (`food_item_id`, `food_item_name`, `food_item_price`, `food_item_description`, `restaurant_id`, `availability`) VALUES(4, 'Crispy Chicken', 6.99, 'Crispy Chicken Tender', 10011, 1);
INSERT INTO `Food_Item` (`food_item_id`, `food_item_name`, `food_item_price`, `food_item_description`, `restaurant_id`, `availability`) VALUES(5, 'The Texican', 9.19, 'Jalapenos Served with a side of Queso', 10011, 1);
INSERT INTO `Food_Item` (`food_item_id`, `food_item_name`, `food_item_price`, `food_item_description`, `restaurant_id`, `availability`) VALUES(6, 'Classic Box Lunch', 9.99, 'Sandwich, Potato Chips', 10012, 1);
INSERT INTO `Food_Item` (`food_item_id`, `food_item_name`, `food_item_price`, `food_item_description`, `restaurant_id`, `availability`) VALUES(7, 'Turkey Fajita Box Lunch', 12.99, 'Turkey Fajita Ciabatta, Black Bean Salad', 10012, 1);
INSERT INTO `Food_Item` (`food_item_id`, `food_item_name`, `food_item_price`, `food_item_description`, `restaurant_id`, `availability`) VALUES(8, 'The Hickory', 9.19, 'Beef,Grilled Onions.Cheddar Cheese', 10011, 1);
INSERT INTO `Food_Item` (`food_item_id`, `food_item_name`, `food_item_price`, `food_item_description`, `restaurant_id`, `availability`) VALUES(9, 'Black Bean', 6.99, 'Veggie Patty,Provolone,Lettuce', 10011, 1);
INSERT INTO `Food_Item` (`food_item_id`, `food_item_name`, `food_item_price`, `food_item_description`, `restaurant_id`, `availability`) VALUES(10, 'Tofu Salad Box Lunch', 10.99, 'Marinated Tofu and Fresh Garden Vegetables', 10012, 1);
INSERT INTO `Food_Item` (`food_item_id`, `food_item_name`, `food_item_price`, `food_item_description`, `restaurant_id`, `availability`) VALUES(11, 'Salmon Caesar Salad', 17.99, 'Salmon Caesar Salad', 10012, 1);
INSERT INTO `Food_Item` (`food_item_id`, `food_item_name`, `food_item_price`, `food_item_description`, `restaurant_id`, `availability`) VALUES(12, 'Latin Flavors', 14.25, 'Mexican Chopped Salad, Cumin Black Beans', 10012, 1);
INSERT INTO `Food_Item` (`food_item_id`, `food_item_name`, `food_item_price`, `food_item_description`, `restaurant_id`, `availability`) VALUES(13, 'Simply Italian', 0, '13.25', 10012, 1);
INSERT INTO `Food_Item` (`food_item_id`, `food_item_name`, `food_item_price`, `food_item_description`, `restaurant_id`, `availability`) VALUES(14, 'High Five', 8.99, 'Tuscan marinara, Cheddar Pepperoni', 10013, 1);
INSERT INTO `Food_Item` (`food_item_id`, `food_item_name`, `food_item_price`, `food_item_description`, `restaurant_id`, `availability`) VALUES(15, 'St. Louis Supreme', 9.25, 'Italian sausage, Red onions', 10013, 1);
INSERT INTO `Food_Item` (`food_item_id`, `food_item_name`, `food_item_price`, `food_item_description`, `restaurant_id`, `availability`) VALUES(16, 'BBQ', 10.58, 'Diced Pickles, Red Onions', 10013, 1);
INSERT INTO `Food_Item` (`food_item_id`, `food_item_name`, `food_item_price`, `food_item_description`, `restaurant_id`, `availability`) VALUES(17, 'Farmer’s Market', 5.6, 'Mushrooms, Spinach, Tomatoes', 10013, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
CREATE TABLE `Orders` (
  `order_id` int(11) NOT NULL,
  `order_status` tinyint(1) NOT NULL default '0',
  `checkout_flag` tinyint(1) NOT NULL default '0',
  `restaurant_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`order_id`, `order_status`, `checkout_flag`, `restaurant_id`) VALUES(1000, 0, 0, 10011);
INSERT INTO `Orders` (`order_id`, `order_status`, `checkout_flag`, `restaurant_id`) VALUES(1000, 0, 0, 10013);

-- --------------------------------------------------------

--
-- Table structure for table `Restaurant`
--

DROP TABLE IF EXISTS `Restaurant`;
CREATE TABLE `Restaurant` (
  `restaurant_name` varchar(30) NOT NULL,
  `rating` float default '0',
  `users_rated` int(11) NOT NULL default '1',
  `operating_hours` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `restaurant_id` int(11) NOT NULL auto_increment,
  `street_number` int(11) NOT NULL,
  `street_name` varchar(100) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `zip_code` int(11) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY  (`restaurant_id`),
  UNIQUE KEY `email_id` (`email_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10016 ;

--
-- Dumping data for table `Restaurant`
--

INSERT INTO `Restaurant` (`restaurant_name`, `rating`, `users_rated`, `operating_hours`, `status`, `email_id`, `restaurant_id`, `street_number`, `street_name`, `city`, `state`, `country`, `zip_code`, `password`) VALUES('Texadelphia', 4, 6, '10am  - 9pm', 'Maintenance', 'texadelphia@aramark.com', 10011, 1234, 'abc street', 'Arlington', 'TX', 'USA', 76010, '123');
INSERT INTO `Restaurant` (`restaurant_name`, `rating`, `users_rated`, `operating_hours`, `status`, `email_id`, `restaurant_id`, `street_number`, `street_name`, `city`, `state`, `country`, `zip_code`, `password`) VALUES('Moes', 3.66667, 3, '9am to 6pm', 'Maintenance', 'moes@aramark.com', 10012, 100, 'UC drive', 'Arlington', 'Texas', 'United States', 76013, '456');
INSERT INTO `Restaurant` (`restaurant_name`, `rating`, `users_rated`, `operating_hours`, `status`, `email_id`, `restaurant_id`, `street_number`, `street_name`, `city`, `state`, `country`, `zip_code`, `password`) VALUES('PieFive', 4, 8, '24 hours', 'Open', 'piefive@aramark.com', 10013, 101, 'UC DRIVE', 'Arlington', 'Texas', 'United States', 76013, '123');
INSERT INTO `Restaurant` (`restaurant_name`, `rating`, `users_rated`, `operating_hours`, `status`, `email_id`, `restaurant_id`, `street_number`, `street_name`, `city`, `state`, `country`, `zip_code`, `password`) VALUES('Bombay Chopstix', 0, 1, '10 am - 6 pm', 'Open', 'bombay@aramark.com', 10015, 11, 'Street street', 'Arlington ', 'Texas', 'US', 76010, '123');

-- --------------------------------------------------------

--
-- Table structure for table `table1`
--

DROP TABLE IF EXISTS `table1`;
CREATE TABLE `table1` (
  `Username` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `Role` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table1`
--

INSERT INTO `table1` (`Username`, `Password`, `Role`) VALUES('swaroop', 'swaroop', 'admin');
