with p_fenbase ; use p_fenbase;
with Forms ; use Forms; 
with text_io; use text_io;
with p_vue_graph; use p_vue_graph;
with ada.calendar; use ada.calendar; 

procedure gaudigraph is 
	Acceuil , Combinaisons , Jeu ,Resultat :TR_Fenetre;
	Sortie, contigue , C3,C4,C5,C6,C7 , RS,stop:boolean ;
	start,finish: Time;
	nbsol,numsol: natural;
	nbcases:T_nbcases;
	g : text_io.file_type;
   f : p_cases_io.file_type;
   V : TV_Gaudi(1..16);
   Val:string (1..2);
	S3:string (1..6);
	S4:string (1..8);
	S5:string (1..10);
	S6:string (1..12);
	S7:string (1..14);
	Points,CHOIX ,SOMME:natural;
	

begin
	P_cases_io.open(f, P_cases_io.in_file, "CarreGaudi");
	CreeVectGaudi(f,V);
	create (g,out_file,"soluces");
	CreeFicsol(V,g);
	reset(g,in_file);

	reset(g,in_file);
	numsol:=1;
						
	InitialiserFenetres;
---------------Fenetre d'Acceuil-------------------------------------------
	Acceuil:=debutfenetre("Acceuil",800,400); --(LARGEUR , HAUTEUR)

		ajouterBouton (Acceuil,"FND","",0,0,800,500);
		ChangerEtatBouton(Acceuil,"FND",arret);
		ChangerCouleurFond (Acceuil , "FND",FL_TOP_BCOL ); 
		
		
		ajouterBouton (Acceuil,"BCB","Les Combinaisons",200,150,400,100);
		ajouterBouton (Acceuil,"BJE","Jeu",200,300,400,100);
		AjouterTexte (Acceuil, "TBV","BIENVENUE",300,50,200,50);

		ChangerCouleurTexte(Acceuil,"TBV", FL_DARKCYAN ); 
		ajouterBoutonRond(Acceuil , "EXT", "",10,10,40,40);
		ChangerCouleurFond (Acceuil , "BCB",FL_PALEGREEN );
		ChangerCouleurFond (Acceuil , "BJE",FL_PALEGREEN ); 
		ChangerCouleurFond (Acceuil , "EXT",FL_RED); 
		ChangerTailleTexte(Acceuil,"TBV", FL_HUGE_SIZE );
		ChangerStyleTexte(Acceuil,"TBV", FL_BOLD_STYLE);

		ChangerTailleTexte(Acceuil,"BCB", FL_MEDIUM_SIZE );
		ChangerTailleTexte(Acceuil,"BJE", FL_MEDIUM_SIZE );
		AjouterTexte (Acceuil, "TMB","Made by BLANCHARD Hugo & KADURA Elwalid ",10,410,400,25);
		ChangerCouleurFond (Acceuil , "TMB",FL_TOP_BCOL );
		ChangerCouleurFond (Acceuil , "TBV",FL_TOP_BCOL );
	FinFenetre(Acceuil);
	---------------Fenetre d'Acceuil-------------------------------------------

	
	--------------Fenetre de combinaisons--------------------------------------
	Combinaisons:=debutfenetre("Combinaisons",840,450); --(LARGEUR , HAUTEUR)
		AjouterBouton (Combinaisons,"FND","",0,0,1000,1000);
		ChangerEtatBouton(Combinaisons,"FND",arret);
		ChangerCouleurFond (Combinaisons , "FND",FL_TOP_BCOL );
		ajouterBouton (Combinaisons,"BA1","1",50,50,100,100);
		ajouterBouton (Combinaisons,"BA2","11",50,150,100,100);
		ajouterBouton (Combinaisons,"BA3","8",50,250,100,100);
		ajouterBouton (Combinaisons,"BA4","13",50,350,100,100);
		
		ajouterBouton (Combinaisons,"BB1","14",150,50,100,100);
		ajouterBouton (Combinaisons,"BB2","7",150,150,100,100);
		ajouterBouton (Combinaisons,"BB3","10",150,250,100,100);
		ajouterBouton (Combinaisons,"BB4","2",150,350,100,100);
		
		ajouterBouton (Combinaisons,"BC1","14",250,50,100,100);
		ajouterBouton (Combinaisons,"BC2","6",250,150,100,100);
		ajouterBouton (Combinaisons,"BC3","10",250,250,100,100);
		ajouterBouton (Combinaisons,"BC4","3",250,350,100,100);
		
		ajouterBouton (Combinaisons,"BD1","4",350,50,100,100);
		ajouterBouton (Combinaisons,"BD2","9",350,150,100,100);
		ajouterBouton (Combinaisons,"BD3","5",350,250,100,100);
		ajouterBouton (Combinaisons,"BD4","15",350,350,100,100);
		
		ChangerCouleurFond (Combinaisons , "BA1",FL_LEFT_BCOL );
		ChangerCouleurFond (Combinaisons , "BA2",FL_LEFT_BCOL );
		ChangerCouleurFond (Combinaisons , "BA3",FL_LEFT_BCOL );
		ChangerCouleurFond (Combinaisons , "BA4",FL_LEFT_BCOL );
		ChangerCouleurFond (Combinaisons , "BB1",FL_LEFT_BCOL );
		ChangerCouleurFond (Combinaisons , "BB2",FL_LEFT_BCOL );
		ChangerCouleurFond (Combinaisons , "BB3",FL_LEFT_BCOL );
		ChangerCouleurFond (Combinaisons , "BB4",FL_LEFT_BCOL );
		ChangerCouleurFond (Combinaisons , "BC1",FL_LEFT_BCOL );
		ChangerCouleurFond (Combinaisons , "BC2",FL_LEFT_BCOL );
		ChangerCouleurFond (Combinaisons , "BC3",FL_LEFT_BCOL ); 
		ChangerCouleurFond (Combinaisons , "BC4",FL_LEFT_BCOL ); 
		ChangerCouleurFond (Combinaisons , "BD1",FL_LEFT_BCOL ); 
		ChangerCouleurFond (Combinaisons , "BD2",FL_LEFT_BCOL ); 
		ChangerCouleurFond (Combinaisons , "BD3",FL_LEFT_BCOL ); 
		ChangerCouleurFond (Combinaisons , "BD4",FL_LEFT_BCOL ); 
		
		ChangerEtatBouton(Combinaisons,"BA1",arret);
		ChangerEtatBouton(Combinaisons,"BA2",arret);
		ChangerEtatBouton(Combinaisons,"BA3",arret);
		ChangerEtatBouton(Combinaisons,"BA4",arret);
		ChangerEtatBouton(Combinaisons,"BB1",arret);
		ChangerEtatBouton(Combinaisons,"BB2",arret);
		ChangerEtatBouton(Combinaisons,"BB3",arret);
		ChangerEtatBouton(Combinaisons,"BB4",arret);
		ChangerEtatBouton(Combinaisons,"BC1",arret);
		ChangerEtatBouton(Combinaisons,"BC2",arret);
		ChangerEtatBouton(Combinaisons,"BC3",arret);
		ChangerEtatBouton(Combinaisons,"BC4",arret);
		ChangerEtatBouton(Combinaisons,"BD1",arret);
		ChangerEtatBouton(Combinaisons,"BD2",arret);
		ChangerEtatBouton(Combinaisons,"BD3",arret);
		ChangerEtatBouton(Combinaisons,"BD4",arret);
		
		AjouterTexte (Combinaisons, "TBT","Veuillez choisir le nombre de cases a utiliser :",500,50,400,50);
		ChangerStyleTexte(Combinaisons,"TBT", FL_BOLD_STYLE);
		
		ajouterBouton (Combinaisons, "B3C","3",500,100,40,40);
		ajouterBouton (Combinaisons, "B4C","4",550,100,40,40);
		ajouterBouton (Combinaisons, "B5C","5",600,100,40,40);
		ajouterBouton (Combinaisons, "B6C","6",650,100,40,40);
		ajouterBouton (Combinaisons, "B7C","7",700,100,40,40);
		
		AjouterBouton (Combinaisons,"BCG","Combinaisons contigues uniquement",500,150,250,40);
		AjouterBouton (Combinaisons,"BRS","Reinitialiser",500,220,100,30); --reset
		AjouterBouton (Combinaisons,"BRT","Retour",5,5,50,30);
		AjouterTexte (Combinaisons, "TNS","Nombre de solutions : 0 ",500,300,200,40);
		AjouterTexte (Combinaisons, "TUS","Solution Numero : 0",500,330,200,40);
		ajouterBouton (Combinaisons,"BPD","<",500,400,50,30);
		ajouterBouton (Combinaisons,"BSV",">",580,400,50,30);

		ChangerCouleurFond (Combinaisons , "BPD",FL_MCOL ); --precedent
		ChangerCouleurFond (Combinaisons , "BSV",FL_MCOL ); --suivant
		ChangerCouleurFond (Combinaisons , "BRT",FL_INACTIVE ); --retour
		ChangerCouleurFond (Combinaisons , "BC",FL_MCOL ); --contigue
		ChangerCouleurFond (Combinaisons , "B3C",FL_MCOL );
		ChangerCouleurFond (Combinaisons , "B4C",FL_MCOL );
		ChangerCouleurFond (Combinaisons , "B5C",FL_MCOL );
		ChangerCouleurFond (Combinaisons , "B6C",FL_MCOL );
		ChangerCouleurFond (Combinaisons , "B7C",FL_MCOL );
		ChangerCouleurFond (Combinaisons , "BCG",FL_MCOL );
		ChangerCouleurFond (Combinaisons , "BRS",FL_MCOL );
		ChangerCouleurFond (Combinaisons , "TBT",FL_TOP_BCOL );
		ChangerCouleurFond (Combinaisons , "TUS",FL_PALEGREEN );
		ChangerCouleurFond (Combinaisons , "TNS",FL_PALEGREEN ); -- FL_PALEGREEN
		 
	FinFenetre(Combinaisons);

	-------------------Fenetre de Jeu------------------------------------------
	Jeu:=DebutFenetre("Jeu",500,600);
		AjouterBouton (Jeu,"FND","",0,0,1000,1000);
		ChangerEtatBouton(Jeu,"FND",arret);
		ChangerCouleurFond (Jeu , "FND",FL_TOP_BCOL );
	
		ajouterBouton (Jeu,"BA1","",50,100,100,100);
		ajouterBouton (Jeu,"BA2","",50,200,100,100);
		ajouterBouton (Jeu,"BA3","",50,300,100,100);
		ajouterBouton (Jeu,"BA4","",50,400,100,100);
		
		ajouterBouton (Jeu,"BB1","",150,100,100,100);
		ajouterBouton (Jeu,"BB2","",150,200,100,100);
		ajouterBouton (Jeu,"BB3","",150,300,100,100);
		ajouterBouton (Jeu,"BB4","",150,400,100,100);
		
		ajouterBouton (Jeu,"BC1","",250,100,100,100);
		ajouterBouton (Jeu,"BC2","",250,200,100,100);
		ajouterBouton (Jeu,"BC3","",250,300,100,100);
		ajouterBouton (Jeu,"BC4","",250,400,100,100);
		
		ajouterBouton (Jeu,"BD1","",350,100,100,100);
		ajouterBouton (Jeu,"BD2","",350,200,100,100);
		ajouterBouton (Jeu,"BD3","",350,300,100,100);
		ajouterBouton (Jeu,"BD4","",350,400,100,100);
	
		ChangerCouleurFond (Jeu , "BA1",FL_BOTTOM_BCOL );
		ChangerCouleurFond (Jeu , "BA2",FL_BOTTOM_BCOL );
		ChangerCouleurFond (Jeu , "BA3",FL_BOTTOM_BCOL );
		ChangerCouleurFond (Jeu , "BA4",FL_BOTTOM_BCOL );
		ChangerCouleurFond (Jeu , "BB1",FL_BOTTOM_BCOL );
		ChangerCouleurFond (Jeu , "BB2",FL_BOTTOM_BCOL );
		ChangerCouleurFond (Jeu , "BB3",FL_BOTTOM_BCOL );
		ChangerCouleurFond (Jeu , "BB4",FL_BOTTOM_BCOL );
		ChangerCouleurFond (Jeu , "BC1",FL_BOTTOM_BCOL );
		ChangerCouleurFond (Jeu , "BC2",FL_BOTTOM_BCOL );
		ChangerCouleurFond (Jeu , "BC3",FL_BOTTOM_BCOL ); 
		ChangerCouleurFond (Jeu , "BC4",FL_BOTTOM_BCOL ); 
		ChangerCouleurFond (Jeu , "BD1",FL_BOTTOM_BCOL ); 
		ChangerCouleurFond (Jeu , "BD2",FL_BOTTOM_BCOL ); 
		ChangerCouleurFond (Jeu , "BD3",FL_BOTTOM_BCOL ); 
		ChangerCouleurFond (Jeu , "BD4",FL_BOTTOM_BCOL );
		
		ChangerEtatBouton(Jeu,"BA1",arret);
		ChangerEtatBouton(Jeu,"BA2",arret);
		ChangerEtatBouton(Jeu,"BA3",arret);
		ChangerEtatBouton(Jeu,"BA4",arret);
		ChangerEtatBouton(Jeu,"BB1",arret);
		ChangerEtatBouton(Jeu,"BB2",arret);
		ChangerEtatBouton(Jeu,"BB3",arret);
		ChangerEtatBouton(Jeu,"BB4",arret);
		ChangerEtatBouton(Jeu,"BC1",arret);
		ChangerEtatBouton(Jeu,"BC2",arret);
		ChangerEtatBouton(Jeu,"BC3",arret);
		ChangerEtatBouton(Jeu,"BC4",arret);
		ChangerEtatBouton(Jeu,"BD1",arret);
		ChangerEtatBouton(Jeu,"BD2",arret);
		ChangerEtatBouton(Jeu,"BD3",arret);
		ChangerEtatBouton(Jeu,"BD4",arret);
		
		AjouterBouton (Jeu,"BRT","Retour",5,5,50,30);
		AjouterBouton (Jeu,"STP","STOP",440,5,50,30);
		ChangerCouleurFond (Jeu , "STP",FL_RED ); 
		CacherElem(Jeu,"STP"); 
		
		AjouterTexte (Jeu, "TCG","Faire des combinaisons de 3 a 7 cases dont la somme = 33 :",50,50,400,50);--TEXT slect combi
		CacherElem(Jeu,"TCG" );
		AjouterTexte (Jeu, "TFX","FAUX",110,500,60,50);
		ChangerCouleurTexte(Jeu,"TFX", FL_RED ); 
		ChangerStyleTexte(Jeu,"TFX", FL_BOLD_STYLE );
		CacherElem(Jeu,"TFX" );
		AjouterTexte (Jeu, "TVR","VRAI !",110,500,60,50);
		ChangerCouleurTexte(Jeu,"TVR", FL_GREEN );
		ChangerStyleTexte(Jeu,"TVR", FL_BOLD_STYLE );
		CacherElem(Jeu,"TVR");
		
		AjouterTexte (Jeu, "TRS","Resultat:",50,500,60,50);
		AjouterBouton (Jeu,"BCR","CLEAR",50,580,100,30);
		AjouterBouton (Jeu,"BVR","VALIDER",350,580,100,30);
		
		CacherElem(Jeu,"BCR");
		CacherElem(Jeu,"BVR");
		CacherElem(Jeu,"TRS");
		
		AjouterBouton (Jeu,"BDE","DEMARRER",150,510,200,50);
		
		AjouterTexte (Jeu, "TJ1","Objectif : Faire le plus possible de combinaisons de cases dont la somme=33",2,570,500,20);
		AjouterTexte (Jeu, "TJ2","puis taper STOP ",190,590,200,20);
		AjouterTexte (Jeu, "TJ3","Taper DEMARRER pour commencer",150,610,300,20);
		ChangerCouleurFond (Jeu , "TJ1",FL_TOP_BCOL ); 
		ChangerCouleurFond (Jeu , "TJ2",FL_TOP_BCOL );
		ChangerCouleurFond (Jeu , "TJ3",FL_TOP_BCOL );
		
		ChangerCouleurFond (Jeu , "BRT",FL_INACTIVE ); 
		ChangerCouleurFond (Jeu , "BCR",FL_MCOL );
		ChangerCouleurFond (Jeu , "BVR",FL_MCOL );
		ChangerCouleurFond (Jeu , "TRS",FL_TOP_BCOL );
		ChangerCouleurFond (Jeu , "TVR",FL_TOP_BCOL );
		ChangerCouleurFond (Jeu , "TFX",FL_TOP_BCOL );
		ChangerCouleurFond (Jeu , "TCG",FL_TOP_BCOL );
	FinFenetre(Jeu);
	-------------------Fenetre de Jeu-----------------------------------
	-------------------Fenetre Resultat-----------------------------------
	Resultat:=DebutFenetre("Resultat",300,50);
		AjouterBouton (Resultat,"FND","",0,0,1000,1000);
		ChangerEtatBouton(Resultat,"FND",arret);
		ChangerCouleurFond (Resultat , "FND",FL_PALEGREEN );--
		
		AjouterTexte (Resultat, "TTP","Temps ecouler : 0",10,30,200,20);
		AjouterTexte (Resultat, "TRE","Nombre de points obtenu : 0",10,50,250,20);
		AjouterBoutonRond (Resultat,"EXT","",265,5,30,30);
		ChangerCouleurFond(Resultat,"EXT", FL_RED ); 
		ChangerCouleurFond(Resultat,"TRE", FL_PALEGREEN ); 
		ChangerCouleurFond(Resultat,"TTP", FL_PALEGREEN ); 
		ChangerStyleTexte(Resultat,"TTP", FL_BOLD_STYLE );
		ChangerStyleTexte(Resultat,"TRE", FL_BOLD_STYLE );
	FinFenetre(Resultat);
	-------------------Fenetre Resultat-----------------------------------
	sortie:=false;
	MontrerFenetre (Acceuil);
	loop
	exit when Sortie=true;
		declare
		boutonAcc:string:=AttendreBouton(Acceuil);

		begin
	-------------------Combinaisons-----------------------------------
			
			if boutonAcc ="BCB" then
				CacherFenetre(Acceuil);
				MontrerFenetre (Combinaisons);
				declare
					boutonCombi:string:=AttendreBouton(Combinaisons);
				begin
					C3:=false;C4:=false;C5:=false;C6:=false;C7:=false;
				  while boutonCombi /= "BRT" loop
		
					if boutonCombi="BCG"  then --bouton contigue 
						ChangerCouleurFond (Combinaisons,"BCG",FL_DARKORANGE );
						contigue:=true;
					end if;
					---------3 cases----------------------------------------
					if BoutonCombi="B3C" or C3 then
						
						ChangerCouleurFond (Combinaisons , "B3C",FL_DARKORANGE );
						ChangerCouleurFond (Combinaisons , "B4C",FL_MCOL );
						ChangerCouleurFond (Combinaisons , "B5C",FL_MCOL );
						ChangerCouleurFond (Combinaisons , "B6C",FL_MCOL );
						ChangerCouleurFond (Combinaisons , "B7C",FL_MCOL );
						nbcases:=3;
						
						ChangerEtatBouton(Combinaisons,"B4C",arret);
						ChangerEtatBouton(Combinaisons,"B5C",arret);
						ChangerEtatBouton(Combinaisons,"B6C",arret);
						ChangerEtatBouton(Combinaisons,"B7C",arret);

						if not C3 then
							reset(g,in_file);
							nbsol:=nbcombi(g,nbcases);
						end if;
						C3:=true;C4:=false;C5:=false;C6:=false;C7:=false;				

						if boutonCombi="BSV" then
						RS:=false;
							if numsol=nbsol then
								numsol:=1;
							else	numsol:=numsol+1;
							end if;
						end if ;
						
						if boutonCombi="BPD" then
						RS:=false;
							if numsol=1 then
								numsol:=nbsol;
							else numsol:=numsol-1;
							end if;
						end if ;

						while  numsol<=nbsol and RS=false  loop
							ChangerCouleurFond (Combinaisons , "BA1",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BA2",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BA3",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BA4",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BB1",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BB2",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BB3",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BB4",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BC1",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BC2",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BC3",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BC4",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BD1",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BD2",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BD3",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BD4",FL_LEFT_BCOL );
						
							reset(g,in_file);
							S3:=combi(g,nbcases,numsol);
							--if contigue then
								--if not est_contigue(S3) then
									--loop
										--numsol:=numsol+1;
									--	S3:=combi(g,nbcases,numsol);
									--	reset(g,in_file);
									--	exit when est_contigue(S3) or numsol>nbsol;
								--	end loop;
							--	end if;
							--end if;
							Val:=S3(1..2);
							ChangerCouleurFond (Combinaisons , "B"&Val,FL_DARKORANGE );
							Val:=S3(3..4);
							ChangerCouleurFond (Combinaisons , "B"&Val,FL_DARKORANGE );
							Val:=S3(5..6);
							ChangerCouleurFond (Combinaisons , "B"&Val,FL_DARKORANGE );
							ChangerTexte(Combinaisons, "TNS" ,"Nombre de solutions : "& natural'image(natural(nbsol)));
							ChangerTexte(Combinaisons, "TUS" ,"Solution Numero : "& natural'image(natural(numsol)));
							RS:=true;
						end loop;
						
    	
						
					---------4 cases----------------------------------------
					elsif BoutonCombi="B4C"or C4 then
						ChangerCouleurFond (Combinaisons , "B3C",FL_MCOL );
						ChangerCouleurFond (Combinaisons , "B4C",FL_DARKORANGE );
						ChangerCouleurFond (Combinaisons , "B5C",FL_MCOL );
						ChangerCouleurFond (Combinaisons , "B6C",FL_MCOL );
						ChangerCouleurFond (Combinaisons , "B7C",FL_MCOL );
						nbcases:=4;
						
						ChangerEtatBouton(Combinaisons,"B3C",arret);
						ChangerEtatBouton(Combinaisons,"B5C",arret);
						ChangerEtatBouton(Combinaisons,"B6C",arret);
						ChangerEtatBouton(Combinaisons,"B7C",arret);

						if not C4  then
							reset(g,in_file);
							nbsol:=nbcombi(g,nbcases); 
						end if;				
						C3:=false;C4:=true;C5:=false;C6:=false;C7:=false;

						if boutonCombi="BSV" then
						RS:=false;
							if numsol=nbsol then
								numsol:=1;
							else	numsol:=numsol+1;
							end if;
						end if ;
						
						if boutonCombi="BPD" then
						RS:=false;
							if numsol=1 then
								numsol:=nbsol;
							else numsol:=numsol-1;
							end if;
						end if ;

						while  numsol<=nbsol and RS=false  loop
							ChangerCouleurFond (Combinaisons , "BA1",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BA2",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BA3",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BA4",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BB1",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BB2",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BB3",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BB4",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BC1",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BC2",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BC3",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BC4",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BD1",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BD2",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BD3",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BD4",FL_LEFT_BCOL );
						
							reset(g,in_file);
							S4:=combi(g,nbcases,numsol);
							--if contigue then
								--if not est_contigue(S4) then
									--loop
										--numsol:=numsol+1;
									--	S4:=combi(g,nbcases,numsol);
									--	reset(g,in_file);
									--	exit when est_contigue(S4) or numsol>nbsol;
								--	end loop;
							--	end if;
							--end if;
							Val:=S4(1..2);
							ChangerCouleurFond (Combinaisons , "B"&Val,FL_DARKORANGE );
							Val:=S4(3..4);
							ChangerCouleurFond (Combinaisons , "B"&Val,FL_DARKORANGE );
							Val:=S4(5..6);
							ChangerCouleurFond (Combinaisons , "B"&Val,FL_DARKORANGE );
							Val:=S4(7..8);
							ChangerCouleurFond (Combinaisons , "B"&Val,FL_DARKORANGE );
							ChangerTexte(Combinaisons, "TNS" , "Nombre de solutions : "& natural'image(natural(nbsol)));
							ChangerTexte(Combinaisons, "TUS" , "Solution Numero : "& natural'image(natural(numsol)));
							RS:=true;
						end loop;
					---------5 cases----------------------------------------
					elsif BoutonCombi="B5C" or C5 then
						ChangerCouleurFond (Combinaisons , "B3C",FL_MCOL );
						ChangerCouleurFond (Combinaisons , "B4C",FL_MCOL );
						ChangerCouleurFond (Combinaisons , "B5C",FL_DARKORANGE );
						ChangerCouleurFond (Combinaisons , "B6C",FL_MCOL );
						ChangerCouleurFond (Combinaisons , "B7C",FL_MCOL );
						nbcases:=5;
						
						ChangerEtatBouton(Combinaisons,"B3C",arret);
						ChangerEtatBouton(Combinaisons,"B4C",arret);
						ChangerEtatBouton(Combinaisons,"B6C",arret);
						ChangerEtatBouton(Combinaisons,"B7C",arret);
						
						if not C5 then
							reset(g,in_file);
							nbsol:=nbcombi(g,nbcases); 
						end if;				
						C3:=false;C4:=false;C5:=true;C6:=false;C7:=false;

						if boutonCombi="BSV" then
						RS:=false;
							if numsol=nbsol then
								numsol:=1;
							else	numsol:=numsol+1;
							end if;
						end if ;
						
						if boutonCombi="BPD" then
						RS:=false;
							if numsol=1 then
								numsol:=nbsol;
							else numsol:=numsol-1;
							end if;
						end if ;

						while  numsol<=nbsol and RS=false  loop
							ChangerCouleurFond (Combinaisons , "BA1",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BA2",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BA3",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BA4",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BB1",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BB2",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BB3",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BB4",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BC1",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BC2",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BC3",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BC4",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BD1",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BD2",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BD3",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BD4",FL_LEFT_BCOL );
							reset(g,in_file);
							S5:=combi(g,nbcases,numsol);
							--if contigue then
								--if not est_contigue(S5) then
									--loop
										--numsol:=numsol+1;
									--	S5:=combi(g,nbcases,numsol);
									--	reset(g,in_file);
									--	exit when est_contigue(S5) or numsol>nbsol;
								--	end loop;
							--	end if;
							--end if;
							
							Val:=S5(1..2);
							ChangerCouleurFond (Combinaisons , "B"&Val,FL_DARKORANGE );
							Val:=S5(3..4);
							ChangerCouleurFond (Combinaisons , "B"&Val,FL_DARKORANGE );
							Val:=S5(5..6);
							ChangerCouleurFond (Combinaisons , "B"&Val,FL_DARKORANGE );
							Val:=S5(7..8);
							ChangerCouleurFond (Combinaisons , "B"&Val,FL_DARKORANGE );
							Val:=S5(9..10);
							ChangerCouleurFond (Combinaisons , "B"&Val,FL_DARKORANGE );
							ChangerTexte(Combinaisons, "TNS" , "Nombre de solutions : "& natural'image(natural(nbsol)));
							ChangerTexte(Combinaisons, "TUS" , "Solution Numero : "& natural'image(natural(numsol)));
							RS:=true;
						end loop;
					---------6 cases----------------------------------------
					elsif BoutonCombi="B6C" or C6 then
						ChangerCouleurFond (Combinaisons , "B3C",FL_MCOL );
						ChangerCouleurFond (Combinaisons , "B4C",FL_MCOL );
						ChangerCouleurFond (Combinaisons , "B5C",FL_MCOL );
						ChangerCouleurFond (Combinaisons , "B6C",FL_DARKORANGE );
						ChangerCouleurFond (Combinaisons , "B7C",FL_MCOL );
						nbcases:=6;
						
						ChangerEtatBouton(Combinaisons,"B3C",arret);
						ChangerEtatBouton(Combinaisons,"B4C",arret);
						ChangerEtatBouton(Combinaisons,"B5C",arret);
						ChangerEtatBouton(Combinaisons,"B7C",arret);
						
						if not C6  then
							reset(g,in_file);
							nbsol:=nbcombi(g,nbcases); 
						end if;				
						C3:=false;C4:=false;C5:=false;C6:=true;C7:=false;

						if boutonCombi="BSV" then
						RS:=false;
							if numsol=nbsol then
								numsol:=1;
							else	numsol:=numsol+1;
							end if;
						end if ;
						
						if boutonCombi="BPD" then
						RS:=false;
							if numsol=1 then
								numsol:=nbsol;
							else numsol:=numsol-1;
							end if;
						end if ;

						while  numsol<=nbsol and RS=false  loop
							ChangerCouleurFond (Combinaisons , "BA1",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BA2",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BA3",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BA4",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BB1",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BB2",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BB3",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BB4",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BC1",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BC2",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BC3",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BC4",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BD1",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BD2",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BD3",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BD4",FL_LEFT_BCOL );
						
							reset(g,in_file);
							S6:=combi(g,nbcases,numsol);
							--if contigue then
								--if not est_contigue(S6) then
									--loop
										--numsol:=numsol+1;
									--	S6:=combi(g,nbcases,numsol);
									--	reset(g,in_file);
									--	exit when est_contigue(S6) or numsol>nbsol;
								--	end loop;
							--	end if;
							--end if;
							Val:=S6(1..2);
							ChangerCouleurFond (Combinaisons , "B"&Val,FL_DARKORANGE );
							Val:=S6(3..4);
							ChangerCouleurFond (Combinaisons , "B"&Val,FL_DARKORANGE );
							Val:=S6(5..6);
							ChangerCouleurFond (Combinaisons , "B"&Val,FL_DARKORANGE );
							Val:=S6(7..8);
							ChangerCouleurFond (Combinaisons , "B"&Val,FL_DARKORANGE );
							Val:=S6(9..10);
							ChangerCouleurFond (Combinaisons , "B"&Val,FL_DARKORANGE );
							Val:=S6(11..12);
							ChangerCouleurFond (Combinaisons , "B"&Val,FL_DARKORANGE );
							ChangerTexte(Combinaisons, "TNS" , "Nombre de solutions : "& natural'image(natural(nbsol)));
							ChangerTexte(Combinaisons, "TUS" , "Solution Numero : "& natural'image(natural(numsol)));
							RS:=true;
						end loop;
					---------7 cases----------------------------------------
					elsif BoutonCombi="B7C" or C7 then
					
						ChangerCouleurFond (Combinaisons , "B3C",FL_MCOL );
						ChangerCouleurFond (Combinaisons , "B4C",FL_MCOL );
						ChangerCouleurFond (Combinaisons , "B5C",FL_MCOL );
						ChangerCouleurFond (Combinaisons , "B6C",FL_MCOL );
						ChangerCouleurFond (Combinaisons , "B7C",FL_DARKORANGE );
						nbcases:=7;
						
						ChangerEtatBouton(Combinaisons,"B3C",arret);
						ChangerEtatBouton(Combinaisons,"B4C",arret);
						ChangerEtatBouton(Combinaisons,"B5C",arret);
						ChangerEtatBouton(Combinaisons,"B6C",arret);
						
						if not C7  then
							reset(g,in_file);
							nbsol:=nbcombi(g,nbcases); 
						end if;				
						C3:=false;C4:=false;C5:=false;C6:=false;C7:=true;

						if boutonCombi="BSV" then
						RS:=false;
							if numsol=nbsol then
								numsol:=1;
							else	numsol:=numsol+1;
							end if;
						end if ;
						
						if boutonCombi="BPD" then
						RS:=false;
							if numsol=1 then
								numsol:=nbsol;
							else numsol:=numsol-1;
							end if;
						end if ;

						while  numsol<=nbsol and RS=false  loop
							ChangerCouleurFond (Combinaisons , "BA1",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BA2",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BA3",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BA4",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BB1",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BB2",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BB3",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BB4",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BC1",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BC2",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BC3",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BC4",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BD1",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BD2",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BD3",FL_LEFT_BCOL );
							ChangerCouleurFond (Combinaisons , "BD4",FL_LEFT_BCOL );
						
							reset(g,in_file);
							S7:=combi(g,nbcases,numsol);
							--if contigue then
								--if not est_contigue(S7) then
									--loop
										--numsol:=numsol+1;
									--	S7:=combi(g,nbcases,numsol);
									--	reset(g,in_file);
									--	exit when est_contigue(S7) or numsol>nbsol;
								--	end loop;
							--	end if;
							--end if;
							Val:=S7(1..2);
							ChangerCouleurFond (Combinaisons , "B"&Val,FL_DARKORANGE );
							Val:=S7(3..4);
							ChangerCouleurFond (Combinaisons , "B"&Val,FL_DARKORANGE );
							Val:=S7(5..6);
							ChangerCouleurFond (Combinaisons , "B"&Val,FL_DARKORANGE );
							Val:=S7(7..8);
							ChangerCouleurFond (Combinaisons , "B"&Val,FL_DARKORANGE );
							Val:=S7(9..10);
							ChangerCouleurFond (Combinaisons , "B"&Val,FL_DARKORANGE );
							Val:=S7(11..12);
							ChangerCouleurFond (Combinaisons , "B"&Val,FL_DARKORANGE );
							Val:=S7(13..14);
							ChangerCouleurFond (Combinaisons , "B"&Val,FL_DARKORANGE );
							ChangerTexte(Combinaisons, "TNS" , "Nombre de solutions : "& natural'image(natural(nbsol)));
							ChangerTexte(Combinaisons, "TUS" , "Solution Numero : "& natural'image(natural(numsol)));
							RS:=true;
						end loop;
					end if;
					---------reinitialiser-----------------------------------
					if boutonCombi="BRS" or boutonCombi="BRT" then  -- bouton reinitialiser
						ChangerCouleurFond (Combinaisons,"BCG",FL_MCOL );
						ChangerCouleurFond (Combinaisons , "B3C",FL_MCOL );
						ChangerCouleurFond (Combinaisons , "B4C",FL_MCOL );
						ChangerCouleurFond (Combinaisons , "B5C",FL_MCOL );
						ChangerCouleurFond (Combinaisons , "B6C",FL_MCOL );
						ChangerCouleurFond (Combinaisons , "B7C",FL_MCOL );
						C3:=false;C4:=false;C5:=false;C6:=false;C7:=false;
						contigue:=false;
						RS:=false; numsol:=1;
						ChangerCouleurFond (Combinaisons , "BA1",FL_LEFT_BCOL );
						ChangerCouleurFond (Combinaisons , "BA2",FL_LEFT_BCOL );
						ChangerCouleurFond (Combinaisons , "BA3",FL_LEFT_BCOL );
						ChangerCouleurFond (Combinaisons , "BA4",FL_LEFT_BCOL );
						ChangerCouleurFond (Combinaisons , "BB1",FL_LEFT_BCOL );
						ChangerCouleurFond (Combinaisons , "BB2",FL_LEFT_BCOL );
						ChangerCouleurFond (Combinaisons , "BB3",FL_LEFT_BCOL );
						ChangerCouleurFond (Combinaisons , "BB4",FL_LEFT_BCOL );
						ChangerCouleurFond (Combinaisons , "BC1",FL_LEFT_BCOL );
						ChangerCouleurFond (Combinaisons , "BC2",FL_LEFT_BCOL );
						ChangerCouleurFond (Combinaisons , "BC3",FL_LEFT_BCOL );
						ChangerCouleurFond (Combinaisons , "BC4",FL_LEFT_BCOL );
						ChangerCouleurFond (Combinaisons , "BD1",FL_LEFT_BCOL );
						ChangerCouleurFond (Combinaisons , "BD2",FL_LEFT_BCOL );
						ChangerCouleurFond (Combinaisons , "BD3",FL_LEFT_BCOL );
						ChangerCouleurFond (Combinaisons , "BD4",FL_LEFT_BCOL );
						ChangerTexte(Combinaisons, "TNS" ,"Nombre de solutions : 0");
						ChangerTexte(Combinaisons, "TUS" ,"Solution Numero : 0");
						
						ChangerEtatBouton(Combinaisons,"B3C",marche);
						ChangerEtatBouton(Combinaisons,"B4C",marche);
						ChangerEtatBouton(Combinaisons,"B5C",marche);
						ChangerEtatBouton(Combinaisons,"B6C",marche);
						ChangerEtatBouton(Combinaisons,"B7C",marche);
						
					end if;
					---------reinitialiser-----------------------------------

					boutonCombi:=AttendreBouton(Combinaisons);
										
					end loop;
	--******************renitialise***********************************
					ChangerCouleurFond (Combinaisons,"BCG",FL_MCOL );
					ChangerCouleurFond (Combinaisons , "B3C",FL_MCOL );
					ChangerCouleurFond (Combinaisons , "B4C",FL_MCOL );
					ChangerCouleurFond (Combinaisons , "B5C",FL_MCOL );
					ChangerCouleurFond (Combinaisons , "B6C",FL_MCOL );
					ChangerCouleurFond (Combinaisons , "B7C",FL_MCOL );
					C3:=false;C4:=false;C5:=false;C6:=false;C7:=false;
					contigue:=false;
					RS:=false; numsol:=1;
					ChangerCouleurFond (Combinaisons , "BA1",FL_LEFT_BCOL );
					ChangerCouleurFond (Combinaisons , "BA2",FL_LEFT_BCOL );
					ChangerCouleurFond (Combinaisons , "BA3",FL_LEFT_BCOL );
					ChangerCouleurFond (Combinaisons , "BA4",FL_LEFT_BCOL );
					ChangerCouleurFond (Combinaisons , "BB1",FL_LEFT_BCOL );
					ChangerCouleurFond (Combinaisons , "BB2",FL_LEFT_BCOL );
					ChangerCouleurFond (Combinaisons , "BB3",FL_LEFT_BCOL );
					ChangerCouleurFond (Combinaisons , "BB4",FL_LEFT_BCOL );
					ChangerCouleurFond (Combinaisons , "BC1",FL_LEFT_BCOL );
					ChangerCouleurFond (Combinaisons , "BC2",FL_LEFT_BCOL );
					ChangerCouleurFond (Combinaisons , "BC3",FL_LEFT_BCOL );
					ChangerCouleurFond (Combinaisons , "BC4",FL_LEFT_BCOL );
					ChangerCouleurFond (Combinaisons , "BD1",FL_LEFT_BCOL );
					ChangerCouleurFond (Combinaisons , "BD2",FL_LEFT_BCOL );
					ChangerCouleurFond (Combinaisons , "BD3",FL_LEFT_BCOL );
					ChangerCouleurFond (Combinaisons , "BD4",FL_LEFT_BCOL );
					ChangerTexte(Combinaisons, "TNS" ,"Nombre de solutions : 0");
					ChangerTexte(Combinaisons, "TUS" ,"Solution Numero : 0");
					ChangerEtatBouton(Combinaisons,"B3C",marche);
					ChangerEtatBouton(Combinaisons,"B4C",marche);
					ChangerEtatBouton(Combinaisons,"B5C",marche);
					ChangerEtatBouton(Combinaisons,"B6C",marche);	
					
	--******************renitialise***********************************
					CacherFenetre(Combinaisons);
					MontrerFenetre (Acceuil);
				end;
	-------------------Combinaisons-----------------------------------
	-------------------Jeu--------------------------------------------
			elsif boutonAcc ="BJE" then
				   CacherFenetre(Acceuil);
					MontrerFenetre (Jeu);
					declare
						boutonJeu:string :=AttendreBouton(Jeu);
						deblocage,demarre:boolean:=false;
					begin
						CHOIX:=0;
						while boutonJeu /= "BRT" loop
							if boutonJeu="BDE" then
								Demarre:=true;
								deblocage := false;
								points:=0;
								SOMME:=0;
								stop:=false;
								start:=clock;
							end if;
							if Demarre then 
							-----------------deblocage du jeu----------------------
							if not Deblocage then
								MontrerElem(Jeu,"BCR");MontrerElem(Jeu,"TCG");
								MontrerElem(Jeu,"TRS"); MontrerElem(Jeu,"BVR");
								CacherElem(Jeu,"TJ1");CacherElem(Jeu,"BDE");
								CacherElem(Jeu,"TJ2"); CacherElem(Jeu,"TJ3");
								CacherElem(Jeu,"BRT"); MontrerElem(Jeu,"STP");
								ChangerEtatBouton(Jeu,"BA1",marche);
								ChangerEtatBouton(Jeu,"BA2",marche);
								ChangerEtatBouton(Jeu,"BA3",marche);
								ChangerEtatBouton(Jeu,"BA4",marche);
								ChangerEtatBouton(Jeu,"BB1",marche);
								ChangerEtatBouton(Jeu,"BB2",marche);
								ChangerEtatBouton(Jeu,"BB3",marche);
								ChangerEtatBouton(Jeu,"BB4",marche);
								ChangerEtatBouton(Jeu,"BC1",marche);
								ChangerEtatBouton(Jeu,"BC2",marche);
								ChangerEtatBouton(Jeu,"BC3",marche);
								ChangerEtatBouton(Jeu,"BC4",marche);
								ChangerEtatBouton(Jeu,"BD1",marche);
								ChangerEtatBouton(Jeu,"BD2",marche);
								ChangerEtatBouton(Jeu,"BD3",marche);
								ChangerEtatBouton(Jeu,"BD4",marche);
								ChangerCouleurFond (Jeu , "BA1",FL_LEFT_BCOL );
								ChangerCouleurFond (Jeu , "BA2",FL_LEFT_BCOL );
								ChangerCouleurFond (Jeu , "BA3",FL_LEFT_BCOL );
								ChangerCouleurFond (Jeu , "BA4",FL_LEFT_BCOL );
								ChangerCouleurFond (Jeu , "BB1",FL_LEFT_BCOL );
								ChangerCouleurFond (Jeu , "BB2",FL_LEFT_BCOL );
								ChangerCouleurFond (Jeu , "BB3",FL_LEFT_BCOL );
								ChangerCouleurFond (Jeu , "BB4",FL_LEFT_BCOL );
								ChangerCouleurFond (Jeu , "BC1",FL_LEFT_BCOL );
								ChangerCouleurFond (Jeu , "BC2",FL_LEFT_BCOL );
								ChangerCouleurFond (Jeu , "BC3",FL_LEFT_BCOL );
								ChangerCouleurFond (Jeu , "BC4",FL_LEFT_BCOL );
								ChangerCouleurFond (Jeu , "BD1",FL_LEFT_BCOL );
								ChangerCouleurFond (Jeu , "BD2",FL_LEFT_BCOL );
								ChangerCouleurFond (Jeu , "BD3",FL_LEFT_BCOL );
								ChangerCouleurFond (Jeu , "BD4",FL_LEFT_BCOL );
								ChangerTexte (Jeu , "BA1","1" );
								ChangerTexte (Jeu , "BA2","11" );
								ChangerTexte (Jeu , "BA3","8" );
								ChangerTexte (Jeu , "BA4","13" );
								ChangerTexte (Jeu , "BB1","14" );
								ChangerTexte (Jeu , "BB2","7" );
								ChangerTexte (Jeu , "BB3","10" );
								ChangerTexte (Jeu , "BB4","2" );
								ChangerTexte (Jeu , "BC1","14" );
								ChangerTexte (Jeu , "BC2","6" );
								ChangerTexte (Jeu , "BC3","10" );
								ChangerTexte (Jeu , "BC4","3" );
								ChangerTexte (Jeu , "BD1","4" );
								ChangerTexte (Jeu , "BD2","9" );
								ChangerTexte (Jeu , "BD3","5" );
								ChangerTexte (Jeu , "BD4","15" );
								deblocage := true;
							end if;
								-----------------deblocage du jeu----------------------
								

								if boutonJeu="BA1" then
									if CHOIX<7 then  
										ChangerCouleurFond (Jeu , "BA1",FL_DARKORANGE );										ChangerEtatBouton(Jeu,"BA1",arret);
										SOMME:=SOMME+1;
										CHOIX:=CHOIX+1;
									end if;
								end if;
								if boutonJeu="BA2" then
									if CHOIX<7 then  
										ChangerCouleurFond (Jeu , "BA2",FL_DARKORANGE );										ChangerEtatBouton(Jeu,"BA2",arret);
										SOMME:=SOMME+11;
										CHOIX:=CHOIX+1;
									end if;
								end if;
								if boutonJeu="BA3" then
									if CHOIX<7 then  
										ChangerCouleurFond (Jeu , "BA3",FL_DARKORANGE );										ChangerEtatBouton(Jeu,"BA3",arret);
										SOMME:=SOMME+8;
										CHOIX:=CHOIX+1;
									end if;
								end if;
								if boutonJeu="BA4" then
									if CHOIX<7 then  
										ChangerCouleurFond (Jeu , "BA4",FL_DARKORANGE );										ChangerEtatBouton(Jeu,"BA4",arret);
										SOMME:=SOMME+13;
										CHOIX:=CHOIX+1;
									end if;
								end if;
								if boutonJeu="BB1" then
									if CHOIX<7 then  
										ChangerCouleurFond (Jeu , "BB1",FL_DARKORANGE );										ChangerEtatBouton(Jeu,"BB1",arret);
										SOMME:=SOMME+14;
										CHOIX:=CHOIX+1;
									end if;
								end if;
								if boutonJeu="BB2" then
									if CHOIX<7 then  
										ChangerCouleurFond (Jeu , "BB2",FL_DARKORANGE );										ChangerEtatBouton(Jeu,"BB2",arret);
										SOMME:=SOMME+7;
										CHOIX:=CHOIX+1;
									end if;
								end if;
								if boutonJeu="BB3" then
									if CHOIX<7 then  
										ChangerCouleurFond (Jeu , "BB3",FL_DARKORANGE );										ChangerEtatBouton(Jeu,"BB3",arret);
										SOMME:=SOMME+10;
										CHOIX:=CHOIX+1;
									end if;
								end if;
								if boutonJeu="BB4" then
									if CHOIX<7 then  
										ChangerCouleurFond (Jeu , "BB4",FL_DARKORANGE );										ChangerEtatBouton(Jeu,"BB4",arret);
										SOMME:=SOMME+2;
										CHOIX:=CHOIX+1;
									end if;
								end if;
																
								if boutonJeu="BC1" then
									if CHOIX<7 then  
										ChangerCouleurFond (Jeu , "BC1",FL_DARKORANGE );										ChangerEtatBouton(Jeu,"BC1",arret);
										SOMME:=SOMME+14;
										CHOIX:=CHOIX+1;
									end if;
								end if;
															
								if boutonJeu="BC2" then
									if CHOIX<7 then  
										ChangerCouleurFond (Jeu , "BC2",FL_DARKORANGE );										ChangerEtatBouton(Jeu,"BC2",arret);
										SOMME:=SOMME+6;
										CHOIX:=CHOIX+1;
									end if;
								end if;
															
								if boutonJeu="BC3" then
									if CHOIX<7 then  
										ChangerCouleurFond (Jeu , "BC3",FL_DARKORANGE );										ChangerEtatBouton(Jeu,"BC3",arret);
										SOMME:=SOMME+10;
										CHOIX:=CHOIX+1;
									end if;
								end if;
								if boutonJeu="BC4" then
									if CHOIX<7 then  
										ChangerCouleurFond (Jeu , "BC4",FL_DARKORANGE );										ChangerEtatBouton(Jeu,"BC4",arret);
										SOMME:=SOMME+3;
										CHOIX:=CHOIX+1;
									end if;
								end if;
								if boutonJeu="BD1" then
									if CHOIX<7 then  
										ChangerCouleurFond (Jeu , "BD1",FL_DARKORANGE );										ChangerEtatBouton(Jeu,"BD1",arret);
										SOMME:=SOMME+4;
										CHOIX:=CHOIX+1;
									end if;
								end if;
																
								if boutonJeu="BD2" then
									if CHOIX<7 then  
										ChangerCouleurFond (Jeu , "BD2",FL_DARKORANGE );										ChangerEtatBouton(Jeu,"BD2",arret);
										SOMME:=SOMME+9;
										CHOIX:=CHOIX+1;
									end if;
								end if;
															
								if boutonJeu="BD3" then
									if CHOIX<7 then  
										ChangerCouleurFond (Jeu , "BD3",FL_DARKORANGE );										ChangerEtatBouton(Jeu,"BD3",arret);
										SOMME:=SOMME+5;
										CHOIX:=CHOIX+1;
									end if;
								end if;
								if boutonJeu="BD4" then
									if CHOIX<7 then  
										ChangerCouleurFond (Jeu , "BD4",FL_DARKORANGE );										ChangerEtatBouton(Jeu,"BD4",arret);
										SOMME:=SOMME+15;
										CHOIX:=CHOIX+1;
									end if;
								end if;
								if boutonJeu= "STP" then
									stop:=true;
								end if;
								
								if boutonJeu="BVR"then
									if SOMME= 33 then 
										MontrerElem(Jeu,"TVR");
										Points:=Points+choix;
									else MontrerElem(Jeu,"TFX");
									end if;
									SOMME:=0; CHOIX:=0;
								end if;
								
								if boutonJeu="BCR" then
									ChangerCouleurFond (Jeu , "BA1",FL_LEFT_BCOL );
									ChangerCouleurFond (Jeu , "BA2",FL_LEFT_BCOL );
									ChangerCouleurFond (Jeu , "BA3",FL_LEFT_BCOL );
									ChangerCouleurFond (Jeu , "BA4",FL_LEFT_BCOL );
									ChangerCouleurFond (Jeu , "BB1",FL_LEFT_BCOL );
									ChangerCouleurFond (Jeu , "BB2",FL_LEFT_BCOL );
									ChangerCouleurFond (Jeu , "BB3",FL_LEFT_BCOL );
									ChangerCouleurFond (Jeu , "BB4",FL_LEFT_BCOL );
									ChangerCouleurFond (Jeu , "BC1",FL_LEFT_BCOL );
									ChangerCouleurFond (Jeu , "BC2",FL_LEFT_BCOL );
									ChangerCouleurFond (Jeu , "BC3",FL_LEFT_BCOL );
									ChangerCouleurFond (Jeu , "BC4",FL_LEFT_BCOL );
									ChangerCouleurFond (Jeu , "BD1",FL_LEFT_BCOL );
									ChangerCouleurFond (Jeu , "BD2",FL_LEFT_BCOL );
									ChangerCouleurFond (Jeu , "BD3",FL_LEFT_BCOL );
									ChangerCouleurFond (Jeu , "BD4",FL_LEFT_BCOL );
									ChangerEtatBouton(Jeu,"BA1",marche);
									ChangerEtatBouton(Jeu,"BA2",marche);
									ChangerEtatBouton(Jeu,"BA3",marche);
									ChangerEtatBouton(Jeu,"BA4",marche);
									ChangerEtatBouton(Jeu,"BB1",marche);
									ChangerEtatBouton(Jeu,"BB2",marche);
									ChangerEtatBouton(Jeu,"BB3",marche);
									ChangerEtatBouton(Jeu,"BB4",marche);
									ChangerEtatBouton(Jeu,"BC1",marche);
									ChangerEtatBouton(Jeu,"BC2",marche);
									ChangerEtatBouton(Jeu,"BC3",marche);
									ChangerEtatBouton(Jeu,"BC4",marche);
									ChangerEtatBouton(Jeu,"BD1",marche);
									ChangerEtatBouton(Jeu,"BD2",marche);
									ChangerEtatBouton(Jeu,"BD3",marche);
									ChangerEtatBouton(Jeu,"BD4",marche);
									CacherElem(Jeu,"TFX"); cacherElem(Jeu,"TVR");
									SOMME:=0; CHOIX:=0;
								end if ;

							

							if stop then	
					-----------------blocage du jeu----------------------
								CacherElem(Jeu,"BCR");CacherElem(Jeu,"TGC");
								CacherElem(Jeu,"TRS"); CacherElem(Jeu,"BVR");
								CacherElem(Jeu,"STP"); MontrerElem(Jeu,"BRT");
								MontrerElem(Jeu,"TJ1");MontrerElem(Jeu,"BDE");
								MontrerElem(Jeu,"TJ2"); MontrerElem(Jeu,"TJ3");
								cacherElem(Jeu,"TVR");CacherElem(Jeu,"TFX"); 
								ChangerEtatBouton(Jeu,"BA1",arret);
								ChangerEtatBouton(Jeu,"BA2",arret);
								ChangerEtatBouton(Jeu,"BA3",arret);
								ChangerEtatBouton(Jeu,"BA4",arret);
								ChangerEtatBouton(Jeu,"BB1",arret);
								ChangerEtatBouton(Jeu,"BB2",arret);
								ChangerEtatBouton(Jeu,"BB3",arret);
								ChangerEtatBouton(Jeu,"BB4",arret);
								ChangerEtatBouton(Jeu,"BC1",arret);
								ChangerEtatBouton(Jeu,"BC2",arret);
								ChangerEtatBouton(Jeu,"BC3",arret);
								ChangerEtatBouton(Jeu,"BC4",arret);
								ChangerEtatBouton(Jeu,"BD1",arret);
								ChangerEtatBouton(Jeu,"BD2",arret);
								ChangerEtatBouton(Jeu,"BD3",arret);
								ChangerEtatBouton(Jeu,"BD4",arret);
								ChangerCouleurFond (Jeu , "BA1",FL_BOTTOM_BCOL );
								ChangerCouleurFond (Jeu , "BA2",FL_BOTTOM_BCOL );
								ChangerCouleurFond (Jeu , "BA3",FL_BOTTOM_BCOL );
								ChangerCouleurFond (Jeu , "BA4",FL_BOTTOM_BCOL );
								ChangerCouleurFond (Jeu , "BB1",FL_BOTTOM_BCOL );
								ChangerCouleurFond (Jeu , "BB2",FL_BOTTOM_BCOL );
								ChangerCouleurFond (Jeu , "BB3",FL_BOTTOM_BCOL );
								ChangerCouleurFond (Jeu , "BB4",FL_BOTTOM_BCOL );
								ChangerCouleurFond (Jeu , "BC1",FL_BOTTOM_BCOL );
								ChangerCouleurFond (Jeu , "BC2",FL_BOTTOM_BCOL );
								ChangerCouleurFond (Jeu , "BC3",FL_BOTTOM_BCOL );
								ChangerCouleurFond (Jeu , "BC4",FL_BOTTOM_BCOL );
								ChangerCouleurFond (Jeu , "BD1",FL_BOTTOM_BCOL );
								ChangerCouleurFond (Jeu , "BD2",FL_BOTTOM_BCOL );
								ChangerCouleurFond (Jeu , "BD3",FL_BOTTOM_BCOL );
								ChangerCouleurFond (Jeu , "BD4",FL_BOTTOM_BCOL );
								ChangerTexte (Jeu , "BA1","" );
								ChangerTexte (Jeu , "BA2","" );
								ChangerTexte (Jeu , "BA3","" );
								ChangerTexte (Jeu , "BA4","" );
								ChangerTexte (Jeu , "BB1","" );
								ChangerTexte (Jeu , "BB2","" );
								ChangerTexte (Jeu , "BB3","" );
								ChangerTexte (Jeu , "BB4","" );
								ChangerTexte (Jeu , "BC1","" );
								ChangerTexte (Jeu , "BC2","" );
								ChangerTexte (Jeu , "BC3","" );
								ChangerTexte (Jeu , "BC4","" );
								ChangerTexte (Jeu , "BD1","" );
								ChangerTexte (Jeu , "BD2","" );
								ChangerTexte (Jeu , "BD3","" );
								ChangerTexte (Jeu , "BD4","" );
						-----------------blocage du jeu----------------------
								finish:=clock;
								SOMME:=0; CHOIX:=0;
								Demarre:=false;
								MontrerFenetre(Resultat);
								ChangerTexte(Resultat, "TRE" ,"Nombre de points obtenu : "&natural'image(natural(Points)));
								ChangerTexte(Resultat, "TTP" ,"Temps ecouler :"&natural'image(natural(finish-start))&" seconds");
								if AttendreBouton(Resultat)="EXT"  then
									points:=0;
									CacherFenetre(Resultat);
								end if;
							end if;
							
						
							end if;
							
							
							boutonJeu:=AttendreBouton(Jeu);
						end loop;
						
					
						CacherFenetre(Jeu);
						MontrerFenetre (Acceuil);
					end;
	-------------------Jeu--------------------------------------------
			else  Sortie:=true;
				
			end if;
		end;


	end loop;
end gaudigraph;

