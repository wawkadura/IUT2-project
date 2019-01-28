with sequential_IO;
with text_io; use text_io;
with p_esiut; use p_esiut;
with p_fenbase ; use p_fenbase;
with Forms ; use Forms; 

package body p_vue_graph is

	procedure CreeVectGaudi(f : in out p_cases_IO.file_type; V : out TV_Gaudi) is
	-- {f ouvert, V de taille suffisante} => {le contenu de f a été copié dans V}
	i : integer := V'First;
	begin 			
		
		while not end_of_file(f) loop
			read(f,V(i));
			i:=i+1;
		end loop;
		
	end CreeVectGaudi;
--*****************************************************************************
	procedure permut(a,b : in out TR_Case) is
	sauv : TR_Case;
	begin
		
		sauv := a;
		a := b;
		b := sauv;

	end permut;
--*****************************************************************************
	procedure TriVectGaudi(V : in out TV_Gaudi) is
	-- {} => {V est trié par nom de case} 

	begin
		
		for i in V'First..V'last-1 loop
			for j in reverse i+1..V'Last loop
				if V(j).nom < V(j-1).nom then
					permut(V(j), V(j-1));
				end if;
			end loop;
		end loop;	
			
	end TriVectGaudi;

--*****************************************************************************
	procedure CreeFicsol(V : in TV_Gaudi; fsol : in out text_io.file_type) is 
	--{f ouvert en écriture, V Trié par nom de case} 
	--	=> 	{fsol contient toutes les combinaisons gagnantes et est structuré selon le 	format défini (cf. sujet)}
	a,b,c,d,e,f,g : integer;
	u,w,x,y,z: integer;
	N:text_io.file_type;
	s3 : string(1..6);
	s4 : string(1..8);
	s5 : string(1..10);
	s6 : string(1..12);
	s7 : string(1..14);


	begin
	create(N,out_file,"temp");
--------------------3 cases---------------------------------------------------
	
	u:=0;
	a:= V'First; b:= V'First+1; c:= V'First+2;

	
	while a <= V'last-2 loop
		while b <= V'Last-1 loop
			while c <= V'Last loop
				if (V(a).valeur+V(b).valeur+V(c).valeur)=33 then
				put_line(N, V(a).nom&V(b).nom&V(c).nom);
				u:= u+1;
				end if;
				c:=c+1;
			end loop;
			b:=b+1; c:=b+1;
		end loop;
		a:=a+1;b:=a+1; c:=b+1;
	end loop;
	put(fsol,3,1); put(fsol,u,3); new_line(fsol);
	reset(N,in_file);
	while not end_of_file(N) loop
		get(N,s3);
		put_line(fsol,s3);
	end loop;
	reset(N,out_file);
--------------------4 cases---------------------------------------------------
	a:= V'First; b:= V'First+1; c:= V'First+2; d:= V'first+3;
	w:=0;

	while a <= V'last-3 loop
		while b <= V'Last-2 loop
			while c <= V'Last-1 loop
				while d <= V'Last loop
					if (V(a).valeur+V(b).valeur+V(c).valeur+V(d).valeur)=33 then
					put_line(N, V(a).nom&V(b).nom&V(c).nom&V(d).nom);
					w:= w+1;
					end if;
					d:=d+1;
				end loop;
				c:= c+1; d:=c+1;
			end loop;
			b:=b+1; c:=b+1; d:=c+1;
		end loop;
		a:=a+1; b:=a+1; c:=b+1; d:=c+1;
	end loop;
	put(fsol,4,1); put(fsol,w,3);new_line(fsol);
		reset(N,in_file);
	while not end_of_file(N) loop
		get(N,s4);
		put_line(fsol,s4);
	end loop;
	reset(N,out_file);
--------------------5 cases---------------------------------------------------

	a:= V'First; b:= V'First+1; c:= V'First+2; d:= V'first+3; e:= V'First+4;
	x:=0;

	while a <= V'last-4 loop
		while b <= V'Last-3 loop
			while c <= V'Last-2 loop
				while d <= V'Last-1 loop
					while e <= V'Last loop
						if (V(a).valeur+V(b).valeur+V(c).valeur+V(d).valeur+V(e).valeur)=33
						then put_line(N, V(a).nom&V(b).nom&V(c).nom&V(d).nom&V(e).nom);
						x:= x+1;
						end if;
						e:=e+1;
					end loop;
					d:=d+1; e:=d+1;
				end loop;
				c:=c+1; d:=c+1; e:=d+1;
			end loop;
			b:=b+1; c:=b+1; d:=c+1; e:=d+1;
		end loop;
		a:=a+1; b:=a+1; c:=b+1; d:=c+1; e:=d+1;
	end loop;
	put(fsol,5,1); put(fsol,x,4); new_line(fsol);
			reset(N,in_file);
	while not end_of_file(N) loop
		get(N,s5);
		put_line(fsol,s5);
	end loop;
	reset(N,out_file);
