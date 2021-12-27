#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Rapports
#------------------------------------------------------------

CREATE TABLE Rapports(
        ID_R    Int  Auto_increment  NOT NULL ,
        Date    Date NOT NULL ,
        Source  Varchar (50) NOT NULL ,
        Message Text NOT NULL
	,CONSTRAINT Rapports_PK PRIMARY KEY (ID_R)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Recettes
#------------------------------------------------------------

CREATE TABLE Recettes(
        Id          Int  Auto_increment  NOT NULL ,
        Category    Varchar (50) NOT NULL ,
        Nom         Varchar (50) NOT NULL ,
        Personne    Int NOT NULL ,
        Specialite  Varchar (50) NOT NULL ,
        Description Text NOT NULL
	,CONSTRAINT Recettes_PK PRIMARY KEY (Id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Fourniture
#------------------------------------------------------------

CREATE TABLE Fourniture(
        ID_F           Int  Auto_increment  NOT NULL ,
        Nom_fourniture Varchar (50) NOT NULL ,
        Quantite       Integer NOT NULL
	,CONSTRAINT Fourniture_PK PRIMARY KEY (ID_F)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ustensiles
#------------------------------------------------------------

CREATE TABLE Ustensiles(
        ID_U               Int  Auto_increment  NOT NULL ,
        Nom_Ustensile      Varchar (50) NOT NULL ,
        Quantite_Ustensile Integer NOT NULL
	,CONSTRAINT Ustensiles_PK PRIMARY KEY (ID_U)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Vaiselles
#------------------------------------------------------------

CREATE TABLE Vaiselles(
        ID_V               Int  Auto_increment  NOT NULL ,
        Nom_Vaiselles      Varchar (50) NOT NULL ,
        Quantite_Vaiselles Integer NOT NULL
	,CONSTRAINT Vaiselles_PK PRIMARY KEY (ID_V)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Réserve
#------------------------------------------------------------

CREATE TABLE Reserve(
        ID_Reserve      Int  Auto_increment  NOT NULL ,
        Date_Expiration Date NOT NULL
	,CONSTRAINT Reserve_PK PRIMARY KEY (ID_Reserve)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Taches
#------------------------------------------------------------

CREATE TABLE Taches(
        ID_Tache          Int  Auto_increment  NOT NULL ,
        Temps             Int NOT NULL ,
        Description_tache Text NOT NULL ,
        Id                Int NOT NULL ,
        ID_F              Int NOT NULL
	,CONSTRAINT Taches_PK PRIMARY KEY (ID_Tache)

	,CONSTRAINT Taches_Recettes_FK FOREIGN KEY (Id) REFERENCES Recettes(Id)
	,CONSTRAINT Taches_Fourniture0_FK FOREIGN KEY (ID_F) REFERENCES Fourniture(ID_F)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ingrédiants
#------------------------------------------------------------

CREATE TABLE Ingrediants(
        ID_I           Int  Auto_increment  NOT NULL ,
        Nom_Ingrediant Varchar (50) NOT NULL ,
        Duree          Integer NOT NULL
	,CONSTRAINT Ingrediants_PK PRIMARY KEY (ID_I)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: reserve ingrediant
#------------------------------------------------------------

CREATE TABLE reserve_ingrediant(
        ID_I       Int NOT NULL ,
        ID_Reserve Int NOT NULL
	,CONSTRAINT reserve_ingrediant_PK PRIMARY KEY (ID_I,ID_Reserve)

	,CONSTRAINT reserve_ingrediant_Ingrediants_FK FOREIGN KEY (ID_I) REFERENCES Ingrediants(ID_I)
	,CONSTRAINT reserve_ingrediant_Reserve0_FK FOREIGN KEY (ID_Reserve) REFERENCES Reserve(ID_Reserve)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ustensile_tache
#------------------------------------------------------------

CREATE TABLE Ustensile_tache(
        ID_U     Int NOT NULL ,
        ID_Tache Int NOT NULL
	,CONSTRAINT Ustensile_tache_PK PRIMARY KEY (ID_U,ID_Tache)

	,CONSTRAINT Ustensile_tache_Ustensiles_FK FOREIGN KEY (ID_U) REFERENCES Ustensiles(ID_U)
	,CONSTRAINT Ustensile_tache_Taches0_FK FOREIGN KEY (ID_Tache) REFERENCES Taches(ID_Tache)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ingrediant_Tache
#------------------------------------------------------------

CREATE TABLE Ingrediant_Tache(
        ID_Tache        Int NOT NULL ,
        ID_I            Int NOT NULL ,
        Nbre_Ingrediant Int NOT NULL
	,CONSTRAINT Ingrediant_Tache_PK PRIMARY KEY (ID_Tache,ID_I)

	,CONSTRAINT Ingrediant_Tache_Taches_FK FOREIGN KEY (ID_Tache) REFERENCES Taches(ID_Tache)
	,CONSTRAINT Ingrediant_Tache_Ingrediants0_FK FOREIGN KEY (ID_I) REFERENCES Ingrediants(ID_I)
)ENGINE=InnoDB;

