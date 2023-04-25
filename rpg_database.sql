CREATE DATABASE rpg_database;

USE rpg_database;

-- DROP DATABASE rpg_database;
/*
CREATE TABLE jogadores (
  id 		INT AUTO_INCREMENT PRIMARY KEY,
  nome 		VARCHAR(255) NOT NULL,
  email 	VARCHAR(255) NOT NULL,
  senha 	VARCHAR(255) NOT NULL
);

CREATE TABLE personagens (
  id 					INT AUTO_INCREMENT PRIMARY KEY,
  nome 					VARCHAR(255) NOT NULL,
  classe 				VARCHAR(255) NOT NULL,
  nivel 				INT NOT NULL,
  jogador_id 			INT NOT NULL,
  FORCA 				INT NOT NULL,
  DESTREZA 				INT NOT NULL,
  CONSTITUICAO 			INT NOT NULL,
  INTELIGENCIA 			INT NOT NULL,
  SABEDORIA 			INT NOT NULL,
  CARISMA 				INT NOT NULL,
  mod_FORCA 			INT NOT NULL,
  mod_DESTREZA 			INT NOT NULL,
  mod_CONSTITUICAO 		INT NOT NULL,
  mod_INTELIGENCIA 		INT NOT NULL,
  mod_SABEDORIA 		INT NOT NULL,
  mod_CARISMA 			INT NOT NULL,
  CA 					INT NOT NULL,
  vida_maxima 			INT NOT NULL,
  vida_atual 			INT NOT NULL,
  iniciativa 			INT NOT NULL,
  deslocamento 			DECIMAL (10, 2) NOT NULL,
  FOR_salv 				BOOLEAN NOT NULL,
  DES_salv 				BOOLEAN NOT NULL,
  CON_salv 				BOOLEAN NOT NULL,
  INT_salv 				BOOLEAN NOT NULL,
  SAB_salv 				BOOLEAN NOT NULL,
  CAR_salv 				BOOLEAN NOT NULL,
  acrobacia 			INT NOT NULL,
  arcanismo 			INT NOT NULL,
  atletismo 			INT NOT NULL,
  atuacao 				INT NOT NULL,
  blefar 				INT NOT NULL,
  furtividade 			INT NOT NULL,
  historia 				INT NOT NULL,
  intimidacao 			INT NOT NULL,
  investigacao 			INT NOT NULL,
  lidar_com_animais 	INT NOT NULL,
  medicina 				INT NOT NULL,
  natureza 				INT NOT NULL,
  percepcao 			INT NOT NULL,
  persuasao 			INT NOT NULL,
  prestidigitacao 		INT NOT NULL,
  religiao 				INT NOT NULL,
  sobrevivencia 		INT NOT NULL,
  FOREIGN KEY (jogador_id) REFERENCES jogadores(id)
);


CREATE TABLE itens (
  id 				INT AUTO_INCREMENT PRIMARY KEY,
  nome 				VARCHAR(255) NOT NULL,
  tipo 				VARCHAR(255) NOT NULL,
  descricao 		TEXT,
  personagem_id 	INT NOT NULL,
  FOREIGN KEY (personagem_id) REFERENCES personagens(id)
);
*/

-- TENDÊNCIAS ---------------------------------------
CREATE TABLE tendencias (
	id_tendencia		VARCHAR(2) PRIMARY KEY NOT NULL, -- Siglas (LB, NB e etc...)
    nome				VARCHAR(15) NOT NULL,
    descricao			TEXT NOT NULL
);

-- RAÇAS ---------------------------------------
CREATE TABLE racas (
  id_raca 			INT AUTO_INCREMENT PRIMARY KEY,
  id_tendencia_fk	VARCHAR(100) NOT NULL,
  nome 				VARCHAR(255) NOT NULL,
  descricao 		TEXT NOT NULL,
  idade 			VARCHAR(50) NOT NULL,
  tamanho 			VARCHAR(50) NOT NULL,
  deslocamento 		VARCHAR(50) NOT NULL,
  idiomas 			TEXT NOT NULL,
  FOREIGN KEY (id_tendencia_fk) REFERENCES tendencias(id_tendencia)
);

CREATE TABLE raca_atributos (
  id_raca_atributos	INT AUTO_INCREMENT PRIMARY KEY,
  id_raca_fk 		INT NOT NULL,
  forca 			INT NOT NULL,
  destreza 			INT NOT NULL,
  constituicao 		INT NOT NULL,
  inteligencia 		INT NOT NULL,
  sabedoria 		INT NOT NULL,
  carisma 			INT NOT NULL,
  FOREIGN KEY (id_raca_fk) REFERENCES racas(id_raca)
);

