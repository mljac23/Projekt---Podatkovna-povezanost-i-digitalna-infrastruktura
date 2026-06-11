-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jun 11, 2026 at 10:49 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sopitas`
--

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id` int(11) NOT NULL,
  `ime` varchar(32) NOT NULL,
  `prezime` varchar(32) NOT NULL,
  `korisnicko_ime` varchar(64) NOT NULL,
  `lozinka` varchar(255) NOT NULL,
  `razina` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id`, `ime`, `prezime`, `korisnicko_ime`, `lozinka`, `razina`) VALUES
(1, 'admin', 'Korisnik', 'admin123', '$2y$10$AxlzvB5I/NBNSycK78/rauoPmCAmAE7LjmCGJVntAY/.zdXMq73cW', 1),
(2, 'Mirko', 'Mirić', 'mm23mm', '$2y$10$pX313eFQfLW1gja2SLKW6us03X0dc4b74BZ8wzLv4x78krY29sD..', 0),
(3, 'Mirko', 'Mirić', 'mirko23', '$2y$10$81rTNI/PvFVPVIsZ.I/wu.e9f69IKRrM0TnTOi2/ZXw/p/KKvjxyi', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vijesti`
--

CREATE TABLE `vijesti` (
  `id` int(11) NOT NULL,
  `datum` varchar(32) NOT NULL,
  `naslov` varchar(255) NOT NULL,
  `sazetak` text NOT NULL,
  `tekst` text NOT NULL,
  `slika` varchar(255) NOT NULL,
  `kategorija` varchar(64) NOT NULL,
  `arhiva` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vijesti`
--

INSERT INTO `vijesti` (`id`, `datum`, `naslov`, `sazetak`, `tekst`, `slika`, `kategorija`, `arhiva`) VALUES
(1, '09.06.2026.', 'PORSCHE TRACK DAY', '11.7. Grobnik', 'Motosport', 'wallpaper_d_493fdd2551a718bdc44790f5f0b8350dff8f78f2.jpg', 'Sport', 0),
(2, '09.06.2026.', 'Bayern 3-0 Union Berlin', 'Domaća momčad slavila nakon dramatične završnice utakmice', 'Domaća momčad ostvarila je važnu pobjedu nakon vrlo uzbudljive i neizvjesne utakmice. Od samog početka susreta obje ekipe igrale su otvoreno, s puno trke, duela i prilika na obje strane.\r\n\r\nGosti su prvi zaprijetili već u uvodnim minutama, ali je vratar domaće momčadi odličnom obranom sačuvao svoju mrežu. Nakon toga domaći igrači preuzeli su inicijativu i sve češće dolazili pred protivnički gol.\r\n\r\nU drugom poluvremenu tempo utakmice dodatno se pojačao. Publika je glasno podržavala svoju momčad, a odlučujući trenutak dogodio se pred sami kraj susreta kada je napadač domaćih iskoristio odličan ubačaj s desne strane i pogodio za konačnu pobjedu.\r\n\r\nOvim rezultatom domaća momčad osvojila je vrijedne bodove i dodatno se približila vrhu tablice. Trener je nakon utakmice istaknuo da je ponosan na borbenost svojih igrača i da ekipa mora nastaviti raditi istim tempom.', 'bayern.jpg', 'Sport', 0),
(3, '09.06.2026.', 'Testna sportska vijest', '.........', 'Bayern', 'bayern.jpg', 'Sport', 1),
(4, '09.06.2026.', 'Glazbeni događaj godine', 'Bend Hives stiže u Zagreb.', 'Kupite ulaznice na stanici sopitas-ulaznice.hr', 'hives.jpg', 'Glazba', 0),
(5, '09.06.2026.', 'Veliki koncert oduševio publiku i napunio dvoranu do posljednjeg mjesta', 'Poznati glazbeni izvođač održao je spektakularan koncert pred brojnom publikom i priredio večer za pamćenje.', 'Sinoć je održan veliki glazbeni koncert koji je privukao velik broj posjetitelja i ispunio dvoranu do posljednjeg mjesta. Publika je od samog početka bila odlično raspoložena, a atmosfera je postajala sve bolja sa svakom izvedenom pjesmom.\r\n\r\nIzvođač je koncert otvorio jednim od svojih najpoznatijih hitova, što je odmah izazvalo oduševljenje prisutnih. Tijekom večeri nizale su se popularne pjesme, a publika je gotovo svaku pjevala zajedno s izvođačem.\r\n\r\nPoseban trenutak koncerta dogodio se kada je izvedena emotivna balada uz prigušena svjetla i pratnju publike. Taj dio nastupa izazvao je veliki pljesak i pokazao snažnu povezanost izvođača s obožavateljima.\r\n\r\nKoncert je završio energičnim nastupom i velikim ovacijama. Organizatori su istaknuli da su zadovoljni posjećenošću i atmosferom, dok su mnogi posjetitelji nakon koncerta komentirali kako je riječ o jednom od najboljih nastupa ove godine.', 'national.jpg', 'Glazba', 1),
(6, '11.06.2026.', 'Magična noć u Madridu', 'Pobjeda nogometaša Betisa protiv Real Madrida. Rezultat 3-0.', '.......', 'lainez.jpg', 'Sport', 0),
(7, '11.06.2026.', 'Testna sportska vijest', 'Vijest', '.....', 'lobos.jpg', 'Sport', 1),
(8, '11.06.2026.', 'Glazbena noć u Zagrebu', '...........', 'Spektakl u Zagrebu!', 'lobos.jpg', 'Glazba', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `korisnicko_ime` (`korisnicko_ime`);

--
-- Indexes for table `vijesti`
--
ALTER TABLE `vijesti`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vijesti`
--
ALTER TABLE `vijesti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
