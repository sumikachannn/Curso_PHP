-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 03-Mar-2020 às 13:27
-- Versão do servidor: 10.1.37-MariaDB
-- versão do PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_agenda`
--
CREATE DATABASE IF NOT EXISTS `bd_agenda` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bd_agenda`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_contatos`
--

CREATE TABLE `tb_contatos` (
  `id_contato` int(4) NOT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `fone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `data_cadastro` date DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `obs` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_contatos`
--

INSERT INTO `tb_contatos` (`id_contato`, `nome`, `fone`, `email`, `data_cadastro`, `nascimento`, `obs`) VALUES
(6, 'Paulo Ambrosio', '(41) 98787-0909', 'pauloamb@gmail.com', '2020-02-14', NULL, NULL),
(7, 'Renata Soares', '(65)99090-8787', 'renatasoares@terra.com.br', '2020-02-14', NULL, NULL),
(8, 'Raul Seixas', '(44)99887-6767', 'rseixas@gmail.com', '2020-02-14', NULL, NULL),
(9, 'Valdirene Novaes', '(65)98776-9898', 'valdirene@gmail.com', '2020-02-14', NULL, NULL),
(10, 'Claudia Leite', '(41)98776-9898', 'claudialeite@terra.com.br', '2020-02-14', NULL, 'ObservaÃ§Ã£o da Claudia Leite '),
(13, 'Bruna Silva 2', '(41)98787-4545', 'brunaaguiar@terra.com.br', '2020-02-22', NULL, 'Filho fez cirurgia em 2010'),
(14, 'Igor Almeida', '(41)98765-8989', 'igor@fioluz.com.br', '2020-02-22', NULL, ''),
(15, 'Paulo de Tarso', '', '', '2020-02-22', NULL, ''),
(16, 'Regina Amaral', '(65)97676-0909', 'reginamaral@terra.com.br', '2020-02-24', NULL, 'Mora no sobrado cinza'),
(18, 'DÃ©bora Cortez da Rocha', '(41)99854-2323', 'deboracortez@hotmail.com', '2020-02-24', NULL, 'Obs de DÃ©bora'),
(20, 'FabÃ­ola Juarez', '(41)95432-9876', 'fabiolaj@gmail.com', '2020-02-24', NULL, 'ObservaÃ§Ã£o de FabÃ­ola'),
(21, 'Gabriel Nunes Oliveira', '(65)98765-9887', 'gabrieloliveira@hotmail.com', '2020-02-24', NULL, 'Filho da Dona Maria'),
(22, 'Helena de Avalor', '(43)87656-7654', 'helenadeavalor@gmail.com', '2020-02-24', NULL, 'ObservaÃ§Ã£o de Helena'),
(23, 'Jurandir GonÃ§alves', '(41)98765-9090', 'jurandir45@gmail.com', '2020-02-24', NULL, 'Marido da Helena'),
(24, 'Kelvin Andrade Melo', '(41)98765-2323', 'kelvinandrade@hotmail.com', '2020-02-24', NULL, 'Filho da Aldrin Lemans'),
(25, 'Marta Mueller Jonas', '(41)97665-0909', 'martamueller@sestro.com.br', '2020-02-24', NULL, 'Esposa do proprietÃ¡rio'),
(26, 'Nadir Figueiredo', '(98)99089-7676', 'nadirf@gmail.com', '2020-02-24', NULL, 'S/ obs'),
(27, 'Osvaldo Aranha', '(42)95656-2323', 'osvaldo@gmail.com', '2020-02-24', NULL, 'S/ obs'),
(28, 'Samanta Reis', '(41)98765-3434', 'samantareis@gmail.com', '2020-02-24', NULL, 's/ obs'),
(29, 'Teodoro Fonseca Albuquerque', '(41)98765-8765', 'teodorofonse@gmail.com', '2020-02-25', NULL, 's/ obs'),
(30, 'Wagner Silva', '(89)98787-6565', 'wagnerh@gmail.com', '2020-02-25', NULL, 's/ obs.'),
(31, 'Ulisses Almeida', '(41)98765-0987', 'ulissesalmeida@gmail.com', '2020-02-25', NULL, 'Dono da empresa Fiolan S.A.'),
(32, 'Lauro Munhoz Vasconcelos', '(41)98765-9098', 'lauro@gmail.com', '2020-02-25', NULL, 's/ obs.'),
(33, 'Leonice Nunes', '(41)98765-5432', 'leonice@gmail.com', '2020-02-26', NULL, 's/ obs.'),
(34, 'Carlos Alberto Faze', '(41)98765-9090', 'carlosalberto@gmail.com', '2020-02-26', NULL, 'SÃ³cio majoritÃ¡rio da empresa Luminix'),
(35, 'Turma 2Âº MÃ³dulo tarde', '', 'turma2mod@gmail.com', '2020-02-26', NULL, 'Turma da tarde'),
(36, 'Yasmin Macedo Silva', '(41)99123-4534', 'yasminms@gmail.com', '2020-02-26', NULL, 'Filha da Leonice Alves'),
(37, 'Leandro Malucelli', '(41)98754-9887', 'leandrom@malucelli.com.br', '2020-02-26', NULL, 'Dono da empresa javix materiais elÃ©tricos'),
(38, 'Fabio Antunes', '(41)98787-4545', 'fabioantunes@gmail.com', '2020-02-27', NULL, 'Siate'),
(40, 'Tadeu Novaes', '(41)99876-0909', 'tadeun@gmail.com', '2020-03-03', '1976-01-31', 'Obs de Tadeu'),
(41, 'Alfredo', '(41)98765-0909', 'alfredom@gmail.com', '2020-03-03', '2020-03-03', 'obs');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_contatos`
--
ALTER TABLE `tb_contatos`
  ADD PRIMARY KEY (`id_contato`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_contatos`
--
ALTER TABLE `tb_contatos`
  MODIFY `id_contato` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
