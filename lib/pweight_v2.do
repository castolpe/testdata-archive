clear
version 13

/* START pweight */

use dist/ap.dta, clear
bysort ap01: gen sex = _N
gen sexequal = _N/2
gen weight1 = sexequal/sex
label variable weight1 "pweight 2001"
keep PERSNR weight1
saveold temp/weight1.dta, replace

use dist/bp.dta, clear
bysort bp01: gen sex = _N
gen sexequal = _N/2
gen weight2 = sexequal/sex
label variable weight2 "pweight 2002"
keep PERSNR weight2
saveold temp/weight2.dta, replace

use temp/weight1.dta, clear
merge m:m PERSNR using temp/weight2.dta, nogenerate
saveold ../testdata-archive/dist/v2/pweight.dta, replace

/* END pweight */
