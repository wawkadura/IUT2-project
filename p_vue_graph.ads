with sequential_IO;
with text_io; use text_io;



package p_vue_graph is

	---- TYPES pour les cases de la grille --------------------------------------------------------------------------
	subtype T_Col is character range 'A'..'D';
	subtype T_Lig is integer range 1..4;
	subtype T_nbcases is positive range 3..7;
	type TR_Case is record
		nom	:	string(1..2); -- nom de la case (ex : "A1")
		valeur	:	positive;  -- nombre porté par la case (ex : 14)
	end record;

	
	---- Instanciation de sequential_IO pour le fichier de description de la grille ---------------------------------
	package p_cases_io is new sequential_IO (TR_Case); use p_Cases_IO;
	
	---- Instanciations de integer_io pour manipuler des entiers dans des fichiers texte ----------------------------
	package p_int_io is new integer_io(integer); use p_int_io;

	---- Type pour le vecteur de "travail" --------------------------------------------------------------------------
	type TV_Gaudi is array (positive range <>) of TR_Case;

	---- Recherche et affichage des combinaisons --------------------------------------------------------------------
	
	procedure CreeVectGaudi(f : in out p_cases_IO.file_type; V : out TV_Gaudi);
	-- {f ouvert, V de taille suffisante} => {le contenu de f a été copié dans V}

	procedure TriVectGaudi(V : in out TV_Gaudi);
	-- {} => {V est trié par nom de case} 

	procedure CreeFicsol(V : in TV_Gaudi; fsol : in out text_io.file_type);
	-- {f ouvert en écriture, V Trié par nom de case} 
	--	=> 	{fsol contient toutes les combinaisons gagnantes et est structurÃ© selon le format dÃ©fini (cf. sujet)}

	function nbCombi(fsol : in text_io.file_type; nbcases : in T_nbcases) return natural;
	-- {fsol ouvert, f- = <>} => {résultat = nombre de combinaisons en nbcases dans fsol}
	
	function Combi(fsol : in text_io.file_type; nbcases : in T_nbcases; numsol : in positive) return string;
		-- {fsol ouvert, f- = <>}
	-- => {résultat = chaîne représentant la solution numsol lue dans fsol pour une combinaison de nbcases}
	 function VerifCont (val,ValAut : string) return boolean;
    
    function est_contigue(sol : in string) return boolean;
		--{sol représente une solution} => {résultat = vrai si sol est une solution contigüe}
		

	
----------------------------------Graph--------------------------------------


----------------------------------Graph--------------------------------------
	
end p_vue_graph ;
