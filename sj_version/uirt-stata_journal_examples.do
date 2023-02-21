****************************************************************************************************
****************************************************************************************************
****************************************************************************************************
* This DO-file runs all the examples from "UIRT: A command for unidimensional IRT modelling".
* It also produces LaTeX log file using the sjlog command, and saves the EPS graphs for LaTeX.
* Note that three external packages are being installed at the beginning: sjlatex, uirt and pv. 
* To run this Do-file, put it in the working directory, and type in Stata:
*		do uirt_article_examples.do
****************************************************************************************************
****************************************************************************************************
****************************************************************************************************

* installing the packages that are used in this DO-file
net describe sjlatex, from(http://www.stata-journal.com/production)
net install sjlatex
ssc describe uirt
ssc install uirt
ssc describe pv
ssc install pv

*creating directories to gather files produced by this DO-file
m: st_local("mydir",pwd())
cap mkdir PNG
cap mkdir LaTeX


*sj logfile
qui cd "`mydir'/LaTeX"
sjlog using sjlog_all_uirt_article_examples,replace



****************************************************************************************************
*                                         sec3_item_fit_analysis                                   *
****************************************************************************************************

*setting up a dir for the 1PL graphs
qui cd "`mydir'/PNG"
cap mkdir one_plm_1gr
qui cd one_plm_1gr


********log_sec3_1 START
webuse masc2, clear
uirt q*, pcm(*)
********log_sec3_1 STOP


********log_sec3_2 START
uirt_chi2w *
********log_sec3_2 STOP


********log_sec3_3 START
uirt_sx2 *
********log_sec3_3 STOP


********log_sec3_4 START
uirt_icc *, tw(xtitle({&theta}) scheme(sj) title(masc2.dta: single group 1PL model)) c(gs2 gs6)
********log_sec3_4 STOP


*exporting selected graph to LaTeX
qui cd "`mydir'/LaTeX"
gr display ICC_q1
qui gr export ICC_q1_1PLM.eps,  mag(200)  replace
gr display ICC_q7
qui gr export ICC_q7_1PLM.eps,  mag(200)  replace


********log_sec3_5 START
estimates store one_plm_1gr
********log_sec3_5 STOP


*setting up a dir for the 2PL graphs
qui cd "`mydir'/PNG"
cap mkdir two_plm_1gr
cd two_plm_1gr


********log_sec3_6 START
uirt q*
********log_sec3_6 STOP


********log_sec3_7 START
mat l e(item_par)
********log_sec3_7 STOP


********log_sec3_8 START
estimates store two_plm_1gr
lrtest one_plm_1gr two_plm_1gr
********log_sec3_8 STOP


********log_sec3_9 START
uirt_chi2w q1 q5-q9
********log_sec3_9 STOP


********log_sec3_10 START
uirt_icc q6 q1 q7, tw(xtitle({&theta}) scheme(sj) title(masc2.dta: single-group 2PL model)) c(gs2 gs6)
********log_sec3_10 STOP



*exporting selected graph to LaTeX
qui cd "`mydir'/LaTeX"
gr display ICC_q1
qui gr export ICC_q1_2PLM.eps,  mag(200)  replace
gr display ICC_q7
qui gr export ICC_q7_2PLM.eps,  mag(200)  replace
gr display ICC_q6
qui gr export ICC_q6_2PLM.eps,  mag(200)  replace



*setting up a dir for the hybrid model graphs
qui cd "`mydir'/PNG"
cap mkdir hybrid_model_1gr
cd hybrid_model_1gr



********log_sec3_11 START
uirt q*, guess(q*, lr(0.1))
********log_sec3_11 STOP



********log_sec3_12 START
mat l e(item_par)
********log_sec3_12 STOP



********log_sec3_13 START
uirt_chi2w q6
uirt_sx2 q6
********log_sec3_13 STOP



********log_sec3_14 START
estimates store hybrid_model_1gr
lrtest hybrid_model_1gr two_plm_1gr
********log_sec3_14 STOP



*plotting the ICC graph for selected item and exporting eps to LaTeX
uirt_icc q6, tw(xtitle({&theta}) scheme(sj) title(masc2.dta: single-group hybrid model)) c(gs2 gs6)
qui cd "`mydir'/LaTeX"
gr display ICC_q6
qui gr export ICC_q6_3PLM.eps,  mag(200)  replace




****************************************************************************************************
*                                         sec4_DIF                                   *
****************************************************************************************************

*setting up a dir for the hybrid two-group model graphs
qui cd "`mydir'/PNG"
cap mkdir hybrid_model_2gr
cd hybrid_model_2gr



********log_sec4_1 START
uirt q*, init(from(hybrid_model_1gr)) gr(female)
********log_sec4_1 STOP



********log_sec4_2 START
estimates store hybrid_model_2gr
lrtest hybrid_model_1gr hybrid_model_2gr
********log_sec4_2 STOP



********log_sec4_3 START
uirt_dif *,tw( xtitle({&theta}) scheme(sj) title(masc2.dta: two-group hybrid model) ) c(gs2 gs6)
********log_sec4_3 STOP



*exporting selected graph to LaTeX
qui cd "`mydir'/LaTeX"
gr display DIF_q1
qui gr export DIF_q1.eps,  mag(200)  replace




****************************************************************************************************
*                                         sec5_PV                                   *
****************************************************************************************************

********log_sec5_1 START
set seed 314
estimates restore hybrid_model_1gr
uirt_theta , eap pv(10) pvreg(i.female)
********log_sec5_1 STOP



********log_sec5_2 START
sum pv* theta,sep(10)
********log_sec5_2 STOP



********log_sec5_3 START
local m_male=0
local sd_male=0
foreach pv of varlist pv*{
	qui sum `pv' if female==0
	local m_male=`m_male'+r(mean) 
	local sd_male=`sd_male'+r(sd)
}
local m_male=`m_male'/10
local sd_male=`sd_male'/10
foreach pv of varlist pv*{
	qui replace `pv'=(`pv'-`m_male')/`sd_male'
}
********log_sec5_3 STOP



********log_sec5_4 START
pv, pv(pv*): regress @pv female
********log_sec5_4 STOP



********log_sec5_5 START
qui sum theta if female==0
qui replace theta=(theta-r(mean))/r(sd)
regress theta female
********log_sec5_5 STOP


sjlog close,replace

qui cd "`mydir'"
