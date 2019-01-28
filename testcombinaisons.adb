with sequential_IO;
with text_io; use text_io;
with p_esiut; use p_esiut;
with p_combinaisons; use p_combinaisons;

procedure testcombinaisons is
g : text_io.file_type;
f : p_cases_io.file_type;
V : TV_Gaudi(1..16);
nbsol: natural;
nbcases:T_nbcases;
nb:positive;
begin 

	P_cases_io.open(f, P_cases_io.in_file, "CarreGaudi");
	CreeVectGaudi(f,V);
	for i in V'first..V'last loop
		Ecrire(V(i).nom); Ecrire_ligne(V(i).valeur);
	end loop;
	
	create (g,out_file,"soluces");
	CreeFicsol(V,g);
	a_la_ligne;
	reset(g,in_file);
	ecrire("veuillez ecrire la combinaisons de cases voulu :");
	lire(nb);
	while (nb < 3) or (nb > 7)loop 
		ecrire("veuillez saisir un entier compris entre 3 et 7 : ");
		lire(nb);
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
end testcombinaisons;
