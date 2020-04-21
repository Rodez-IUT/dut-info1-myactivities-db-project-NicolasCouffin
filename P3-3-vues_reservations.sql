CREATE VIEW gds.vue_reservations AS
	SELECT
		gds.reservation.id as res_id,
		gds.salle.nom as nom_salle,
		gds.reservation.date_debut as date_de_debut,
		gds.reservation.date_fin as date_de_fin
	FROM gds.reservation
	JOIN gds.salle
	ON id_salle = gds.salle.id
	ORDER BY nom_salle, date_debut, date_debut DESC;