clear
version 13 

*** create h-long-data

use dist\ah.dta

gen wave = 2001
lab var wave "Welle"

rename ah01 hkind
rename ah02 hkind_dummy
rename ah03 hgeb_a
rename ah04 hgeb_b
rename ah05 hgeb_c
rename ah06 hgeb_d
rename ah07 hwwechsel
rename ah08 hwgegend
rename ah09 hmiete
rename ah10 hnetto
rename AHHNR HHNR

saveold temp\ah.dta, replace

clear
use dist\bh.dta

gen wave = 2002
lab var wave "Welle"

rename bh01 hkind
rename bh02 hkind_dummy
rename bh03 hgeb_a
rename bh04 hgeb_b
rename bh05 hgeb_c
rename bh06 hgeb_d
rename bh07 hwwechsel
rename bh08 hwgegend
rename bh09 hmiete
rename bh10 hnetto
rename BHHNR HHNR

saveold temp\bh.dta, replace


append using temp\ah.dta

sort HHNR wave

saveold ..\testdata-archive\dist\v2\hl.dta, replace


