-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13-Nov-2021 às 03:28
-- Versão do servidor: 10.4.21-MariaDB
-- versão do PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `app_gerenciamento_concessionaria`
--

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_adicionar_usuario` (IN `senhadousuario` VARCHAR(40), IN `emaildousuario` VARCHAR(120), IN `usernamedousuario` VARCHAR(60))  BEGIN
SELECT * FROM tb_usuario;
INSERT INTO `tb_usuario` (cod_usuario,senha,confirmar_senha,email,username)
VALUES (DEFAULT,md5(senhadousuario),md5(senhadousuario),emaildousuario,usernamedousuario);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_criar_conta_cliente` (IN `senhadousuario` VARCHAR(40), IN `emaildousuario` VARCHAR(120), IN `usernamedousuario` VARCHAR(60), IN `siglaufusuario` CHAR(2), `municipiousuario` VARCHAR(30), `logradourousuario` VARCHAR(120), `residencialusuario` INT(6), `aptcliente` VARCHAR(10), `cepcliente` CHAR(11), `tipo_telefonecliente` INT(1), `numerotelefonecliente` VARCHAR(19), `cpfcliente` VARCHAR(14), `cnpjcliente` VARCHAR(18), `rgcliente` VARCHAR(12), `nomecliente` VARCHAR(60))  BEGIN
SELECT * FROM tb_usuario;
INSERT INTO `tb_usuario` (cod_usuario,senha,confirmar_senha,email,username)
VALUES (DEFAULT,md5(senhadousuario),md5(senhadousuario),emaildousuario,usernamedousuario);
SET @codigousuariosort = (SELECT cod_usuario FROM tb_usuario ORDER BY cod_usuario DESC LIMIT 1);
SELECT * FROM tb_endereco;
INSERT INTO `tb_endereco` (cod_endereco,sigla_uf,municipio,logradouro,numero_residencial,numero_apartamento,cep_endereco,cod_usuario)
VALUES (DEFAULT,siglaufusuario,municipiousuario,logradourousuario,residencialusuario,aptcliente,cepcliente,@codigousuariosort);
SELECT * FROM tb_notificacao;
INSERT INTO `tb_notificacao`
VALUES (DEFAULT,'1','1',@codigousuariosort);
SELECT * FROM tb_telefone;
INSERT INTO `tb_telefone`
VALUES (DEFAULT,tipo_telefonecliente,numerotelefonecliente,@codigousuariosort);
SELECT * FROM tb_documentos_usuario;
INSERT INTO `tb_documentos_usuario`
VALUES (DEFAULT,cpfcliente,cnpjcliente,rgcliente,@codigousuariosort);
SELECT * FROM tb_cliente;
INSERT INTO `tb_cliente`
VALUES (DEFAULT,nomecliente,@codigousuariosort);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_criar_conta_colab` (IN `senhadousuario` VARCHAR(40), IN `emaildousuario` VARCHAR(120), IN `usernamedousuario` VARCHAR(60), IN `siglaufusuario` CHAR(2), IN `municipiousuario` VARCHAR(30), IN `logradourousuario` VARCHAR(120), `residencialusuario` INT(6), `aptcolab` VARCHAR(10), `cepcolab` CHAR(11), `tipo_telefonecolab` INT(1), `numerotelefonecolab` VARCHAR(19), `cpfcolab` VARCHAR(14), `cnpjcolab` VARCHAR(18), `rgcolab` VARCHAR(12), `nomecolab` VARCHAR(60), `cargocolab` VARCHAR(20))  BEGIN
SELECT * FROM tb_usuario;
INSERT INTO `tb_usuario` (cod_usuario,senha,confirmar_senha,email,username)
VALUES (DEFAULT,md5(senhadousuario),md5(senhadousuario),emaildousuario,usernamedousuario);
SET @codigousuariosort = (SELECT cod_usuario FROM tb_usuario ORDER BY cod_usuario DESC LIMIT 1);
SELECT * FROM tb_endereco;
INSERT INTO `tb_endereco` (cod_endereco,sigla_uf,municipio,logradouro,numero_residencial,numero_apartamento,cep_endereco,cod_usuario)
VALUES (DEFAULT,siglaufusuario,municipiousuario,logradourousuario,residencialusuario,aptcolab,cepcolab,@codigousuariosort);
SELECT * FROM tb_telefone;
INSERT INTO `tb_telefone`
VALUES (DEFAULT,tipo_telefonecolab,numerotelefonecolab,@codigousuariosort);
SELECT * FROM tb_documentos_usuario;
INSERT INTO `tb_documentos_usuario`
VALUES (DEFAULT,cpfcolab,cnpjcolab,rgcolab,@codigousuariosort);
SELECT * FROM tb_colaboradores;
INSERT INTO `tb_colaboradores`
VALUES (DEFAULT,nomecolab,cargocolab,'0','0','0',@codigousuariosort);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_criar_conta_concessionaria` (IN `senhadousuario` VARCHAR(40), IN `emaildousuario` VARCHAR(120), IN `usernamedousuario` VARCHAR(60), IN `siglaufusuario` CHAR(2), `municipiousuario` VARCHAR(30), `logradourousuario` VARCHAR(120), `residencialusuario` INT(6), `cepconc` CHAR(11), `tipo_telefoneconc` INT(1), `numerotelefoneconc` VARCHAR(19), `cnpjconc` VARCHAR(18), `nomeconc` VARCHAR(60))  BEGIN
SELECT * FROM tb_usuario;
INSERT INTO `tb_usuario` (cod_usuario,senha,confirmar_senha,email,username)
VALUES (DEFAULT,md5(senhadousuario),md5(senhadousuario),emaildousuario,usernamedousuario);
SET @codigousuariosort = (SELECT cod_usuario FROM tb_usuario ORDER BY cod_usuario DESC LIMIT 1);
SELECT * FROM tb_endereco;
INSERT INTO `tb_endereco` (cod_endereco,sigla_uf,municipio,logradouro,numero_residencial,numero_apartamento,cep_endereco,cod_usuario)
VALUES (DEFAULT,siglaufusuario,municipiousuario,logradourousuario,residencialusuario,'',cepconc,@codigousuariosort);
SELECT * FROM tb_telefone;
INSERT INTO `tb_telefone`
VALUES (DEFAULT,tipo_telefoneconc,numerotelefoneconc,@codigousuariosort);
SELECT * FROM tb_documentos_usuario;
INSERT INTO `tb_documentos_usuario`
VALUES (DEFAULT,'',cnpjconc,'',@codigousuariosort);
SELECT * FROM tb_concessionarias;
INSERT INTO `tb_concessionarias`
VALUES (DEFAULT,nomeconc,@codigousuariosort);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_ano_veiculo`
--

CREATE TABLE `tb_ano_veiculo` (
  `cod_ano_veiculo` int(9) NOT NULL,
  `ano_veiculo` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cliente`
