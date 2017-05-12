-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 12-Maio-2017 às 03:34
-- Versão do servidor: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `livro_caixa`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `lc_cat`
--

CREATE TABLE `lc_cat` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `lc_cat`
--

INSERT INTO `lc_cat` (`id`, `nome`) VALUES
(1, 'teste'),
(2, 'teste'),
(3, 'teste'),
(4, 'Gasolina'),
(5, 'Recebimento'),
(6, 'teste222');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lc_movimento`
--

CREATE TABLE `lc_movimento` (
  `id` int(11) NOT NULL,
  `tipo` int(11) DEFAULT NULL,
  `dia` int(11) DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `cat` int(11) DEFAULT NULL,
  `descricao` longtext,
  `valor` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `lc_movimento`
--

INSERT INTO `lc_movimento` (`id`, `tipo`, `dia`, `mes`, `ano`, `cat`, `descricao`, `valor`) VALUES
(1, 0, 1, 5, 2017, 4, 'Ida pra belem', 200),
(2, 1, 1, 5, 2017, 5, 'Referente ', 1000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `senha` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `usuario`, `senha`) VALUES
(3, 'UsuÃ¡rio administrador', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997'),
(10, 'prei', 'prei', '1861495c57fd3687e6e0e9ff72087c3f5f8a90a2'),
(12, 'teste', 'teste', '2e6f9b0d5885b6010f9167787445617f553a735f'),
(13, 'teste2', 'teste2', '96a62ca98bdec7f55343f8cfa594379bdba76cc9');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lc_cat`
--
ALTER TABLE `lc_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lc_movimento`
--
ALTER TABLE `lc_movimento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lc_cat`
--
ALTER TABLE `lc_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `lc_movimento`
--
ALTER TABLE `lc_movimento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