--------------------6 cases---------------------------------------------------

	a:= V'First; b:= V'First+1; c:= V'First+2; d:= V'first+3; e:= V'First+4; f:= V'First+5;
	y:=0;

	while a <= V'last-5 loop
		while b <= V'Last-4 loop
			while c <= V'Last-3 loop
				while d <= V'Last-2 loop
					while e <= V'Last-1 loop
						while f <= V'Last loop
							if (V(a).valeur+V(b).valeur+V(c).valeur+V(d).valeur+V(e).valeur+V(f).valeur)=33 then
								put_line(N, V(a).nom&V(b).nom&V(c).nom&V(d).nom&V(e).nom&V(f).nom);
								y:= y+1;
							end if;
							f:=f+1;
						end loop;
						e:=e+1; f:=e+1;				
					end loop;
					d:=d+1; e:=d+1; f:=e+1;
				end loop;
				c:=c+1; d:=c+1; e:=d+1;	f:=e+1;
			end loop;
			b:=b+1; c:=b+1; d:=c+1; e:=d+1; f:=e+1;
		end loop;
		a:=a+1; b:=a+1; c:=b+1; d:=c+1; e:=d+1; f:=e+1;
	end loop;
	put(fsol,6,1); put(fsol,y,3); new_line(fsol);
			reset(N,in_file);
	while not end_of_file(N) loop
		get(N,s6);
		put_line(fsol,s6);
	end loop;
	reset(N,out_file);
--------------------7 cases---------------------------------------------------
	a:= V'First; b:= V'First+1; c:= V'First+2; d:= V'first+3; e:= V'First+4; f:= V'First+5; g:= V'First+6;
	z:=0;

	while a <= V'last-6 loop
		while b <= V'Last-5 loop
			while c <= V'Last-4 loop
				while d <= V'Last-3 loop
					while e <= V'Last-2 loop
						while f <= V'Last-1 loop
							while g <= V'Last loop	
								if (V(a).valeur+V(b).valeur+V(c).valeur+V(d).valeur+V(e).valeur+V(f).valeur+V(g).valeur)=33 then
								put_line(N, V(a).nom&V(b).nom&V(c).nom&V(d).nom&V(e).nom&V(f).nom&V(g).nom);
								z:= z+1;
							end if;
							g:=g+1;
							end loop;
							f:=f+1; g:=f+1;
						end loop;
						e:=e+1; f:=e+1; g:=f+1;
					end loop;
					d:=d+1; e:=d+1; f:=e+1; g:=f+1;
				end loop;
				c:=c+1; d:=c+1; e:=d+1;	f:=e+1; g:=f+1;	
			end loop;
			b:=b+1; c:=b+1; d:=c+1; e:=d+1; f:=e+1; g:=f+1;	
		end loop;
		a:=a+1; b:=a+1; c:=b+1; d:=c+1; e:=d+1; f:=e+1; g:=f+1;					
	end loop;
	put(fsol,7,1); put(fsol,z,3);	new_line(fsol);
	reset(N,in_file);
	while not end_of_file(N) loop
		get(N,s7);
		put_line(fsol,s7);
	end loop;

	delete(N);
	end CreeFicsol ;

