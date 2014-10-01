clear
version 13

/* START hweight */
use dist/ah.dta, clear
merge 1:1 AHHNR using dist/ahgen.dta, nogenerate
gen hdist = .
replace hdist = 3 if ah12 == 1
replace hdist = 3 if ah12 == 2
replace hdist = 3 if ah12 == 3
replace hdist = 1 if ah12 == 4
replace hdist = 1 if ah12 == 5
replace hdist = 1 if ah12 == 6
replace hdist = . if ah12 == .
bysort ah12: gen hnumber = _N
gen hweight1 = hdist/hnumber
label variable hweight1 "hweight 2001"
keep AHHNR hweight1
sort AHHNR
gen HHNR = _n
saveold ../testdata-archive/dist/v1/hweight.dta, replace
/* END hweight */