CREATE TABLE habilidades_raca (
  id_habilidade_raca			INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  id_raca_fk					INT NOT NULL,
  agilidade_halfling 			BOOLEAN,
  ancestral_anao 				BOOLEAN,
  ancestral_dragao 				BOOLEAN,
  ancestral_elfo 				BOOLEAN,
  ancestral_feerico 			BOOLEAN,
  ancestral_gnomo 				BOOLEAN,
  ancestral_halfling 			BOOLEAN,
  ancestral_humano 				BOOLEAN,
  ancestral_meio_elfo 			BOOLEAN,
  ancestral_meio_orc 			BOOLEAN,
  ancestral_tiefling 			BOOLEAN,
  engenhoso 					BOOLEAN,
  ferocidade 					BOOLEAN,
  furtividade_natural 			BOOLEAN,
  habilidade_extra 				BOOLEAN,
  ilusionista_nato 				BOOLEAN,
  imunidade_do_sono 			BOOLEAN,
  magia_infernal_thaumaturgy 	BOOLEAN,
  respiracao_de_dragao 			BOOLEAN,
  resistencia_ana 				BOOLEAN,
  resistencia_implacavel 		BOOLEAN,
  resistencia_infernal 			BOOLEAN,
  sorte_dos_halflings 			BOOLEAN,
  transe 						BOOLEAN,
  treinamento_em_ferramentas 	BOOLEAN,
  treinamento_em_percepcao 		BOOLEAN,
  treinamento_em_resistencia 	BOOLEAN,
  trevas 						BOOLEAN,
  versatilidade_em_habilidade 	BOOLEAN,
  visao_no_escuro 				BOOLEAN,
  FOREIGN KEY (id_raca_fk) 		REFERENCES racas (id_raca)
);

-- HABILIDADES ---------------------------------------
CREATE TABLE habilidades_classe (
	id_habilidade_classe		INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nome 						VARCHAR(50) NOT NULL,
	descricao 					TEXT NOT NULL
);

-- CLASSES ---------------------------------------
CREATE TABLE classes (
  id_classe 			INT AUTO_INCREMENT PRIMARY KEY,
  nome 					VARCHAR(255) NOT NULL,
  descricao 			TEXT NOT NULL,
  dado_vida 			INT NOT NULL,
  habilidade_primaria 	VARCHAR(50) NOT NULL
);

CREATE TABLE classe_resistencias (
  id_resistencias_classe		INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  id_classe_fk 					INT NOT NULL,
  forca 						BOOLEAN,
  destreza 						BOOLEAN,
  constituicao 					BOOLEAN,
  inteligencia 					BOOLEAN,
  sabedoria 					BOOLEAN,
  carisma 						BOOLEAN,
  FOREIGN KEY (id_classe_fk) 	REFERENCES classes(id_classe)
);

CREATE TABLE classe_proficiencia_equip (
  id_equip_classe				INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  id_classe_fk 					INT NOT NULL,
  armaduras_leves 				BOOLEAN,
  armaduras_media 				BOOLEAN,
  armaduras_pesada 				BOOLEAN,
  escudos 						BOOLEAN,
  armas_simples 				BOOLEAN,
  armas_marciais 				BOOLEAN,
  FOREIGN KEY (id_classe_fk) 	REFERENCES classes(id_classe)
);

CREATE TABLE classe_ferramentas (
	id_ferramentas_classe		INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_classe_fk				INT NOT NULL,
    alquimia 					BOOLEAN,
    alfaiataria 				BOOLEAN,
    armeiro 					BOOLEAN,
    cartografia 				BOOLEAN,
    carpintaria 				BOOLEAN,
    cervejaria 					BOOLEAN,
    ferraria 					BOOLEAN,
    instrumentos_musicais 		BOOLEAN,
    joalheria 					BOOLEAN,
    kit_disfarce 				BOOLEAN,
    kit_envenenamento 			BOOLEAN,
    kit_herbalismo 				BOOLEAN,
    kit_jogo 					BOOLEAN,
    kit_tatuagem 				BOOLEAN,
    kit_videncia 				BOOLEAN,
    mecanica 					BOOLEAN,
    navegacao 					BOOLEAN,
    ourivesaria 				BOOLEAN,
    pintura 					BOOLEAN,
    tecelagem 					BOOLEAN,
    venatoria 					BOOLEAN,
    FOREIGN KEY (id_classe_fk) 	REFERENCES classes(id_classe)
);

CREATE TABLE classe_nivel (
    id_classe_nivel						INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_classe_fk 						INT NOT NULL,
    id_caracteristicas_fk 				INT NOT NULL,
    nivel 								INT NOT NULL,
    proficiencia_bonus 					INT NOT NULL,
    FOREIGN KEY (id_classe_fk) 			REFERENCES classes(id_classe),
    FOREIGN KEY (id_caracteristicas_fk) REFERENCES habilidades_classe(id_habilidade_classe)
);

