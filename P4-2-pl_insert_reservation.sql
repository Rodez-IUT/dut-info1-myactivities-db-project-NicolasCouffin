CREATE OR REPLACE FUNCTION gds.pl_insert_reservation(
    une_date_debut timestamp without time zone,
	une_date_fin timestamp without time zone,
	un_nom_de_salle varchar(250))
	RETURNS gds.reservation AS $$
DECLARE
une_reservation gds.reservation%ROWTYPE;
BEGIN
	SELECT * INTO une_reservation FROM gds.salle WHERE nom = un_nom_de_salle;
	IF FOUND
		THEN
			INSERT INTO gds.reservation (id,date_debut,date_fin,date_creation,date_modification,salle_id)
				VALUES (nextval('gds.reservation_seq'),une_date_debut,une_date_fin,now(),now(),
		           	    (SELECT gds.salle.id FROM gds.salle WHERE un_nom_de_salle = nom))
		    RETURNING * INTO une_reservation;
		ELSE
			RAISE NOTICE 'Salle non existante';
		END IF;
	RETURN une_reservation;
END;
$$ LANGUAGE plpgsql;