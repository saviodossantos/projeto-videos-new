-- MySQL dump 10.13  Distrib 8.0.29, for macos12 (x86_64)
--
-- Host: localhost    Database: projeto_videos_new
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `adm`
--

DROP TABLE IF EXISTS `adm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adm` (
  `id_adm` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(95) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  `confsenha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_adm`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm`
--

LOCK TABLES `adm` WRITE;
/*!40000 ALTER TABLE `adm` DISABLE KEYS */;
/*!40000 ALTER TABLE `adm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrinho`
--

DROP TABLE IF EXISTS `carrinho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrinho` (
  `carrinho_id` int NOT NULL AUTO_INCREMENT,
  `servico` varchar(100) NOT NULL,
  `produto` varchar(100) NOT NULL,
  `qtdTelas` int DEFAULT NULL,
  `usuarios` varchar(100) NOT NULL,
  PRIMARY KEY (`carrinho_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrinho`
--

LOCK TABLES `carrinho` WRITE;
/*!40000 ALTER TABLE `carrinho` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrinho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chamada`
--

DROP TABLE IF EXISTS `chamada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chamada` (
  `chamada_id` int NOT NULL AUTO_INCREMENT,
  `cliente` varchar(100) NOT NULL,
  `assunto` longtext NOT NULL,
  `email` longtext NOT NULL,
  `telefone` int DEFAULT NULL,
  PRIMARY KEY (`chamada_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chamada`
--

LOCK TABLES `chamada` WRITE;
/*!40000 ALTER TABLE `chamada` DISABLE KEYS */;
INSERT INTO `chamada` VALUES (1,'Silvio','conta bloqueada','silvio@gmail.com',999997070),(2,'Luiz','troca de senha','luiz@gmail.com',985857070),(3,'Grazi','meu pc esta com virus','grazi@gmail.com',989897070);
/*!40000 ALTER TABLE `chamada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contato`
--

DROP TABLE IF EXISTS `contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contato` (
  `contato_id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `sobrenome` longtext NOT NULL,
  `email` longtext NOT NULL,
  `mensagem` longtext,
  PRIMARY KEY (`contato_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contato`
--

LOCK TABLES `contato` WRITE;
/*!40000 ALTER TABLE `contato` DISABLE KEYS */;
INSERT INTO `contato` VALUES (1,'Silvio','conta bloqueada','silvio@gmail.com','999997070'),(2,'Luiz','troca de senha','luiz@gmail.com','985857070'),(3,'Grazi','meu pc esta com virus','grazi@gmail.com','989897070'),(4,'M??nica','de Souza de Lira Sales','serenalira@hotmail.com','hjtf'),(5,'Thiago Marinho','concei????o','tradermarinho@hotmail.com','dfgs'),(6,'Thiago Marinho','concei????o','tradermarinho@hotmail.com',''),(7,'Jo??o','Souza','joao@gmail.com','travando a tela');
/*!40000 ALTER TABLE `contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupom`
--

DROP TABLE IF EXISTS `cupom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupom` (
  `cupom_id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL,
  `desconto` int NOT NULL,
  `codigo` varchar(10) NOT NULL,
  PRIMARY KEY (`cupom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupom`
--

LOCK TABLES `cupom` WRITE;
/*!40000 ALTER TABLE `cupom` DISABLE KEYS */;
INSERT INTO `cupom` VALUES (1,'Boas vindas',10,'10MENOS'),(2,'Indica????o',20,'20MENOS'),(3,'Funcionario',30,'30MENOS');
/*!40000 ALTER TABLE `cupom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diretor`
--

DROP TABLE IF EXISTS `diretor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diretor` (
  `diretor_id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `idade` int DEFAULT NULL,
  `portfolio` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`diretor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diretor`
--

LOCK TABLES `diretor` WRITE;
/*!40000 ALTER TABLE `diretor` DISABLE KEYS */;
/*!40000 ALTER TABLE `diretor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filmes`
--

DROP TABLE IF EXISTS `filmes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filmes` (
  `filmes_id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `genero` varchar(100) DEFAULT NULL,
  `Ano` int DEFAULT NULL,
  `sinopse` longtext NOT NULL,
  `imagem` varchar(100) NOT NULL,
  `promo` int DEFAULT '0',
  `valor` varchar(15) DEFAULT NULL,
  `trailer` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`filmes_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filmes`
--

LOCK TABLES `filmes` WRITE;
/*!40000 ALTER TABLE `filmes` DISABLE KEYS */;
INSERT INTO `filmes` VALUES (1,'Interestellar','Fic????o Cient??fica/Aventura',2014,'Interestelar se passa em um futuro em que a Terra se torna um lugar inabit??vel. Com a promessa de encontrar um jeito de solucionar o problema, um grupo de exploradores descobrem um buraco negro capaz de proporcionar viagens pelo espa??o e pelo tempo, al??m de outras dimens??es, com a qual os humanos nunca tinham sonhado. Junto desses exploradores est?? Cooper (Matthew McConaughey), um ex-piloto que precisa deixar sua fam??lia para seguir rumo ao espa??o.','filme1.jpeg',0,'19.90','https://www.youtube.com/embed/mbbPSq63yuM'),(2,'Thor: Amor e Trov??o','Aventura/A????o/Fantasia',2022,'Thor (Chris Hemsworth) entra em uma jornada diferente em busca da paz interior, vivendo longe das atitudes heroicas e dos perigos constantes. Mas sua aposentadoria ?? interrompida por um assassino gal??ctico conhecido como Gorr (Christian Bale), que busca a extin????o dos deuses.\n\nPara combater a amea??a, Thor pede a ajuda de Valkyrie (Tessa Thompson), Korg (Taika Waititi), Jane Foster (Natalie Portman) e outros amigos. Juntos, todos embarcam em uma angustiante aventura c??smica para deter o vil??o antes que seja tarde demais.','filme2.jpeg',0,'19.90','https://www.youtube.com/embed/1c_W_4cNLn0'),(3,'Projeto X','Com??dia',2012,'Projeto X: Uma Festa Fora de Controle mostra tr??s alunos do ??ltimo ano do colegial tentando deixar o anonimato. A ideia deles ?? bastante inocente: dar uma festa que ningu??m ir?? esquecer... Mas nada poderia prepar??-los para esta festa. Not??cias se espalham t??o rapidamente quanto sonhos s??o arruinados, recorda????es s??o manchadas e lendas nascem. Projeto X: Uma Festa Fora de Controle ?? um alerta a pais e ?? pol??cia de qualquer lugar.','filme3.jpeg',0,'9.90','https://www.youtube.com/embed/kFwGmQIe-rU'),(4,'1917','Drama/Guerra',2019,'Dois soldados brit??nicos da Primeira Guerra Mundial recebem a improv??vel miss??o de entregar uma mensagem nas profundezas do territ??rio inimigo. Se realizado com sucesso, o plano pode poupar 1.600 vidas de uma armadilha mortal. ','filme4.jpeg',0,'9.90','https://www.youtube.com/embed/_3gy6K7LXHg'),(5,'Mulan','Anima????o',2020,'Para salvar seu pai doente de servir no Ex??rcito Imperial, uma jovem destemida se disfar??a de homem para lutar contra os invasores do norte da China','filme5.jpeg',0,'19.90','https://www.youtube.com/embed/AD5cvVk-4Ps'),(6,'Vingadores: Ultimato','Aventura/Fantasia',2019,'As coisas na Terra est??o sombrias. Ap??s o poder das Joias do Infinito ter dizimado metade da popula????o, Thanos (Josh Brolin) tomou o manto como governante do universo, deixando os Vingadores em ru??na. Portanto, Vi??va Negra (Scarlett Johansson), Thor (Chris Hemsworth), Capit??o Am??rica (Chris Evans) e Bruce Banner (Mark Ruffalo) devem permanecer resilientes e reunir os mais poderosos her??is para det??-lo, junto com a Capit?? Marvel (Brie Larson). ','filme6.jpeg',0,'19.90','https://www.youtube.com/embed/4QRdB4RAQMs'),(7,'The Discovery','Drama/Romance',2017,'Em meio a tantos estudos e experimentos, o cientista Thomas Harbor (Robert Redford) descobre que existe vida ap??s a morte. A novidade faz com que muitas pessoas apaixonadas acabem cometendo suic??dio com a esperan??a de reencontrarem os amores de suas vidas.','filme7.jpeg',0,'19.90','https://www.youtube.com/embed/Z3sVZxZ9s9U'),(8,'A origem','Fic????o Cient??fica/Mist??rio/Suspense',2010,'Dom Cobb (Leonardo DiCaprio) ?? um ladr??o especializado, o melhor na perigosa arte da extra????o, o roubo de segredos valiosos do fundo do subconsciente durante o sono com sonhos, quando a mente est?? mais vulner??vel. A rara habilidade de Cobb fez dele uma pe??a fundamental no trai??oeiro mundo da espionagem empresarial, mas tamb??m fez dele um fugitivo internacional que lhe custou tudo o que mais amava.\n\nAgora, Cobb tem uma chance de reden????o. Um ??ltimo trabalho que pode dar-lhe sua vida de volta se ele conseguir o imposs??vel. Ao inv??s de um assalto perfeito, Cobb e sua equipe de especialistas t??m que obter o inverso: sua tarefa n??o ?? roubar uma id??ia, mas sim plantar uma. Se tiverem sucesso, poderia ser o crime perfeito. Mas nem todo seu conhecimento pode preparar a equipe para um inimigo t??o perigoso que parece prever cada movimento do grupo. Um inimigo que s?? Cobb poderia enfrentar.','filme8.jpeg',0,'19.90','https://www.youtube.com/embed/YoHD9XEInc0'),(9,'Bohemian Rhapsody','Musical/Biografia',2018,'Conta a hist??ria de Freddie Mercury (Rami Malek). Ele foi criado na ??ndia e se mudou para a Inglaterra nos anos 60. L??, ele conhece Brian May e Roger Taylor e o trio forma a banda Queen em 1970. Eles fazem um grande sucesso pelo mundo, com hits como \"Bohemian Rhapsody\", ???We Will Rock You??? e ???We Are the Champions???.','filme9.jpeg',0,'9.90','https://www.youtube.com/embed/GryRsVhOvxo'),(10,'Sonic 2','fantasia',2022,'O Dr. Robotnik retorna ?? procura de uma esmeralda m??stica que tem o poder de destruir civiliza????es. Para det??-lo, Sonic se une a seu antigo parceiro, Tails, e parte em uma jornada para encontrar a joia antes que ela caia em m??os erradas','filme10.jpeg',0,'19.90','https://www.youtube.com/embed/A2SjVRziC7M'),(11,'Midsommar','Drama/Horror/Mist??rio/Terror',2019,'Uma jovem est?? relutante com a ideia de partir com seu namorado em uma viagem de ver??o com parada em um festival na Su??cia. No entanto, ela decide ir e as coisas rapidamente d??o errado quando eles percebem os rituais bizarros que acontecem no local. ','filme11.jpeg',0,'19.90','https://www.youtube.com/embed/T-fo5q3o0XI'),(12,'Pixels','Com??dia',2015,'Uma ra??a alien??gena cria monstros inspirados em videogames da d??cada de 1980 para conquistar a Terra, e cinco especialistas em jogos da ??poca s??o convocados para combater o plano dos extraterrestres e salvar o planeta.','filme12.jpeg',0,'19.90','https://www.youtube.com/embed/XAHprLW48no'),(13,'Homem-Aranha: Sem Volta Para Casa','A????o',2021,'Pela primeira vez na hist??ria cinematogr??fica do Homem-Aranha, nosso her??i amigo da vizinhan??a ?? desmascarado e n??o consegue mais separar sua vida normal dos grandes riscos de ser um super-her??i. Quando ele pede ajuda ao Doutor Estranho, os riscos se tornam ainda mais perigosos, e o for??am a descobrir o que realmente significa ser o Homem-Aranha.','filme13.jpeg',0,'19.90','https://www.youtube.com/embed/ae6w0-kZ3-M'),(14,'Coherence','Fic????o Cient??fica',2013,'Na noite de uma anomalia astrol??gica, oito amigos em um jantar come??am a conversar sobre a proximidade de um cometa, e sobre os rumores de que a passagem do astro pode trazer mudan??as graves no comportamento das pessoas. ','filme14.jpeg',0,'19.90','https://www.youtube.com/embed/kxAOewNzz-8'),(15,'O Homem Duplicado','Mist??rio/Suspense',2013,'Ao assistir um filme, Adam (Jake Gyllenhaal), um professor universit??rio, se d?? conta que um dos atores ?? id??ntico a ele. Intrigado com a estranha coincid??ncia, ele passa a perseguir obsessivamente este homem afim de desvendar este mist??rio.','filme15.jpeg',0,'19.90','https://www.youtube.com/embed/FJuaAWrgoUY'),(16,'o lobo de wall street','Biografia/Com??dia/Drama',2014,'Martin Scorsese dirige o filme baseado na hist??ria real de Jordan Belfort (Leonardo DiCaprio), um corretor de t??tulos da bolsa norte-americana.\n\nDurante o dia ele ganhava milh??es de d??lares por minuto, e nas noites gastava com sexo, drogas e viagens internacionais. Dinheiro, poder, mulheres e drogas nunca eram suficientes, por??m, suas artimanhas e a vida corrupta levaram-no para a pris??o, onde ficou por 20 anos por fraudar investidores - num esquema que envolveu pessoas de praticamente todo o sistema banc??rio norte-americano.','filme16.jpeg',0,'9.90','https://www.youtube.com/embed/PoSCUsNQVtw'),(17,'Hell House LLC','Terror',2015,'Durante o m??s de outubro, ?? comum nos Estados Unidos o surgimento de diversas ???casas de terror???, lugares ambientados para causar sustos e arrecadar uma boa grana com o medo. Quem viu The Houses October Built, onde um grupo de jovens decide estragar esses espa??os malditos, pode perceber que o Halloween possibilita essas atra????es. Em Hell House LLC, acompanhamos os bastidores do surgimento da ???casa do inferno???, um evento que viaja pela Am??rica desde 2002 e que foi palco de uma trag??dia em 8 de outubro de 2009.','filme17.jpeg',0,'19.90','https://www.youtube.com/embed/kZ40kOmOgEI'),(18,'The Batman','A????o',2022,'Ap??s dois anos espreitando as ruas como Batman, Bruce Wayne se encontra nas profundezas mais sombrias de Gotham City. Com poucos aliados confi??veis, o vigilante solit??rio se estabelece como a personifica????o da vingan??a para a popula????o','filme18.jpeg',0,'19.90','https://www.youtube.com/embed/HJv4LQxbVEA'),(19,'Donnie Darko','Drama/Suspense',2001,'Donnie (Jake Gyllenhaal) ?? um jovem brilhante e exc??ntrico, que cursa o colegial mas despreza a grande maioria dos seus colegas de escola. Donnie tem vis??es, em especial de um coelho monstruoso o qual apenas ele consegue ver, que o encorajam a realizar brincadeiras destrutivas e humilhantes com quem o cerca. At?? que um dia uma de suas vis??es o atrai para fora de casa e lhe diz que o mundo acabar?? dentro de um m??s. Donnie inicialmente n??o acredita na profecia, mas momentos depois um avi??o cai bem no telhado de sua casa, quase matando-o. ?? quando ele come??a a se perguntar qual o fundo de verdade na previs??o do fim do planeta.','filme19.jpeg',0,'19.90','https://www.youtube.com/embed/bzLn8sYeM9o'),(20,'Ad Astra','Drama/Fic????o Cient??fica',2019,'Um engenheiro autista (Brad Pitt) decide fazer uma viagem pelo espa??o. Seu objetivo ?? tentar reencontrar seu pai (Tommy Lee Jones), que h?? 20 anos partiu para Netuno numa miss??o em busca de sinais de intelig??ncia extraterrestre.','filme20.jpeg',0,'19.90','https://www.youtube.com/embed/0kfRv-L-vqg');
/*!40000 ALTER TABLE `filmes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servico` (
  `servico_id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `valor` int DEFAULT NULL,
  `descri????o` longtext NOT NULL,
  PRIMARY KEY (`servico_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
INSERT INTO `servico` VALUES (1,'Assinatura','mensal',30,'Assinatura mensal multi-telas.'),(2,'Assinatura','anual',330,'Assinatura anual de multi-telas com desconto de 7% referente ao valor mensal.'),(3,'Aluguel','di??rio',15,'Aluguel de filmes lan??amentos por 24 horas.');
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `usuarios_id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(12) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  `conf_senha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`usuarios_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas` (
  `idvendas` int NOT NULL AUTO_INCREMENT,
  `clientes` int NOT NULL,
  `servicos` int NOT NULL,
  `valor` int NOT NULL,
  `filme` int NOT NULL,
  `qtdTelas` int NOT NULL,
  `descricao` longtext NOT NULL,
  PRIMARY KEY (`idvendas`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-07  0:44:26
