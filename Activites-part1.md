# Partie 1 - Cr�ation et population de la base de donn�es

Avant de r�aliser cette partie, il convient d'avoir visionn� la vid�o mise � disposition dans l'espace de cours Moodle et accessible directement via cette URL :
https://youtu.be/aM2KBUfADak

### 1. Cr�ation de l'utilisateur "myactivities-user" 

1.1. Ouvrez pgAdmin 4 et connectez vous � votre serveur local en utilisant le user "postgres".

1.2. Cr�ez un nouvel utilisateur sp�cifi� comme suit :
    
- username : myactivities-user
- mot de passe : 123456
- attributs : LOGIN et CREATEDB

### 2. Cr�ation de la base de donn�es "myactivities-db"

2.1. D�connectez-vous du serveur et reconnectez-vous au serveur en utilisant l'utilisateur "myactivities-user".

2.2. Cr�ez une nouvelle base de donn�es sp�cifi�es comme suit :

- name : myactivities-db
- owner (propri�taire) : myactivities-user
- encoding : UTF8

### 3. Cr�ation et initialisation de la table "user"

En utilisant l'�diteur de requ�te "Query Tool" propos� par pgAdmin, utilisez les instructions SQL ci-dessous pour cr�er  et initialiser le contenu de la  table "user".

    CREATE TABLE "user"
    (
        id bigint NOT NULL,
        username character varying(500),
        date_created timestamp without time zone NOT NULL DEFAULT now(),
        CONSTRAINT user_pkey PRIMARY KEY (id)
    );

    INSERT INTO "user" VALUES (100,'Marie Dupont', now());
    INSERT INTO "user" VALUES (101,'Paul Durand', now());
    INSERT INTO "user" VALUES (102,'Jane Doe', now());

> Les requ�tes sp�cifi�es dans la suite des activit�s doivent �tre ex�cut�es et donc test�es via le "Query Tool". Certaines requ�tes n�cessiteront l'insertion de nouvelles donn�es pour �tre test�es. 
>
>Pour chaque requ�te sp�cifi�e, vous devez cr�er un nouveau fichier dont le nom sera sp�cifi� pour chaque requ�te. Vous devez ensuite compl�ter ce fichier avec la requ�te que vous avez r�dig�e et test�e dans "Query Tool" ainsi qu'avec les instructions que vous aurez � r�diger et � ex�cuter pour tester votre requ�te. 

### 4. Requ�tes simples sur la table "user"

4.1. S�lection des "vieux" "user"

- Nom de fichier :  
    
    P1-4-1-select-old-users.sql

- Description de la requ�te :

    S�lectionner le username et la date de cr�ation des utilisateurs cr��s avant le 1er septembre 2019 tri�s par ordre alphab�tique sur les "username".

> fix #1 requete P1-4-1 sur user

### 5. Cr�ation et initialisation de la table "activity"

En utilisant l'�diteur de requ�te "Query Tool" propos� par pgAdmin, utilisez les instructions SQL ci-dessous pour cr�er  et initialiser le contenu de la  table "activity".

    CREATE TABLE activity
    (
        id bigint NOT NULL,
        title character varying(200) NOT NULL,
        description text,
        creation_date timestamp without time zone NOT NULL DEFAULT now(),
        modification_date timestamp without time zone NOT NULL DEFAULT now(),
        owner_id bigint,
        CONSTRAINT activity_pkey PRIMARY KEY (id),
        CONSTRAINT activity_user_id_fk FOREIGN KEY (owner_id)
            REFERENCES "user" (id)
            ON DELETE CASCADE
    );


    INSERT INTO public.activity VALUES (1, 'Tennis de table', 'Activit� loisir tennis de table', '2019-01-21 11:30:00', '2019-01-21 11:30:00', 101);
    INSERT INTO public.activity VALUES (2, 'Th�atre', 'Club de th��tre amateur', '2019-01-21 11:30:00', '2019-01-21 11:30:00');
    INSERT INTO public.activity VALUES (3, 'Musique funk', 'Groupe de musique amateur passionn� de jazz fusion funk.', '2019-01-21 11:30:00', '2019-01-21 11:30:00');
    INSERT INTO public.activity VALUES (4, 'Football', 'Club de foot pour tous les ages', '2019-01-21 11:30:00', '2019-01-21 11:30:51.00', 102);

5.1. S�lection des activit�s et de leur propri�taires 

- Nom de fichier :  
    
    P1-5-1-select-all-activities.sql

- Description de la requ�te :

    S�lectionner le "title", la description et le "username" du propri�taire de toutes les activit�s cr��es apr�s le 1er septembre 2019 tri�s par ordre alphab�tique sur les "title" puis sur les "username".
    Si une activit� n'est attach�e � aucun propri�taire, la ligne correspondante doit s'afficher quand m�me avec le champ "username" laiss� vide. 

> fix #2 requete P1-5.1 sur activity