--*****************************************************************************
	function nbCombi(fsol : in text_io.file_type; nbcases : in T_nbcases) return natural is
	-- {fsol ouvert, f- = <>} => {résultat = nombre de combinaisons en nbcases dans fsol}
	s:string(1..20);
	lg,soluce:natural;
	begin 
		soluce:=0;
		while not end_of_file(fsol) loop
			get_line(fsol,s,lg);
			
			declare Tligne: string (1..lg);
			begin
			if Tligne'length=6 then
				if nbcases=3 then
					soluce:=soluce+1;
				end if;
			end if;
			if Tligne'length=8 then
				if nbcases=4 then
					soluce:=soluce+1;
				end if;
			end if;
			if Tligne'length=10 then
				if nbcases=5 then
					soluce:=soluce+1;
				end if;
			end if;
			if Tligne'length=12 then
				if nbcases=6 then
					soluce:=soluce+1;
				end if;
			end if;
			if Tligne'length=14 then
				if nbcases=7 then
					soluce:=soluce+1;
				end if;
			end if;
			end;
		end loop;
			return soluce;
	end nbCombi ; 
	
	function Combi(fsol : in text_io.file_type; nbcases : in T_nbcases ; numsol : in positive) return string is
	-- {fsol ouvert, f- = <>}
	-- => {résultat = chaîne représentant la solution numsol lue dans fsol pour une combinaison de nbcases}

    s:string(1..14);
    lg:natural;
    soluce:natural;
	begin
		soluce:=0;

		while not end_of_file(fsol) loop
			get_line(fsol,s,lg);
		
			declare Tligne: string (1..lg);
			begin
			Tligne:=s(1..lg);
			if Tligne'length=6 then
				if nbcases=3 then
					soluce:=soluce+1;
						if soluce=numsol then
							return Tligne;
						end if;
				end if;
			end if;
			if Tligne'length=8 then
				if nbcases=4 then
					soluce:=soluce+1;
						if soluce=numsol then
							return Tligne;
						end if;
				end if;
			end if;
			if Tligne'length=10 then
				if nbcases=5 then
					soluce:=soluce+1;
						if soluce=numsol then
							return Tligne;
						end if;
				end if;
			end if;
			if Tligne'length=12 then
				if nbcases=6 then
					soluce:=soluce+1;
						if soluce=numsol then
							return Tligne;
						end if;
				end if;
			end if;
			if Tligne'length=14 then
				if nbcases=7 then
					soluce:=soluce+1;
						if soluce=numsol then
							return Tligne;
						end if;
				end if;
			end if;
			end;
		end loop;
		return s;
end Combi;


