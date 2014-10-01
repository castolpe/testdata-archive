clear
version 13

/* START pweight */

use dist/ap.dta, clear
bysort ap01: gen sex = _N
gen sexequal = _N/2
gen weight1 = sexequal/sex
label variable weight1 "pweight 2001"
keep PERSNR weight1
saveold H:/clone/testdata-archive/dist/v1/pweight.dta, replace

/* END pweight */
