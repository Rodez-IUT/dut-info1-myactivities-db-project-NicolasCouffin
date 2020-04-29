CREATE OR REPLACE FUNCTION gds.pl_insert_salle(un_nom varchar(250), un_nb_personnes_max integer) RETURNS SETOF gds.salle AS $$

DECLARE

BEGIN
	INSERT INTO gds.salle (id,nom,nb_personnes_max,date_creation,date_modification)
		VALUES (nextval('gds.salle_seq'),un_nom,un_nb_personnes_max,now(),now());
		
	RETURN QUERY SELECT * FROM gds.salle WHERE nom = un_nom;
	RETURN;
END;
$$ LANGUAGE plpgsql;