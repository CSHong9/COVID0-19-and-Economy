scatter percentageofunemployment service || lfit percentageofunemployment service, /// 
	    ytitle("Percentage of unemployment claims") ///
		xtitle("Percentage of service workers") ///
		legend(off) ///
		name(G1, replace)	

scatter percentageofunemployment proportionunder15 || lfit percentageofunemployment proportionunder15, /// 
	    ytitle("Percentage of unemployment claims") ///
		xtitle("Percentage of low-wage workers") ///
		legend(off) ///
		name(G2, replace)	
		
scatter percentageofunemployment service_low || lfit percentageofunemployment service_low, /// 
	    ytitle("Percentage of unemployment claims") ///
		xtitle("Percentage of low-wage service workers") ///
		legend(off) ///
		name(G3, replace)	
		
graph combine G1 G2 G3

reg percentageofunemployment service, vce(robust)
estimates store m1, title(Model 1)
reg percentageofunemployment proportionunder15, vce(robust)
estimates store m2, title(Model 2)
reg percentageofunemployment service proportionunder15, vce(robust)
estimates store m3, title(Model 3)
reg percentageofunemployment service proportionunder15 service_low, vce(robust)
estimates store m4, title(Model 4)

estout m1 m2 m3 m4, cells(b(star fmt(3)) se(par fmt(2)))   ///
   legend label varlabels(_cons constant)               ///
   stats(r2 df_r bic, fmt(3 0 1) label(R-sqr dfres BIC))