function VerifCont (val,ValAut : string) return boolean is
begin
    if Val="A1" and then ValAut="A2" then
        return true;
    elsif Val="A1" and then  ValAut="B1" then
        return true;
    elsif Val="A1" and then ValAut="B2" then
        return true;

    elsif Val="A2" and then ValAut="A1" then
        return true;
    elsif Val="A2" and then ValAut="A3" then
        return true;
    elsif Val="A2" and then ValAut="B1" then
        return true;
    elsif Val="A2" and then ValAut="B2" then
        return true;
    elsif Val="A2" and then ValAut="B3" then
        return true;

    elsif Val="A3" and then ValAut="A2" then
        return true;
    elsif Val="A3" and then ValAut="A4" then
        return true;
    elsif Val="A3" and then ValAut="B2" then
        return true;
    elsif Val="A3" and then ValAut="B3" then
        return true;
    elsif Val="A3" and then ValAut="B4" then
        return true;

    elsif Val="A4" and then ValAut="A3" then
        return true;
    elsif Val="A4" and then ValAut="B3" then
        return true;
    elsif Val="A4" and then ValAut="B4" then
        return true;

    elsif Val="B1" and then ValAut="A1" then
        return true;
    elsif Val="B1" and then ValAut="A2" then
        return true;
    elsif Val="B1" and then ValAut="B2" then
        return true;
    elsif Val="B1" and then ValAut="C1" then
        return true;
    elsif Val="B1" and then ValAut="C2" then
        return true;

    elsif Val="B2" and then ValAut="A1" then
         return true;
    elsif Val="B2" and then ValAut="A2" then
         return true;
    elsif Val="B2" and then ValAut="A3" then
         return true;
    elsif Val="B2" and then ValAut="B1" then
         return true;
    elsif Val="B2" and then ValAut="B3" then
         return true;
    elsif Val="B2" and then ValAut="C1" then
         return true;
    elsif Val="B2" and then ValAut="C2" then
        return true;
    elsif Val="B2" and then ValAut="C3" then
        return true;

    elsif Val="B3" and then ValAut="A2" then
         return true;
    elsif Val="B3" and then ValAut="A3" then
         return true;
    elsif Val="B3" and then ValAut="A4" then
         return true;
    elsif Val="B3" and then ValAut="B2" then
         return true;      
    elsif Val="B3" and then ValAut="B4" then
         return true;     
    elsif Val="B3" and then ValAut="C2"then
        return true;
    elsif Val="B3" and then ValAut="C3"then
         return true;
    elsif Val="B3" and then ValAut="C4" then
         return true;

    elsif Val="B4" and then ValAut="A3" then
        return true;
    elsif Val="B4" and then ValAut="A4" then
        return true;
    elsif Val="B4" and then ValAut="B3" then
        return true;
    elsif Val="B4" and then ValAut="C3" then
        return true;
    elsif Val="B4" and then ValAut="C4" then
        return true;
        
    elsif Val="C1" and then ValAut="B1" then
        return true;
    elsif Val="C1" and then ValAut="B2" then
        return true;
    elsif Val="C1" and then ValAut="C2" then
        return true;
    elsif Val="C1" and then ValAut="D1" then
        return true;
    elsif Val="C1" and then ValAut="D2" then
        return true;

    elsif Val="C2" and then ValAut="B1" then
        return true;
    elsif Val="C2" and then ValAut="B2" then
        return true;
    elsif Val="C2" and then ValAut="B3" then
        return true;
    elsif Val="C2" and then ValAut="C1" then
        return true;
    elsif Val="C2" and then ValAut="C3" then
        return true;
    elsif Val="C2" and then ValAut="D1" then
        return true;
    elsif Val="C2" and then ValAut="D2" then
        return true;
    elsif Val="C2" and then ValAut="D3" then
        return true;

    elsif Val="C3" and then ValAut="B2" then
        return true;
    elsif Val="C3" and then ValAut="B3" then
        return true;
    elsif Val="C3" and then ValAut="B4" then
        return true;
    elsif Val="C3" and then ValAut="C2" then
        return true;
    elsif Val="C3" and then ValAut="C4" then
        return true;
    elsif Val="C3" and then ValAut="D2" then
        return true;
    elsif Val="C3" and then ValAut="D3" then
        return true;
    elsif Val="C3" and then ValAut="D4" then
        return true;

    elsif Val="C4" and then ValAut="B3" then
        return true;
    elsif Val="C4" and then ValAut="B4" then
        return true;
    elsif Val="C4" and then ValAut="C3" then
        return true;
    elsif Val="C4" and then ValAut="D3" then
        return true;
    elsif Val="C4" and then ValAut="D4" then
        return true;

    elsif Val="D1" and then ValAut="C1" then
        return true;
    elsif Val="D1" and then ValAut="C2" then
        return true;
    elsif Val="D1" and then ValAut="D2" then
        return true;

    elsif Val="D2" and then ValAut="C1" then
        return true;
    elsif Val="D2" and then ValAut="C2" then
        return true;
    elsif Val="D2" and then ValAut="C3" then
        return true;
    elsif Val="D2" and then ValAut="D1" then
        return true;
    elsif Val="D2" and then ValAut="D3" then
        return true;

    elsif Val="D3" and then ValAut="C2" then
        return true;  
    elsif Val="D3" and then ValAut="C3" then
        return true;  
    elsif Val="D3" and then ValAut="C4" then
        return true;  
    elsif Val="D3" and then ValAut="D2" then
        return true;  
    elsif Val="D3" and then ValAut="D4" then
        return true;  

    elsif Val="D4" and then ValAut="C3" then
        return true;
    elsif Val="D4" and then ValAut="C4" then
        return true;
    elsif Val="D4" and then ValAut="D3" then
        return true;
    else 
        return false;
    end if;
end VerifCont;





function est_contigue (sol : string) return boolean is
    v,vsol:TV_Gaudi(1..sol'length/2);
    p,l,m:integer;
begin
    m:=1;
        for i in v'range loop
            v(i).nom:=sol(m..m+1);
            m:=m+2;
        end loop;
        vsol(1).nom:=v(1).nom;
            p:=1;
    for j in 1..sol'length/2 loop
        for k in 1..sol'length/2 loop
            if verifCont(vsol(p).nom,v(k).nom) then
                l:=1;
                while l<=vsol'length and then v(k).nom/=vsol(l).nom loop
                    l:=l+1;
                end loop;
                    if l>vsol'length then
                    vsol(p+1).nom:=v(k).nom;
                    p:=p+1;
                end if;
            end if;
        end loop;
    end loop;
    TriVectGaudi(v);
    TriVectGaudi(vsol);
    return v=vsol;
end est_contigue;



----------------------------------Graph--------------------------------------

----------------------------------Graph--------------------------------------
	
end p_vue_graph;
