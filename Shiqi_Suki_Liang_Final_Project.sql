-- Author: Shiqi Liang
-- Date: 03/10/2023
-- Description: This file contains the SQL code to create the database and tables for the Animal Crossing New Horizon project.
--             It also contains the SQL code to load the data into the database.
--            This file is meant to be run in MySQL Workbench.
--           The data files are located in the same folder as this file.
--         The data files are named accessories.csv art.csv 


-- Create the database
CREATE DATABASE AnimalCrossingNewHorizon;

-- Use the database
USE AnimalCrossingNewHorizon;


-- Create the accessories table
CREATE TABLE accessories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  variation VARCHAR(255),
  diy VARCHAR(255),
  buy INT NOT NULL,
  sell INT NOT NULL,
  color1 VARCHAR(255),
  color2 VARCHAR(255),
  size VARCHAR(255),
  miles_price INT,
  source VARCHAR(255),
  source_notes VARCHAR(255),
  seasonal_availability VARCHAR(255),
  mannequin_piece VARCHAR(255),
  version VARCHAR(255),
  style VARCHAR(255),
  label_themes VARCHAR(255),
  type VARCHAR(255),
  villager_equippable VARCHAR(255),
  catalog VARCHAR(255),
  filename VARCHAR(255),
  internal_id INT,
  unique_entry_id INT
);


-- Load data into the accessories table
LOAD DATA INFILE '/Users/whatnameishoulduse/Desktop/Animal_Crossing_New_Horizons_Catalog/accessories.csv'
INTO TABLE accessories
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(name, variation, diy, buy, sell, color1, color2, size, miles_price, source, source_notes, seasonal_availability, mannequin_piece, version, style, label_themes, type, villager_equippable, catalog, filename, internal_id, unique_entry_id);


-- Create indexes
CREATE INDEX idx_name ON accessories (name);
CREATE INDEX idx_variation ON accessories (variation);
CREATE INDEX idx_diy ON accessories (diy);
CREATE INDEX idx_buy ON accessories (buy);
CREATE INDEX idx_sell ON accessories (sell);
CREATE INDEX idx_color1 ON accessories (color1);
CREATE INDEX idx_color2 ON accessories (color2);
CREATE INDEX idx_size ON accessories (size);
CREATE INDEX idx_miles_price ON accessories (miles_price);
CREATE INDEX idx_source ON accessories (source);
CREATE INDEX idx_source_notes ON accessories (source_notes);
CREATE INDEX idx_seasonal_availability ON accessories (seasonal_availability);
CREATE INDEX idx_mannequin_piece ON accessories (mannequin_piece);
CREATE INDEX idx_version ON accessories (version);
CREATE INDEX idx_style ON accessories (style);
CREATE INDEX idx_label_themes ON accessories (label_themes);
CREATE INDEX idx_type ON accessories (type);
CREATE INDEX idx_villager_equippable ON accessories (villager_equippable);
CREATE INDEX idx_catalog ON accessories (catalog);
CREATE INDEX idx_filename ON accessories (filename);
CREATE INDEX idx_internal_id ON accessories (internal_id);
CREATE INDEX idx_unique_entry_id ON accessories (unique_entry_id);



-- Create foreign keys
ALTER TABLE accessories
ADD CONSTRAINT fk_accessories_color1
FOREIGN KEY (color1) REFERENCES colors (name);

ALTER TABLE accessories
ADD CONSTRAINT fk_accessories_color2
FOREIGN KEY (color2) REFERENCES colors (name);

ALTER TABLE accessories
ADD CONSTRAINT fk_accessories_size
FOREIGN KEY (size) REFERENCES sizes (name);

ALTER TABLE accessories
ADD CONSTRAINT fk_accessories_source
FOREIGN KEY (source) REFERENCES sources (name);

ALTER TABLE accessories
ADD CONSTRAINT fk_accessories_type
FOREIGN KEY (type) REFERENCES types (name);




-- Create views
CREATE VIEW vw_accessories AS
SELECT name, type, source
FROM accessories;




-- Create stored procedures
DELIMITER $$
CREATE PROCEDURE sp_accessories()
BEGIN
SELECT name, type, source
FROM accessories;
END$$
DELIMITER ;



-- Create triggers
DELIMITER $$
CREATE TRIGGER tr_accessories
AFTER INSERT ON accessories
FOR EACH ROW
BEGIN
INSERT INTO accessories (name, type, source)
VALUES ('name', 'type', 'source');
END$$
DELIMITER ;





-- Create functions
DELIMITER $$
CREATE FUNCTION fn_accessories()
RETURNS VARCHAR(255)
BEGIN
DECLARE name VARCHAR(255);
DECLARE type VARCHAR(255);
DECLARE source VARCHAR(255);
SELECT name, type, source
FROM accessories
INTO name, type, source;
RETURN name;
END$$
DELIMITER ;


-- Create events
DELIMITER $$
CREATE EVENT ev_accessories
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
INSERT INTO accessories (name, type, source)
VALUES ('name', 'type', 'source');
END$$
DELIMITER ;