CREATE TABLE classe_magica_nivel (
  id_qtd_magica			INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  classe_id_fk 			INT NOT NULL,
  nivel 				INT NOT NULL,
  truques_conhecidos 	INT,
  magias_conhecidas 	INT,
  qtd_magia_1 			INT,
  qtd_magia_2 			INT,
  qtd_magia_3			INT,
  qtd_magia_4 			INT,
  qtd_magia_5 			INT,
  qtd_magia_6 			INT,
  qtd_magia_7 			INT,
  qtd_magia_8 			INT,
  qtd_magia_9 			INT,
  FOREIGN KEY (classe_id_fk) REFERENCES classes(id_classe)
);

CREATE TABLE barbaro_nivel (
	id_barbaro_nivel			INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    classe_id_fk				INT NOT NULL,
	nivel 						INT NOT NULL,
	furias 						INT NOT NULL,
	dano_furias 				INT NOT NULL,
    FOREIGN KEY (classe_id_fk) 	REFERENCES classes(id_classe)
);

CREATE TABLE bruxo_nivel (
	id_bruxo_nivel				INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    classe_id_fk				INT NOT NULL,
	nivel 						INT NOT NULL,
	truques_conhecidos 			INT,
	magias_conhecidas 			INT,
    qtd_magia					INT NOT NULL,
    nivel_magia					INT NOT NULL,
    invocacoes_conhecidas 		INT NOT NULL,
    FOREIGN KEY (classe_id_fk) 	REFERENCES classes(id_classe)
);

CREATE TABLE ladino_nivel (
	id_ladino_nivel				INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    classe_id_fk				INT NOT NULL,
	nivel 						INT NOT NULL,
	dano_furtivo 				INT NOT NULL,
    FOREIGN KEY (classe_id_fk) 	REFERENCES classes(id_classe)
);

CREATE TABLE monge_nivel (
	id_monge_nivel				INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    classe_id_fk				INT NOT NULL,
	nivel 						INT NOT NULL,
	artes_marciais 				VARCHAR(10) NOT NULL,
    qtd_chi						INT NOT NULL,
    desloc_sem_armadura 		DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (classe_id_fk) 	REFERENCES classes(id_classe)
);

-- MAGIAS --------------------------------------------
CREATE TABLE magias (
	id_magia 			INT AUTO_INCREMENT PRIMARY KEY,
    nome 				VARCHAR(50) NOT NULL,
    ritual				BOOLEAN,
    nivel_magia			INT NOT NULL,
    tempo_conjuracao	VARCHAR(30) NOT NULL,
    alcance				VARCHAR(30) NOT NULL,
    componentes			VARCHAR(10) NOT NULL,
    duracao				VARCHAR(20) NOT NULL,
    descricao			TEXT NOT NULL
);

-- IDIOMAS ------------------------------------------
CREATE TABLE idiomas (
	id_idiomas						INT PRIMARY KEY AUTO_INCREMENT,
    comum_falado_fk					INT NOT NULL,
	nome 							VARCHAR(50) NOT NULL,
	alfabeto 						VARCHAR(50),
    FOREIGN KEY (comum_falado_fk) 	REFERENCES racas(id_raca)
);

-- ANTECEDENTES ---------------------------------------
CREATE TABLE antecedentes (
	id_antecedente				INT PRIMARY KEY AUTO_INCREMENT,
	nome 						VARCHAR(50) NOT NULL,
	caracteristica_nome 		VARCHAR(50) NOT NULL,
    caracteristica_descricao	TEXT NOT NULL
);

-- PERICIAS ------------------------------------------- 
CREATE TABLE pericias_incremento (
	id_pericias					INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_classe_fk				INT NOT NULL,
    id_antecedente_fk			INT NOT NULL,
    qtd_escolha_classe			INT NOT NULL,
    acrobacia 					BOOLEAN,
	adestrar_animais 			BOOLEAN,
	arcanismo 					BOOLEAN,
	atletismo 					BOOLEAN,
	atuacao 					BOOLEAN,
	blefar 						BOOLEAN,
	furtividade 				BOOLEAN,
	historia 					BOOLEAN,
	intuicao 					BOOLEAN,
	intimidacao 				BOOLEAN,
	investigacao 				BOOLEAN,
	lidar_com_animais 			BOOLEAN,
	medicina 					BOOLEAN,
	natureza 					BOOLEAN,
	percepcao 					BOOLEAN,
	persuasao 					BOOLEAN,
	prestidigitacao 			BOOLEAN,
	religiao 					BOOLEAN,
	sobrevivencia 				BOOLEAN,
	FOREIGN KEY (id_classe_fk) 	REFERENCES classes(id_classe),
    FOREIGN KEY (id_antecedente_fk) REFERENCES antecedentes(id_antecedente)
);