--

CREATE TABLE `tb_cliente` (
  `cod_cliente` int(9) NOT NULL,
  `nome_cliente` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_usuario` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tb_cliente`
--

INSERT INTO `tb_cliente` (`cod_cliente`, `nome_cliente`, `cod_usuario`) VALUES
(1, 'Catarina Cristiane Sônia Monteiro', 31),
(2, 'Josefa Agatha Porto', 32),
(3, 'Carlos Eduardo Heitor Lucca Aparício', 33),
(4, 'Ester Aurora Milena Rezende', 34),
(5, 'Hadassa Lara Martins', 35),
(6, 'Gustavo Cláudio Francisco Rezende', 36),
(7, 'Marcos Joaquim Cavalcanti', 37),
(8, 'Gael Henry Dias', 38),
(9, 'Igor Heitor Porto', 39),
(10, 'Maria Tatiane Laura Aragão', 40),
(11, 'Marina Francisca Lavínia Baptista', 41),
(12, 'Isabelle e Daniel Vidros ME', 42),
(13, 'Pedro Henrique e Nina Transportes ME', 43),
(14, 'Maya e Raquel Casa Noturna Ltda', 44),
(15, 'Beatriz e Sophia Advocacia ME', 45),
(16, 'Bernardo e Leonardo Telecomunicações Ltda', 46);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_colaboradores`
--

CREATE TABLE `tb_colaboradores` (
  `cod_colab` int(9) NOT NULL,
  `nome_colab` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cargo_colab` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `horas_trabalhadas` int(3) DEFAULT NULL,
  `horas_atestado` int(3) DEFAULT NULL,
  `ranking_colab` int(3) DEFAULT NULL,
  `cod_usuario` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_concessionarias`
--

CREATE TABLE `tb_concessionarias` (
  `cod_conc` int(9) NOT NULL,
  `nome_conc` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_usuario` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tb_concessionarias`
--

INSERT INTO `tb_concessionarias` (`cod_conc`, `nome_conc`, `cod_usuario`) VALUES
(1, 'Henry e Renata Concessionaria Ltda', 47),
(2, 'Luana Concessionaria', 48),
(3, 'Yuri Usados', 49),
(4, 'Ford Motor Company Brasil LTDA', 50),
(5, 'HYUNDAI MOTOR BRASIL MONTADORA DE AUTOMOVEIS LTDA', 51);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_conversa`
--

CREATE TABLE `tb_conversa` (
  `cod_conversa` int(9) NOT NULL,
  `data_conv` date DEFAULT NULL,
  `tipo_conversa` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chat_history` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_conversa_ref`
--

CREATE TABLE `tb_conversa_ref` (
  `cod_ref_conv` int(9) NOT NULL,
  `cod_transacao` int(9) DEFAULT NULL,
  `cod_colab` int(9) DEFAULT NULL,
  `cod_cliente` int(9) DEFAULT NULL,
  `cod_forn` int(9) DEFAULT NULL,
  `cod_conc` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cor_veiculos`
--

CREATE TABLE `tb_cor_veiculos` (
  `cod_cor_veiculo` int(9) NOT NULL,
  `cor_veiculo` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cor_original` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_documentos_usuario`
--

CREATE TABLE `tb_documentos_usuario` (
  `cod_documento` int(9) NOT NULL,
  `cpf_docu` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cnpj_docu` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rg_docu` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_usuario` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tb_documentos_usuario`
--

INSERT INTO `tb_documentos_usuario` (`cod_documento`, `cpf_docu`, `cnpj_docu`, `rg_docu`, `cod_usuario`) VALUES
(1, '201.316.119-09', '', '18.348.705-9', 31),
(2, '746.959.909-62', '', '41.769.577-9', 32),
(3, '998.140.309-10', '', '14.650.900-8', 33),
(4, '261.985.099-15', '', '19.943.476-1', 34),
(5, '273.481.099-93', '', '32.762.236-2', 35),
(6, '175.935.99-81', '', '36.562.937-6', 36),
(7, '859.226.969-55', '', '37.038.853-7', 37),
(8, '804.215.739-88', '', '19.552.301-5', 38),
(9, '247.966.059-16', '', '47.823.542-2', 39),
(10, '778.748.099-80', '', '49.048.272-7', 40),
(11, '071.719.559-74', '', '43.063.664-7', 41),
(12, '', '19.807.787/0001-26', '', 42),
(13, '', '72.444.490/0001-26', '', 43),
(14, '', '81.168.163/0001-80', '', 44),
(15, '', '22.987.886/0001-41', '', 45),
(16, '', '54.267.260/0001-57', '', 46),
(17, '', '91.900.312/0001-07', '', 47),
(18, '', '62.323.154/0001-71', '', 48),
(19, '', '13.972.093/0001-68', '', 49),
(20, '', '03.470.727/0023-36', '', 50),
(21, '', '10.394.422/0001-42', '', 51);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_endereco`
--

CREATE TABLE `tb_endereco` (
  `cod_endereco` int(9) NOT NULL,
  `sigla_uf` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `municipio` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logradouro` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_residencial` int(6) DEFAULT NULL,
  `numero_apartamento` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cep_endereco` char(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_usuario` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tb_endereco`
--

INSERT INTO `tb_endereco` (`cod_endereco`, `sigla_uf`, `municipio`, `logradouro`, `numero_residencial`, `numero_apartamento`, `cep_endereco`, `cod_usuario`) VALUES
(1, 'PR', 'Curitiba', 'Rua Elza de Lara Zanelatto', 902, '', '81720-480', 31),
(2, 'PR', 'Curitiba', 'Rua Coronel Adolfo Guimarães', 598, 'apt.2', '82520-460', 32),
(3, 'PR', 'Curitiba', 'Rua João Manoel Geremias', 838, '', '82720-400', 33),
(4, 'PR', 'Curitiba', 'Avenida Prefeito Maurício Fruet', 375, '', '80210-370', 34),
(5, 'PR', 'Curitiba', 'Rua Antônio Falcão', 390, '', '82025-110', 35),
(6, 'PR', 'Curitiba', 'Rua Desembargador Motta', 870, '', '80420-190', 36),
(7, 'PR', 'Curitiba', 'Rua Carlos Pioli', 117, '', '80520-170', 37),
(8, 'PR', 'Curitiba', 'Rua Maria Eudóxia Cortiano', 356, '', '81940-100', 38),
(9, 'PR', 'Curitiba', 'Rua Cléia Mara Pereira Gomes', 801, '', '81450-680', 39),
(10, 'PR', 'Curitiba', 'Raul Joaquim Marcos Aragão', 563, '', '81540-110', 40),
(11, 'PR', 'Curitiba', 'Rua Júlia Huga Maria Negrello', 560, 'Apt. 304', '81930-576', 41),
(12, 'PR', 'São José dos Pinhais', 'Rua Antônio de Araújo Silveira', 526, '', '83090-462', 42),
(13, 'PR', 'Pato Branco', 'Rodovia PR-493', 115, '', '85503-378', 43),
(14, 'PR', 'Curitiba', 'Rua Atílio Pilatti', 490, '', '81810-540', 44),
(15, 'PR', 'Curitiba', 'Travessa Pedro Lazari', 880, '', '81920-216', 45),
(16, 'PR', 'Guarapuava', 'Rua Porto União', 667, '', '81920-216', 46),
(17, 'PR', 'Curitiba', 'Rua João Pereira Trindade', 537, '', '81490-040', 47),
(18, 'PR', 'Curitiba', 'Avenida Martiniano do Valle Filho', 933, '', '86010-342', 48),
(19, 'PR', 'Curitiba', 'Avenida Adão Arcângelo Dal Bem', 996, '', '87595-971', 49),
(20, 'BA', 'Salvador', 'Estrada da Iasa', NULL, '', '41297-355', 50),
(21, 'SP', 'Piracicaba', 'Avenida Hyundai', 777, '', '13413-900', 51);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_fornecedores`
--

CREATE TABLE `tb_fornecedores` (
  `cod_forn` int(9) NOT NULL,
  `nome_forn` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_usuario` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_galeria_veiculo`
--

CREATE TABLE `tb_galeria_veiculo` (
  `cod_galeria_veiculo` int(9) NOT NULL,
  `foto_frente` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_direita` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_esquerda` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_traseira` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_interior` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_deck` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_historico_preco`
--

CREATE TABLE `tb_historico_preco` (
  `cod_historico` int(9) NOT NULL,
  `preco_original` decimal(9,2) DEFAULT NULL,
  `preco_novo` decimal(9,2) DEFAULT NULL,
  `cod_produto` int(9) DEFAULT NULL,
  `cod_veiculo_novo` int(9) DEFAULT NULL,
  `cod_veiculo_snovo` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_marca`
--

CREATE TABLE `tb_marca` (
  `cod_marca` int(9) NOT NULL,
  `nome_marca` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pais_marca` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descricao_marca` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qtd_modelos` int(4) DEFAULT NULL,
  `ultimo_modelo` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_notificacao`
--

CREATE TABLE `tb_notificacao` (
  `cod_notificacao` int(9) NOT NULL,
  `notif_servico` int(1) DEFAULT NULL,
  `notif_oferta` int(1) DEFAULT NULL,
  `cod_usuario` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tb_notificacao`
--

INSERT INTO `tb_notificacao` (`cod_notificacao`, `notif_servico`, `notif_oferta`, `cod_usuario`) VALUES
(1, 1, 1, 31),
(2, 1, 1, 32),
(3, 1, 1, 33),
(4, 1, 1, 34),
(5, 1, 1, 35),
(6, 1, 1, 36),
(7, 1, 1, 37),
(8, 1, 1, 38),
(9, 1, 1, 39),
(10, 1, 1, 40),
(11, 1, 1, 41),
(12, 1, 1, 42),
(13, 1, 1, 43),
(14, 1, 1, 44),
(15, 1, 1, 45),
(16, 1, 1, 46);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_parcelado`
--

CREATE TABLE `tb_parcelado` (
  `cod_parcela` int(9) NOT NULL,
  `qtd_parcelas` int(3) DEFAULT NULL,
  `valor_parcelas` decimal(9,2) DEFAULT NULL,
  `cod_transacao` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_produtos`
--

CREATE TABLE `tb_produtos` (
  `cod_produto` int(9) NOT NULL,
  `nome_produto` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valor_produto` decimal(9,2) DEFAULT NULL,
  `categoria_produto` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qtd_produto` int(3) DEFAULT NULL,
  `disponibilidade_produto` int(1) DEFAULT NULL,
  `cod_forn` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_renegociado`
--

CREATE TABLE `tb_renegociado` (
  `cod_renegociado` int(9) NOT NULL,
  `valor_renegociado` decimal(9,2) DEFAULT NULL,
  `qtd_parcelas_renegociado` int(3) DEFAULT NULL,
  `cod_transacao` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_servicos`
--

CREATE TABLE `tb_servicos` (
  `cod_servico` int(9) NOT NULL,
  `tipo_servico` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_servico_comeco` date DEFAULT NULL,
  `data_servico_finalizado` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_telefone`
--

CREATE TABLE `tb_telefone` (
  `cod_telefone` int(9) NOT NULL,
  `tipo_telefone` int(1) DEFAULT NULL,
  `numero_telefone` varchar(19) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_usuario` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tb_telefone`
--

INSERT INTO `tb_telefone` (`cod_telefone`, `tipo_telefone`, `numero_telefone`, `cod_usuario`) VALUES
(1, 1, '41982212058', 31),
(2, 0, '4135417066', 32),
(3, 1, '41983108605', 33),
(4, 1, '4198476739', 34),
(5, 1, '41998771301', 35),
(6, 0, '413706-4930', 36),
(7, 1, '41991859091', 37),
(8, 1, '41995728189', 38),
(9, 1, '41998969341', 39),
(10, 1, '41988648738', 40),
(11, 1, '41987722680', 41),
(12, 0, '4127689308', 42),
(13, 0, '4638758085', 43),
(14, 1, '41994780507', 44),
(15, 1, '41987805684', 45),
(16, 1, '41987805684', 46),
(17, 0, '4125367387', 47),
(18, 0, '4129042442', 48),
(19, 0, '4127042379', 49),
(20, 0, '1141748855', 50),
(21, 0, '1933730000', 51);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_transacao`
--

CREATE TABLE `tb_transacao` (
  `cod_transacao` int(9) NOT NULL,
  `valor_transacao` decimal(9,2) DEFAULT NULL,
  `qtd_comprada` int(3) DEFAULT NULL,
  `cod_servico` int(9) DEFAULT NULL,
  `cod_colab` int(9) DEFAULT NULL,
  `cod_cliente` int(9) DEFAULT NULL,
  `cod_forn` int(9) DEFAULT NULL,
  `cod_conc` int(9) DEFAULT NULL,
  `cod_veiculo_novo` int(9) NOT NULL,
  `cod_veiculo_snovo` int(9) NOT NULL,
  `cod_produto` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `cod_usuario` int(9) NOT NULL,
  `senha` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmar_senha` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tb_usuario`
--

INSERT INTO `tb_usuario` (`cod_usuario`, `senha`, `confirmar_senha`, `email`, `username`) VALUES
(31, 'f8102bee10fb6f38631217aab9bfbd35', 'f8102bee10fb6f38631217aab9bfbd35', 'ccatarinacristianesoniamonteiro@attglobal.net', 'caratinamont'),
(32, '9a467b16c6fec7ac9dad34cfc0e1e158', '9a467b16c6fec7ac9dad34cfc0e1e158', 'josefaagathaporto..josefaagathaporto@desir.com.br', 'JosefaaaaaaaP'),
(33, '816ab20018f403720a6c5b2e04833dfa', '816ab20018f403720a6c5b2e04833dfa', 'carloseduardoheitorluccaaparicio__carloseduardoheitorluccaaparicio@sanidet.com.br', 'LukarlosAparição'),
(34, '8478d385f7e1ce438dbf13b5041c05df', '8478d385f7e1ce438dbf13b5041c05df', 'esterauroramilenarezende-81@centrooleo.com.br', 'EsterEgg'),
(35, 'd105cb33a9accbba8a3bbc03acf24a74', 'd105cb33a9accbba8a3bbc03acf24a74', 'hhadassalaramartins@oana.com.br', 'LaraHadassa'),
(36, '490aeec650000a341e6b9c428ecbc8fd', '490aeec650000a341e6b9c428ecbc8fd', 'gustavoclaudiofranciscorezende..gustavoclaudiofranciscorezende@ritmolog.com.br', 'claudio_gu102929'),
(37, 'b9ef0ea79af7924e883093c8c021767c', 'b9ef0ea79af7924e883093c8c021767c', 'marcosjoaquimcavalcanti_@zignani.com.br', 'CavalcantiJo'),
(38, 'b94248b4f399744e5280a3eaaec32ae1', 'b94248b4f399744e5280a3eaaec32ae1', 'gaelhenrydias..gaelhenrydias@viamoc.com.br', 'Gael_dq'),
(39, '67f6f416e2869683cf540840fdc705d7', '67f6f416e2869683cf540840fdc705d7', 'igorheitorporto__igorheitorporto@santosferreira.abv.br', 'HPLovegor'),
(40, '284446070e3120a090b0c60db180dc18', '284446070e3120a090b0c60db180dc18', 'mariatatianelauraaragao_@thibe.com.br', 'MariaAragão'),
(41, 'f10ae4d8e9a9416c3231c22b130f640d', 'f10ae4d8e9a9416c3231c22b130f640d', 'marinafranciscalaviniabaptista__marinafranciscalaviniabaptista@poolrescue.com.br', 'Marinachan'),
(42, 'bfc32fca41cbe5b83e9c4a356fac1a2b', 'bfc32fca41cbe5b83e9c4a356fac1a2b', 'tesouraria@isabelleedanielvidrosme.com.br', 'IsaDanVidros'),
(43, 'a1c3cac6cbddad456d6958ff12e3d91e', 'a1c3cac6cbddad456d6958ff12e3d91e', 'cobranca@pedrohenriqueeninatransportesme.com.br', 'transportesme'),
(44, 'ee83dab2484416b6af6a329d9318c3db', 'ee83dab2484416b6af6a329d9318c3db', 'producao@mayaeraquelcasanoturnaltda.com.br', 'MayaeRaquelCasaNoturna'),
(45, 'c1ccf1e0f88b065d3d9d4b656f923f34', 'c1ccf1e0f88b065d3d9d4b656f923f34', 'cobranca@beatrizesophiaadvocaciame.com.br', 'BeatrizeSophiaAdvocacia'),
(46, '4414c69f3d76d7dadcb3edd906e3ab5d', '4414c69f3d76d7dadcb3edd906e3ab5d', 'fabricacao@bernardoeleonardotelecomunicacoesltda.com.br', 'BeLTelecom'),
(47, 'e685d30cc6d37e5624127895df8d8f3a', 'e685d30cc6d37e5624127895df8d8f3a', 'contato@henryerenataconcessionarialtda.com.br', 'HenryERenata'),
(48, 'f12de5ce60d237444cee622889965acb', 'f12de5ce60d237444cee622889965acb', 'atendimento@luanaconcessionaria.com.br', 'LuanaConcessionria'),
(49, '1c0f149eded2c2a25a05fb1e1d4e4bf6', '1c0f149eded2c2a25a05fb1e1d4e4bf6', 'contato@yuriusados.com.br', 'YuriUsados'),
(50, '19b71f3b5f5630d7b44e71e00282a29a', '19b71f3b5f5630d7b44e71e00282a29a', 'notific1@ford.com', 'fordmotorsbrasil'),
(51, 'b15daf61635b8291a17e98d2e256fac5', 'b15daf61635b8291a17e98d2e256fac5', 'carlos.morais@hyundai-brasil.com', 'HyundaiMotorBrasil');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_veiculos`
--

CREATE TABLE `tb_veiculos` (
  `cod_veiculo` int(9) NOT NULL,
  `modelo_veiculo` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `motor_veiculo` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `combustivel_veiculo` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `funcoes_veiculo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cambio_veiculo` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoria_veiculo` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanque_veiculo` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `porta_malas_veiculo` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ocupantes_veiculo` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suspensao_veiculo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracao_veiculo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cod_marca` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_veiculos_novos`
--

CREATE TABLE `tb_veiculos_novos` (
  `cod_veiculo_novo` int(9) NOT NULL,
  `preco_veiculo_novo` decimal(9,2) DEFAULT NULL,
  `estoque_novo` int(3) DEFAULT NULL,
  `disponibilidade_novo` int(1) DEFAULT NULL,
  `cod_galeria_veiculo` int(9) DEFAULT NULL,
  `cod_cor_veiculo` int(9) DEFAULT NULL,
  `cod_ano_veiculo` int(9) DEFAULT NULL,
  `cod_conc` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_veiculos_snovos`
--

CREATE TABLE `tb_veiculos_snovos` (
  `cod_veiculo_snovo` int(9) NOT NULL,
  `preco_veiculo_snovo` decimal(9,2) DEFAULT NULL,
  `cod_veiculo_usado` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_veiculos_usados`
--

CREATE TABLE `tb_veiculos_usados` (
  `cod_veiculo_usado` int(9) NOT NULL,
  `km_veiculo` decimal(6,3) DEFAULT NULL,
  `placa_veiculo` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ultima_revisao` date DEFAULT NULL,
  `disponibilidade_venda` int(1) DEFAULT NULL,
  `cod_veiculo` int(9) DEFAULT NULL,
  `cod_cliente` int(9) DEFAULT NULL,
  `cod_conc` int(9) DEFAULT NULL,
  `cod_galeria_veiculo` int(9) DEFAULT NULL,
  `cod_cor_veiculo` int(9) DEFAULT NULL,
  `cod_ano_veiculo` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_vendedores`
--

CREATE TABLE `tb_vendedores` (
  `cod_vendedores` int(9) NOT NULL,
  `numero_vendas` int(3) DEFAULT NULL,
  `valor_total_vendas` decimal(9,2) DEFAULT NULL,
  `cod_colab` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_dados_cliente`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_dados_cliente` (
`cod_usuario` int(9)
,`senha` varchar(40)
,`email` varchar(120)
,`username` varchar(60)
,`nome_cliente` varchar(60)
,`sigla_uf` char(2)
,`municipio` varchar(30)
,`logradouro` varchar(120)
,`numero_residencial` int(6)
,`numero_apartamento` varchar(10)
,`cep_endereco` char(11)
,`numero_telefone` varchar(19)
,`cpf_docu` varchar(14)
,`cnpj_docu` varchar(18)
,`rg_docu` varchar(12)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_dados_cliente_fisico`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_dados_cliente_fisico` (
`cod_usuario` int(9)
,`senha` varchar(40)
,`email` varchar(120)
,`username` varchar(60)
,`nome_cliente` varchar(60)
,`sigla_uf` char(2)
,`municipio` varchar(30)
,`logradouro` varchar(120)
,`numero_residencial` int(6)
,`numero_apartamento` varchar(10)
,`cep_endereco` char(11)
,`numero_telefone` varchar(19)
,`cpf_docu` varchar(14)
,`cnpj_docu` varchar(18)
,`rg_docu` varchar(12)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_dados_cliente_juridico`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_dados_cliente_juridico` (
`cod_usuario` int(9)
,`senha` varchar(40)
,`email` varchar(120)
,`username` varchar(60)
,`nome_cliente` varchar(60)
,`sigla_uf` char(2)
,`municipio` varchar(30)
,`logradouro` varchar(120)
,`numero_residencial` int(6)
,`numero_apartamento` varchar(10)
,`cep_endereco` char(11)
,`numero_telefone` varchar(19)
,`cpf_docu` varchar(14)
,`cnpj_docu` varchar(18)
,`rg_docu` varchar(12)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_dados_concessionaria`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_dados_concessionaria` (
`cod_usuario` int(9)
,`senha` varchar(40)
,`email` varchar(120)
,`username` varchar(60)
,`nome_conc` varchar(80)
,`sigla_uf` char(2)
,`municipio` varchar(30)
,`logradouro` varchar(120)
,`numero_residencial` int(6)
,`cep_endereco` char(11)
,`numero_telefone` varchar(19)
,`cnpj_docu` varchar(18)
);

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_dados_cliente`
--
DROP TABLE IF EXISTS `vw_dados_cliente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_dados_cliente`  AS SELECT `tb_usuario`.`cod_usuario` AS `cod_usuario`, `tb_usuario`.`senha` AS `senha`, `tb_usuario`.`email` AS `email`, `tb_usuario`.`username` AS `username`, `tb_cliente`.`nome_cliente` AS `nome_cliente`, `tb_endereco`.`sigla_uf` AS `sigla_uf`, `tb_endereco`.`municipio` AS `municipio`, `tb_endereco`.`logradouro` AS `logradouro`, `tb_endereco`.`numero_residencial` AS `numero_residencial`, `tb_endereco`.`numero_apartamento` AS `numero_apartamento`, `tb_endereco`.`cep_endereco` AS `cep_endereco`, `tb_telefone`.`numero_telefone` AS `numero_telefone`, `tb_documentos_usuario`.`cpf_docu` AS `cpf_docu`, `tb_documentos_usuario`.`cnpj_docu` AS `cnpj_docu`, `tb_documentos_usuario`.`rg_docu` AS `rg_docu` FROM ((((`tb_usuario` join `tb_cliente`) join `tb_endereco`) join `tb_telefone`) join `tb_documentos_usuario`) WHERE `tb_usuario`.`cod_usuario` = `tb_endereco`.`cod_usuario` AND `tb_usuario`.`cod_usuario` = `tb_telefone`.`cod_usuario` AND `tb_usuario`.`cod_usuario` = `tb_documentos_usuario`.`cod_usuario` AND `tb_usuario`.`cod_usuario` = `tb_cliente`.`cod_usuario` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_dados_cliente_fisico`
--
DROP TABLE IF EXISTS `vw_dados_cliente_fisico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_dados_cliente_fisico`  AS SELECT `tb_usuario`.`cod_usuario` AS `cod_usuario`, `tb_usuario`.`senha` AS `senha`, `tb_usuario`.`email` AS `email`, `tb_usuario`.`username` AS `username`, `tb_cliente`.`nome_cliente` AS `nome_cliente`, `tb_endereco`.`sigla_uf` AS `sigla_uf`, `tb_endereco`.`municipio` AS `municipio`, `tb_endereco`.`logradouro` AS `logradouro`, `tb_endereco`.`numero_residencial` AS `numero_residencial`, `tb_endereco`.`numero_apartamento` AS `numero_apartamento`, `tb_endereco`.`cep_endereco` AS `cep_endereco`, `tb_telefone`.`numero_telefone` AS `numero_telefone`, `tb_documentos_usuario`.`cpf_docu` AS `cpf_docu`, `tb_documentos_usuario`.`cnpj_docu` AS `cnpj_docu`, `tb_documentos_usuario`.`rg_docu` AS `rg_docu` FROM ((((`tb_usuario` join `tb_cliente`) join `tb_endereco`) join `tb_telefone`) join `tb_documentos_usuario`) WHERE `tb_usuario`.`cod_usuario` = `tb_endereco`.`cod_usuario` AND `tb_usuario`.`cod_usuario` = `tb_telefone`.`cod_usuario` AND `tb_usuario`.`cod_usuario` = `tb_documentos_usuario`.`cod_usuario` AND `tb_usuario`.`cod_usuario` = `tb_cliente`.`cod_usuario` AND `tb_documentos_usuario`.`cnpj_docu` = '' ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_dados_cliente_juridico`
--
DROP TABLE IF EXISTS `vw_dados_cliente_juridico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_dados_cliente_juridico`  AS SELECT `tb_usuario`.`cod_usuario` AS `cod_usuario`, `tb_usuario`.`senha` AS `senha`, `tb_usuario`.`email` AS `email`, `tb_usuario`.`username` AS `username`, `tb_cliente`.`nome_cliente` AS `nome_cliente`, `tb_endereco`.`sigla_uf` AS `sigla_uf`, `tb_endereco`.`municipio` AS `municipio`, `tb_endereco`.`logradouro` AS `logradouro`, `tb_endereco`.`numero_residencial` AS `numero_residencial`, `tb_endereco`.`numero_apartamento` AS `numero_apartamento`, `tb_endereco`.`cep_endereco` AS `cep_endereco`, `tb_telefone`.`numero_telefone` AS `numero_telefone`, `tb_documentos_usuario`.`cpf_docu` AS `cpf_docu`, `tb_documentos_usuario`.`cnpj_docu` AS `cnpj_docu`, `tb_documentos_usuario`.`rg_docu` AS `rg_docu` FROM ((((`tb_usuario` join `tb_cliente`) join `tb_endereco`) join `tb_telefone`) join `tb_documentos_usuario`) WHERE `tb_usuario`.`cod_usuario` = `tb_endereco`.`cod_usuario` AND `tb_usuario`.`cod_usuario` = `tb_telefone`.`cod_usuario` AND `tb_usuario`.`cod_usuario` = `tb_documentos_usuario`.`cod_usuario` AND `tb_usuario`.`cod_usuario` = `tb_cliente`.`cod_usuario` AND `tb_documentos_usuario`.`cnpj_docu` <> '' ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_dados_concessionaria`
--
DROP TABLE IF EXISTS `vw_dados_concessionaria`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_dados_concessionaria`  AS SELECT `tb_usuario`.`cod_usuario` AS `cod_usuario`, `tb_usuario`.`senha` AS `senha`, `tb_usuario`.`email` AS `email`, `tb_usuario`.`username` AS `username`, `tb_concessionarias`.`nome_conc` AS `nome_conc`, `tb_endereco`.`sigla_uf` AS `sigla_uf`, `tb_endereco`.`municipio` AS `municipio`, `tb_endereco`.`logradouro` AS `logradouro`, `tb_endereco`.`numero_residencial` AS `numero_residencial`, `tb_endereco`.`cep_endereco` AS `cep_endereco`, `tb_telefone`.`numero_telefone` AS `numero_telefone`, `tb_documentos_usuario`.`cnpj_docu` AS `cnpj_docu` FROM ((((`tb_usuario` join `tb_concessionarias`) join `tb_endereco`) join `tb_telefone`) join `tb_documentos_usuario`) WHERE `tb_usuario`.`cod_usuario` = `tb_endereco`.`cod_usuario` AND `tb_usuario`.`cod_usuario` = `tb_telefone`.`cod_usuario` AND `tb_usuario`.`cod_usuario` = `tb_documentos_usuario`.`cod_usuario` AND `tb_usuario`.`cod_usuario` = `tb_concessionarias`.`cod_usuario` ;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_ano_veiculo`
--
ALTER TABLE `tb_ano_veiculo`
  ADD PRIMARY KEY (`cod_ano_veiculo`);

--
-- Índices para tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD PRIMARY KEY (`cod_cliente`);

--
-- Índices para tabela `tb_colaboradores`
--
ALTER TABLE `tb_colaboradores`
  ADD PRIMARY KEY (`cod_colab`);

--
-- Índices para tabela `tb_concessionarias`
--
ALTER TABLE `tb_concessionarias`
  ADD PRIMARY KEY (`cod_conc`);

--
-- Índices para tabela `tb_conversa`
--
ALTER TABLE `tb_conversa`
  ADD PRIMARY KEY (`cod_conversa`);

--
-- Índices para tabela `tb_conversa_ref`
--
ALTER TABLE `tb_conversa_ref`
  ADD PRIMARY KEY (`cod_ref_conv`);

--
-- Índices para tabela `tb_cor_veiculos`
--
ALTER TABLE `tb_cor_veiculos`
  ADD PRIMARY KEY (`cod_cor_veiculo`);

--
-- Índices para tabela `tb_documentos_usuario`
--
ALTER TABLE `tb_documentos_usuario`
  ADD PRIMARY KEY (`cod_documento`);

--
-- Índices para tabela `tb_endereco`
--
ALTER TABLE `tb_endereco`
  ADD PRIMARY KEY (`cod_endereco`);

--
-- Índices para tabela `tb_fornecedores`
--
ALTER TABLE `tb_fornecedores`
  ADD PRIMARY KEY (`cod_forn`);

--
-- Índices para tabela `tb_galeria_veiculo`
--
ALTER TABLE `tb_galeria_veiculo`
  ADD PRIMARY KEY (`cod_galeria_veiculo`);

--
-- Índices para tabela `tb_historico_preco`
--
ALTER TABLE `tb_historico_preco`
  ADD PRIMARY KEY (`cod_historico`);

--
-- Índices para tabela `tb_marca`
--
ALTER TABLE `tb_marca`
  ADD PRIMARY KEY (`cod_marca`);

--
-- Índices para tabela `tb_notificacao`
--
ALTER TABLE `tb_notificacao`
  ADD PRIMARY KEY (`cod_notificacao`);

--
-- Índices para tabela `tb_parcelado`
--
ALTER TABLE `tb_parcelado`
  ADD PRIMARY KEY (`cod_parcela`);

--
-- Índices para tabela `tb_produtos`
--
ALTER TABLE `tb_produtos`
  ADD PRIMARY KEY (`cod_produto`);

--
-- Índices para tabela `tb_renegociado`
--
ALTER TABLE `tb_renegociado`
  ADD PRIMARY KEY (`cod_renegociado`);

--
-- Índices para tabela `tb_servicos`
--
ALTER TABLE `tb_servicos`
  ADD PRIMARY KEY (`cod_servico`);

--
-- Índices para tabela `tb_telefone`
--
ALTER TABLE `tb_telefone`
  ADD PRIMARY KEY (`cod_telefone`);

--
-- Índices para tabela `tb_transacao`
--
ALTER TABLE `tb_transacao`
  ADD PRIMARY KEY (`cod_transacao`);

--
-- Índices para tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`cod_usuario`);

--
-- Índices para tabela `tb_veiculos`
--
ALTER TABLE `tb_veiculos`
  ADD PRIMARY KEY (`cod_veiculo`);

--
-- Índices para tabela `tb_veiculos_novos`
--
ALTER TABLE `tb_veiculos_novos`
  ADD PRIMARY KEY (`cod_veiculo_novo`);

--
-- Índices para tabela `tb_veiculos_snovos`
--
ALTER TABLE `tb_veiculos_snovos`
  ADD PRIMARY KEY (`cod_veiculo_snovo`);

--
-- Índices para tabela `tb_veiculos_usados`
--
ALTER TABLE `tb_veiculos_usados`
  ADD PRIMARY KEY (`cod_veiculo_usado`);

--
-- Índices para tabela `tb_vendedores`
--
ALTER TABLE `tb_vendedores`
  ADD PRIMARY KEY (`cod_vendedores`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_ano_veiculo`
--
ALTER TABLE `tb_ano_veiculo`
  MODIFY `cod_ano_veiculo` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  MODIFY `cod_cliente` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `tb_colaboradores`
--
ALTER TABLE `tb_colaboradores`
  MODIFY `cod_colab` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_concessionarias`
--
ALTER TABLE `tb_concessionarias`
  MODIFY `cod_conc` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tb_conversa`
--
ALTER TABLE `tb_conversa`
  MODIFY `cod_conversa` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_conversa_ref`
--
ALTER TABLE `tb_conversa_ref`
  MODIFY `cod_ref_conv` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_cor_veiculos`
--
ALTER TABLE `tb_cor_veiculos`
  MODIFY `cod_cor_veiculo` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_documentos_usuario`
--
ALTER TABLE `tb_documentos_usuario`
  MODIFY `cod_documento` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `tb_endereco`
--
ALTER TABLE `tb_endereco`
  MODIFY `cod_endereco` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `tb_fornecedores`
--
ALTER TABLE `tb_fornecedores`
  MODIFY `cod_forn` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_galeria_veiculo`
--
ALTER TABLE `tb_galeria_veiculo`
  MODIFY `cod_galeria_veiculo` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_historico_preco`
--
ALTER TABLE `tb_historico_preco`
  MODIFY `cod_historico` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_marca`
--
ALTER TABLE `tb_marca`
  MODIFY `cod_marca` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_notificacao`
--
ALTER TABLE `tb_notificacao`
  MODIFY `cod_notificacao` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `tb_parcelado`
--
ALTER TABLE `tb_parcelado`
  MODIFY `cod_parcela` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_produtos`
--
ALTER TABLE `tb_produtos`
  MODIFY `cod_produto` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_renegociado`
--
ALTER TABLE `tb_renegociado`
  MODIFY `cod_renegociado` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_servicos`
--
ALTER TABLE `tb_servicos`
  MODIFY `cod_servico` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_telefone`
--
ALTER TABLE `tb_telefone`
  MODIFY `cod_telefone` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `tb_transacao`
--
ALTER TABLE `tb_transacao`
  MODIFY `cod_transacao` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `cod_usuario` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de tabela `tb_veiculos`
--
ALTER TABLE `tb_veiculos`
  MODIFY `cod_veiculo` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_veiculos_novos`
--
ALTER TABLE `tb_veiculos_novos`
  MODIFY `cod_veiculo_novo` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_veiculos_snovos`
--
ALTER TABLE `tb_veiculos_snovos`
  MODIFY `cod_veiculo_snovo` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_veiculos_usados`
--
ALTER TABLE `tb_veiculos_usados`
  MODIFY `cod_veiculo_usado` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_vendedores`
--
ALTER TABLE `tb_vendedores`
  MODIFY `cod_vendedores` int(9) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