-- Create the art table
CREATE TABLE art (
  Name VARCHAR(255) NOT NULL,
  Genuine BOOLEAN NOT NULL,
  Category VARCHAR(255) NOT NULL,
  Buy INTEGER NOT NULL,
  Sell INTEGER NOT NULL,
  Color1 VARCHAR(255),
  Color2 VARCHAR(255),
  Size VARCHAR(255),
  RealArtworkTitle VARCHAR(255),
  Artist VARCHAR(255),
  MuseumDescription VARCHAR(255),
  Source VARCHAR(255),
  SourceNotes VARCHAR(255),
  Version VARCHAR(255),
  HHAConcept1 VARCHAR(255),
  HHAConcept2 VARCHAR(255),
  HHASeries VARCHAR(255),
  HHASet VARCHAR(255),
  Interact BOOLEAN,
  Tag VARCHAR(255),
  SpeakerType VARCHAR(255),
  LightingType VARCHAR(255),
  Catalog VARCHAR(255),
  Filename VARCHAR(255),
  InternalID INTEGER NOT NULL,
  UniqueEntryID INTEGER NOT NULL,
  PRIMARY KEY (InternalID)
);


-- Load data into the art table
LOAD DATA INFILE '/Users/whatnameishoulduse/Desktop/Animal_Crossing_New_Horizons_Catalog/art.csv'
INTO TABLE art
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Name, Genuine, Category, Buy, Sell, Color1, Color2, Size, Real_Artwork_Title, Artist, Museum_Description, Source, Source_Notes, Version, HHA_Concept_1, HHA_Concept_2, HHA_Series, HHA_Set, Interact, Tag, Speaker_Type, Lighting_Type, Catalog, Filename, Internal_ID, Unique_Entry_ID);


-- Create indexes
CREATE INDEX idx_genuine ON art (genuine);
CREATE INDEX idx_category ON art (category);
CREATE INDEX idx_buy ON art (buy);
CREATE INDEX idx_sell ON art (sell);
CREATE INDEX idx_color1 ON art (color1);
CREATE INDEX idx_color2 ON art (color2);
CREATE INDEX idx_size ON art (size);
CREATE INDEX idx_real_artwork_title ON art (real_artwork_title);
CREATE INDEX idx_artist ON art (artist);
CREATE INDEX idx_museum_description ON art (museum_description);
CREATE INDEX idx_source ON art (source);
CREATE INDEX idx_source_notes ON art (source_notes);
CREATE INDEX idx_version ON art (version);
CREATE INDEX idx_hha_concept_1 ON art (hha_concept_1);
CREATE INDEX idx_hha_concept_2 ON art (hha_concept_2);
CREATE INDEX idx_hha_series ON art (hha_series);
CREATE INDEX idx_hha_set ON art (hha_set);
CREATE INDEX idx_interact ON art (interact);
CREATE INDEX idx_tag ON art (tag);
CREATE INDEX idx_speaker_type ON art (speaker_type);
CREATE INDEX idx_lighting_type ON art (lighting_type);
CREATE INDEX idx_catalog ON art (catalog);
CREATE INDEX idx_filename ON art (filename);
CREATE INDEX idx_internal_id ON art (internal_id);
CREATE INDEX idx_unique_entry_id ON art (unique_entry_id);


-- Create foreign keys
ALTER TABLE art ADD CONSTRAINT fk_art_category_id FOREIGN KEY (category) REFERENCES categories(name);

ALTER TABLE art ADD CONSTRAINT fk_art_artist_id FOREIGN KEY (artist) REFERENCES artists(name);


-- Create views
CREATE VIEW view_art AS
SELECT name, genuine, categories.name as category, buy, sell, color1, color2, size, real_artwork_title, artists.name as artist, museum_description, source, source_notes, version, hha_concept_1, hha_concept_2, hha_series, hha_set, interact, tag, speaker_type, lighting_type
FROM art
JOIN categories ON art.category_id = categories.id
JOIN artists ON art.artist = artists.artist_name; 



-- Create stored procedures
DELIMITER $$
CREATE PROCEDURE get_artwork_by_name(IN p_artwork_name VARCHAR(255))
BEGIN
SELECT name, genuine, category, buy, sell, color1, color2, size, real_artwork_title, artist, museum_description, source, source_notes, version, hha_concept_1, hha_concept_2, hha_series, hha_set, interact, tag, speaker_type, lighting_type, catalog, filename, internal_id, unique_entry_id
FROM art
WHERE name = p_artwork_name;
END $$
DELIMITER ;


-- Create triggers
DELIMITER $$

CREATE TRIGGER tr_update_art_timestamp
AFTER INSERT ON art
FOR EACH ROW
BEGIN
  UPDATE art SET last_updated = NOW() WHERE id = NEW.id;
END $$

DELIMITER ;



-- Create functions

CREATE FUNCTION total_profit()
RETURNS INT
BEGIN
DECLARE profit INT;
SET profit = (SELECT SUM(sell - buy) FROM art);
RETURN profit;
END;

CREATE FUNCTION average_profit()
RETURNS INT
BEGIN
DECLARE avg_profit INT;
SET avg_profit = (SELECT AVG(sell - buy) FROM art);
RETURN avg_profit;
END;



-- Create events
DELIMITER $$
CREATE EVENT ev_art
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
INSERT INTO art (name, type, source, authenticity)
VALUES ('name', 'type', 'source', 'authenticity');
END$$
DELIMITER ;






