with p_vue_text; use p_vue_text;
with text_io; use text_io;
with p_esiut; use p_esiut;

procedure Gauditext is
	nbsol: natural;
	nbcases:T_nbcases;
	g : text_io.file_type;
	nb:integer;
    rep,rep1 : string (1..3);
    f : p_cases_io.file_type;
    V : TV_Gaudi(1..16);
begin

    ecrire_ligne("                  A     B     C     D   ");
    ecrire_ligne("               *-----*-----*-----*-----*");
    ecrire_ligne("               |     |     |     |     |");
    ecrire_ligne("             1 |  1  |  14 |  14 |  4  |");
    ecrire_ligne("               |     |     |     |     |");
    ecrire_ligne("               *-----*-----*-----*-----*");
    ecrire_ligne("               |     |     |     |     |");
    ecrire_ligne("             2 |  11 |  7  |  6  |  9  |");
    ecrire_ligne("               |     |     |     |     |");
    ecrire_ligne("               *-----*-----*-----*-----*");
    ecrire_ligne("               |     |     |     |     |");
    ecrire_ligne("             3 |  8  | 10  |  10 |  5  |");
    ecrire_ligne("               |     |     |     |     |");
    ecrire_ligne("               *-----*-----*-----*-----*");
    ecrire_ligne("               |     |     |     |     |");
    ecrire_ligne("             4 |  13 |  2  |  3  |  15 |");
    ecrire_ligne("               |     |     |     |     |");
    ecrire_ligne("               *-----*-----*-----*-----*");
     
    
    
   P_cases_io.open(f, P_cases_io.in_file, "CarreGaudi");
	CreeVectGaudi(f,V);
	create (g,out_file,"soluces");
	CreeFicsol(V,g);
	a_la_ligne;
	loop
	reset(g,in_file);
    ecrire("Saisissez un nombre de cases (entre 3 et 7) : "); lire(nb);
    
    while (nb <3) or (nb>7) loop
        ecrire("Saisissez un nombre compris entre 3 et 7. Recommencez : "); lire(nb);
    end loop;
       nbcases:=nb;

	reset(g,in_file);

		ecrire("*");
		nbsol:=nbcombi(g,nbcases);
	if nbcases=3 then 
			ecrire (nbsol);ecrire_ligne(" solutions en 3 cases ");
			elsif nbcases=4 then
				ecrire (nbsol);ecrire_ligne(" solutions en 4 cases ");
			elsif nbcases=5 then 
				ecrire (nbsol);ecrire_ligne(" solutions en 5 cases ");
			elsif nbcases=6 then
				ecrire (nbsol);ecrire_ligne(" solutions en 6 cases ");
			elsif nbcases=7 then
				ecrire (nbsol);ecrire_ligne(" solutions en 7 cases ");
		end if;
	reset(g,in_file);
		ecrire_ligne("---------------------");
		for numsol in 1..nbsol loop
			ecrire("solution "); ecrire(numsol); ecrire(" /"); ecrire(nbsol);  ecrire(" : ");
				reset(g,in_file);
			ecrire_ligne(combi(g,nbcases,numsol));
		end loop;
    
    
    
    ecrire("voulez vous mettre fin au programme (oui/non) : "); lire(rep1);
    while (rep1/="oui") and (rep1/="non") loop
        ecrire("voulez vous mettre fin au programme (oui/non) Recommencez : ");
        lire(rep1);
    end loop;
    rep:=rep1;
    exit when rep="oui";
    end loop;
    
	ecrire("fin du programme ! ");
end Gauditext;
    







    
