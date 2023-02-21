{smcl}
{* *! version 2.2 2022.02.22}{...}
{viewerjumpto "Title" "uirt##title"}{...}
{viewerjumpto "Syntax" "uirt##syntax"}{...}
{viewerjumpto "Postestimation commands" "uirt##postestimation"}{...}
{viewerjumpto "Description" "uirt##description"}{...}
{viewerjumpto "Options" "uirt##options"}{...}
{viewerjumpto "Examples" "uirt##examples"}{...}
{viewerjumpto "Stored results" "uirt##results"}{...}
{viewerjumpto "Acknowledgments" "uirt##acknowledgments"}{...}
{viewerjumpto "Funding" "uirt##funding"}{...}
{viewerjumpto "References" "uirt##references"}{...}
{viewerjumpto "Author" "uirt##author"}{...}
{viewerjumpto "Also see" "uirt##alsosee"}{...}
{cmd:help uirt}{right: ({browse "https://doi.org/10.1177/1536867X221106368":SJ22-2: st0670})}
{hline}

{marker title}{...}
{title:Title}

{p2colset 5 13 15 2}{...}
{p2col :{cmd:uirt} {hline 2}}Fit unidimensional item response theory
models{p_end}


{marker syntax}{...}
{title:Syntax}

{p 8 12 2}
{cmd:uirt} [{varlist}] {ifin} [{cmd:,} {it:{help uirt##options:options}}]

{synoptset 26 tabbed}{...}
{marker options}{...}
{synopthdr}
{synoptline}
{syntab:Models}
{synopt:{opt pcm(varlist)}}items to fit with the partial credit model (PCM){p_end}
{synopt:{opt gpcm(varlist)}}items to fit with the generalized partial credit
model (GPCM){p_end}
{synopt:{opt gue:ssing(varlist[, opts])}}items to attempt fitting with the
three-parameter logistic model (3PLM){p_end}
{synopt:{space 3}{it:opts}:}{p_end}
{synopt:{space 3}{opt att:empts(#)}}maximum number of attempts to fit a 3PLM;
default is {cmd:attempts(5)}{p_end}
{synopt:{space 3}{opt lr:crit(#)}}significance level for likelihood-ratio (LR) test comparing
two-parameter logistic model (2PLM) against 3PLM; default is {cmd:lrcrit(0.05)}{p_end}

{syntab:Multigroup}
{synopt:{opt gr:oup(varname[, opts])}}set group membership variable{p_end}
{synopt:{space 3}{it:opts}:}{p_end}
{synopt:{space 3}{opt ref:erence(#)}}set the value of reference group{p_end}
{synopt:{space 3}{opt dif(varlist)}}items to test for differential item functioning (DIF){p_end}
{synopt:{space 3}{opt free}}free the estimation of parameters of reference group{p_end}
{synopt:{space 3}{opt slow}}suppress a speedup of expectation maximization
(EM) for the multigroup estimation{p_end}

{syntab:ICC}
{synopt:{opt icc(varlist[, opts])}}items to create intraclass correlation
coefficient (ICC) graphs{p_end}
{synopt:{space 3}{it:opts}:}{p_end}
{synopt:{space 3}{opt bins(#)}}number of ability intervals for observed proportions;
default is {cmd:bins(100)}{p_end}
{synopt:{space 3}{opt noo:bs}}suppress plotting observed proportions{p_end}
{synopt:{space 3}{opt pv}}use plausible values (PVs) to compute observed proportions; default is to use numerical integration{p_end}
{synopt:{space 3}{opt pvbin(#)}}number of PVs in each bin; default is
{cmd:pvbin(10000)}{p_end}
{synopt:{space 3}{opt c:olors(str)}}list of colors to override default colors of ICC lines{p_end}
{synopt:{space 3}{opth tw(twoway_options)}}{cmd:graph twoway} options to override default graph layout{p_end}
{synopt:{space 3}{opt f:ormat(str)}}file format for ICC graphs ({cmd:png}, {cmd:gph},
or {cmd:eps}); default
is {cmd:format(png)}{p_end}
{synopt:{space 3}{opt pref:ix(str)}}set the prefix of filenames{p_end}
{synopt:{space 3}{opt suf:fix(str)}}set the suffix of filenames{p_end}
{synopt:{space 3}{opt cl:eargraphs}}suppress storing of graphs in Stata memory{p_end}

{syntab:Item fit}
{synopt:{opt chi2w(varlist[, opts])}}items to compute chi2W item-fit statistic{p_end}
{synopt:{space 3}{it:opts}:}{p_end}
{synopt:{space 3}{opt bins(#)}}number of ability intervals for computation of chi2W{p_end}
{synopt:{space 3}{opt npq:min(#)}}minimum expected number of observations in
ability intervals (NPQ); default is {cmd:npqmin(20)}{p_end}
{synopt:{space 3}{opt npqr:eport}}report information about minimum NPQ in ability intervals{p_end}
{synopt:{opt sx2(varlist[, opts])}}dichotomous items to compute S-X2 item-fit statistic{p_end}
{synopt:{space 3}{it:opts}:}{p_end}
{synopt:{space 3}{opt minf:req(#)}}minimum expected number of observations in
ability intervals (NP and NQ); default is {cmd:minfreq(1)}{p_end}

{syntab:Theta and PVs}
{synopt:{opt th:eta([nv1 nv2][, opts])}}declare variables to be added to the dataset{p_end}
{synopt:{space 3}{it:opts}:}{p_end}
{synopt:{space 3}{opt eap}}create expected a posteriori (EAP) estimator of theta and its standard error{p_end}
{synopt:{space 3}{opt nip(#)}}number of Gauss-Hermite (GH) quadrature points
used when calculating EAP and its standard error; default is {cmd:nip(195)}{p_end}
{synopt:{space 3}{opt pv(#)}}number of PVs added to the dataset;
default is {cmd:pv(0)} (no PVs added){p_end}
{synopt:{space 3}{opt pvreg(str)}}define regression for conditioning PVs{p_end}
{synopt:{space 3}{opt suf:fix(name)}}specify a suffix used in naming of EAP,
PVs, and ICC graphs{p_end}
{synopt:{space 3}{opt sc:ale(#,#)}}scale parameters (m,sd) of theta in reference group{p_end}
{synopt:{space 3}{opt skipn:ote}}suppress adding notes to newly created variables{p_end}

{syntab:Fixing and initiating}
{synopt:{opt fix([opts])}}declare parameters to fix{p_end}
{synopt:{space 3}{it:opts}:}{p_end}
{synopt:{space 3}{opt prev}}fix item parameters on estimates from previous {cmd:uirt} run (active estimation results){p_end}
{synopt:{space 3}{opt from(name)}}fix item parameters on estimates from {cmd:uirt} run that is stored in memory{p_end}
{synopt:{space 3}{opt used:ist}}fix group parameters on estimates from
previous {cmd:uirt} run; used with {cmd:prev} or {cmd:from()}{p_end}
{synopt:{space 3}{opt i:matrix(name)}}matrix with item parameters to be fixed{p_end}
{synopt:{space 3}{opt d:matrix(name)}}matrix with group parameters to be fixed{p_end}
{synopt:{space 3}{opt c:matrix(name)}}matrix with item category values{p_end}
{synopt:{space 3}{opt miss}}allow {cmd:imatrix()} to have missing entries{p_end}
{synopt:{opt init([opts])}}declare starting values{p_end}
{synopt:{space 3}{it:opts}:}{p_end}
{synopt:{space 3}{opt prev}}initiate item parameters on estimates from previous {cmd:uirt} run (active estimation results){p_end}
{synopt:{space 3}{opt from(name)}}initiate item parameters on estimates from {cmd:uirt} run that is stored in memory{p_end}
{synopt:{space 3}{opt used:ist}}initiate group parameters on estimates from
previous {cmd:uirt} run; used with {cmd:prev} or {cmd:from()}{p_end}
{synopt:{space 3}{opt i:matrix(name)}}matrix with starting values of item parameters{p_end}
{synopt:{space 3}{opt d:matrix(name)}}matrix with starting values of group parameters{p_end}
{synopt:{space 3}{opt miss}}allow {cmd:imatrix()} to have missing entries{p_end}

{syntab:EM control}
{synopt:{opt nip(#)}}number of GH quadrature points used in EM algorithm;
default is {cmd:nip(51)}{p_end}
{synopt:{opt nit(#)}}maximum number of iterations of EM algorithm; default is
{cmd:nit(100)}{p_end}
{synopt:{opt nin:rf(#)}}set the maximum number of iterations of Newton-Raphson-Fisher
algorithm within M-step{p_end}
{synopt:{opt crit_ll(#)}}stopping rule -- relative change in logL between EM
iterations; default is {cmd:crit_ll(1e-9)}{p_end}
{synopt:{opt crit_par(#)}}stopping rule -- maximum absolute change in parameter
values between EM iterations; default is {cmd:crit_par(1e-4)}{p_end}
{synopt:{opt err:ors(string)}}method for computation of standard errors
({cmd:cdm}, {cmd:rem}, {cmd:sem}, {cmd:cp}); default is {cmd:err(cdm)}{p_end}
{synopt:{opt pr:iors(varlist[, opts])}}declare dichotomous items to estimate with priors{p_end}
{synopt:{space 3}{it:opts}:}{p_end}
{synopt:{space 3}{opt a:normal(#,#)}}parameters of normal prior for discrimination parameter{p_end}
{synopt:{space 3}{opt b:normal(#,#)}}parameters of normal prior for difficulty parameter{p_end}
{synopt:{space 3}{opt c:beta(#,#)}}parameters of beta prior for pseudoguessing parameter{p_end}

{syntab:Reporting}
{synopt:{opt not:able}}suppress coefficient table{p_end}
{synopt:{opt noh:eader}}suppress model summary{p_end}
{synopt:{opt tr:ace(#)}}control log display after each iteration; {cmd:0} --
suppress; {cmd:1} -- normal (default); {cmd:2} -- detailed{p_end}
{synoptline}


{marker postestimation}{...}
{title:Postestimation commands}

{pstd}
Several {cmd:uirt} options are also available as separate postestimation
commands, so it is possible to use them after {cmd:uirt} model parameters are
estimated.  Running these postestimation commands only once after {cmd:uirt}
may take more time to execute than invoking them as {cmd:uirt} options.  But
time is surely saved if you anticipate repeating these postestimation commands
multiple times after a given {cmd:uirt} run.

{synoptset 15}{...}
{p2coldent :Command}Description{p_end}
{synoptline}
{synopt :{helpb uirt_theta}}add EAP estimate of theta or draw PVs{p_end}
{synopt :{helpb uirt_icc}}create ICC plots and perform graphical item-fit analysis{p_end}
{synopt :{helpb uirt_dif}}perform DIF analysis (two-group models){p_end}
{synopt :{helpb uirt_chi2w}}compute chi2W item-fit statistic{p_end}
{synopt :{helpb uirt_sx2}}compute S-X2 item-fit statistic (dichotomous items){p_end}
{synopt :{helpb uirt_esf}}create expected score function plots{p_end}
{synopt :{helpb uirt_inf}}create information function plots{p_end}
{synoptline}


{marker description}{...}
{title:Description}

{pstd}
{cmd:uirt} is a command for estimating a variety of unidimensional item
response theory (IRT) models (2PLM, 3PLM, general regression model, PCM, and
GPCM).  It features multigroup modeling, DIF analysis, and item-fit analysis
and generating PVs conditioned via latent regression.  {cmd:uirt} implements
the EM algorithm (Dempster, Laird, and Rubin 1977) in the form of marginal
maximum-likelihood estimation proposed by Bock and Aitkin (1981) with normal
GH quadrature.  The LR test is used for DIF testing, and model-based P-DIF
effect-size measures are provided (Wainer 1993).  Generating PVs is performed
by adapting a Markov chain Monte Carlo (MCMC) method developed for IRT models
by Patz and Junker (1999).  Observed response proportions are plotted against
the item characteristic curves to allow for detailed graphical item-fit
analysis.  Two item-fit statistics are available: S-X2 by Orlando and Thissen
(2000) and chi2W by Kondratek (2022).


{marker options}{...}
{title:Options}

{dlgtab:Models}

{pstd}
By default, {cmd:uirt} will fit the 2PLM to all items that are detected to be
dichotomous and Samejima's graded response model to all items that are
detected to have more than two responses.  Options {cmd:pcm()}, {opt gpcm()},
and {opt guessing()} are used if one wishes to use other models.  Hybrid
models are allowed.

{phang}
{opt pcm(varlist)} is used to provide a list of items to fit with the PCM.  If
PCM is used, a common discrimination parameter is estimated for all PCM items.
When {cmd:pcm(*)} is typed, all items declared in the main list of items are
fit with PCM.

{phang}
{opt gpcm(varlist)} is used to provide a list of items to fit with the GPCM.
If the item is dichotomous, it will be reported as 2PLM in the output (2PLM
and GPCM are the same for dichotomous items).  When {cmd:gpcm(*)} is typed,
all items declared in the main list of items are fit with GPCM.

{phang}
{opt guessing(varlist[, opts])} is used to provide a list of items to attempt
fitting a 3PLM.  Items that are detected to have more than two response
categories are automatically excluded from the list.  The pseudoguessing
parameter of the 3PLM is hard to estimate (especially for easy items or small
sample sizes) and often leads to convergence problems.  To circumvent this,
for each 3PLM-candidate item, {cmd:uirt} starts with a 2PLM and performs
multiple attempts of fitting the 3PLM instead of 2PLM.  The 3PLM attempts are
followed by checks on parameter behavior with two criteria for deciding
whether to keep the item 2PLM or to go with 3PLM.  The first criterion is
convergence -- an item stays 2PLM if the parameter estimates change too
rapidly, the pseudoguessing goes negative, the discrimination parameter goes
to 0 or negative, etc.  The second criterion is a result of an "LR test" after
single EM iteration -- if the model likelihood does not improve significantly
the item stays 2PLM.  During each attempt, {cmd:uirt} will print a note if
either the LR or convergence criterion resulted in an item staying 2PLM.  The
number of attempts of fitting a 3PLM is controlled by {opt attempts()}, and
the LR sensitivity is controlled by {opt lrcrit()}.  Note that this is an
exploratory procedure.  Also note that {cmd:uirt} allows the user to declare
priors for the pseudoguessing parameters within the {opt priors()} option.

{phang2}
{opt attempts(#)} is a suboption of {opt guessing()} and specifies the maximum
number of attempts to fit a 3PLM model to items specified in
{opt guessing(varlist)}.  The default is {cmd:attempts(5)}.

{phang2}
{opt lrcrit(#)} is a suboption of {cmd:guessing()} and specifies the
significance level criterion for an "LR test", verifying whether 3PLM fits
better than 2PLM on the item level.  If the test is negative, the item stays
2PLM and a note is printed.  The default is {cmd:lrcrit(0.05)}.  Specifying a
value of 1 will suppress LR testing, and rejection of 3PLM on the basis of
such a procedure will not be performed.  Note that an "LR test" is performed
after only one EM cycle; hence, it is not a "proper" LR test.  This procedure
is more conservative than the actual LR test (performed after complete
convergence of the EM algorithm) would be.

{dlgtab:Multigroup}

{phang}
{opt group(varname[, opts])} sets the variable defining group membership for
multigroup IRT models.  The grouping variable must be numeric.  There are
multiple suboptions of {opt group()}.

{phang2}
{opt reference(#)} is a suboption of {opt group()} and sets the reference
group value.  By default, the reference group is set on the lowest value of
the grouping variable.

{phang2}
{opt dif(varlist)} is a suboption of {opt group()}; it is used to provide the
list of items to test for DIF.  For each of the items specified in
{cmd:dif()}, a two-group model with common item parameters in both groups is
compared against a model with group-specific parameters for the item under
scrutiny.  Statistical significance of DIF is verified by an LR test.  Effect
measures are computed on the observed score metric (P-DIF) by subtracting
expected mean scores of an item under each of the group-specific item
parameter estimates (Wainer 1993).  Namely, P-DIF|GR=E(parR,GR)-E(parF,GR),
where GR indicates that the reference group distribution was used for
integration and parR and parF stand for item parameters estimated in GR and
GF, respectively.  An analogous P-DIF|GF measure is also computed.  DIF
significance and effect-size information is stored in {cmd:e(dif_results)}.
Group-specific item parameter estimates are stored in {cmd:e(dif_item_par_GR)}
and {cmd:e(dif_item_par_GF)}.  Calling {cmd:dif()} will also result in
plotting graphs with group-specific ICCs and P-DIFs, which are saved in the
working directory.  When {cmd:dif(*)} is typed, DIF analysis is performed on
all items declared in the main list of items.

{phang2}
{opt free} is a suboption of {opt group()}; it frees the estimation of
parameters of the reference group.  Using this option requires fixing
parameters of at least one item to identify the model.

{phang2}
{opt slow} is a suboption of {opt group()}; it suppresses a speedup of EM for
the multigroup estimation.  By default, the GH quadrature in {cmd:uirt} is
updated within the EM cycle, just after the iteration of group parameters is
done.  This speedsup the convergence of the algorithm but, in some cases, may
lead to a log likelihood increase.  Try using this option if you encounter
such a problem in a multigroup model.

{dlgtab:ICC}

{phang}
{opt icc(varlist[, opts])} is used to provide a list of items for which ICC
graphs are plotted.  When {cmd:icc(*)} is typed, ICC graphs are plotted for
all items declared in the main list of items.  Note that if ICC graphs for
such items are already saved in the working directory under default names,
they will be overwritten.  If you do not want to overwrite previous ICCs,
change the working directory or rename the existing files.

{pmore}
If {cmd:uirt} is asked to plot ICCs, it will, by default, superimpose observed
proportions against the ICC curves to enable a graphical item-fit assessment.
The observed proportions are computed after quantile-based division of the
distribution of a latent variable.  Item response of a single person is
included simultaneously into many intervals (bins) of theta with probability
proportional to the density of an a posteriori latent trait distribution of
that person in each bin.  The default method uses definite numerical
integration, but after you add a suboption {opt pv}, PVs will be used to
achieve this task.  Plotting observed proportions is controlled by
{cmd:bins()} and {cmd:pvbin()}; it can also be turned off by {opt noobs}.  The
default look of graphs can be overridden by suboptions {opt colors()} and
{cmd:tw()}.

{phang2}
{opt bins(#)} is a suboption of {opt icc()}; it sets the number of intervals
into which the distribution of ability is split when calculating observed
proportions of responses.  The default is {cmd:bins(100)}.

{phang2}
{opt noobs} is a suboption of {opt icc()}; it suppresses plotting observed
proportions.

{phang2}
{opt pv} is a suboption of {opt icc()}; it changes the default method of
computing observed proportions from definite numerical integration to Monte
Carlo integration with unconditioned PVs.  It involves more CPU time,
introduces variance due to sampling of PVs, but accounts for the uncertainty
in the estimation of IRT model parameters.

{phang2}
{opt pvbin(#)} is a suboption of {opt icc()}; it sets the number of PVs used
for computing observed proportions of responses within each interval of theta.
The default is {cmd:pvbin(10000)}.

{phang2}
{opt colors(str)} is a suboption of {opt icc()}; it can be used to override
the default Munsell color system used for ICC lines.  It requires a list of
color names separated by spaces.  The first color in the list applies to the
pseudoguessing parameter of 3PLM -- it must be declared even if there are no
3PLM items in the model.

{phang2}
{opth tw(twoway_options)} is a suboption of {opt icc()}; it is used to add
user-defined {cmd:graph twoway} options to override the default graph layout,
like {opt xtitle()} or {opt scheme()}, etc.

{phang2}
{opt format(str)} is a suboption of {opt icc()}; it specifies the file format
in which the ICC graphs are saved ({cmd:png}, {cmd:gph}, or {cmd:eps}).  The
default is {cmd:format(png)}.  This option influences also the graphs created
after asking for DIF analysis.

{phang2}
{opt prefix(str)} is a suboption of {opt icc()}; it is used to define a string
that is added at the beginning of the names of saved files.  The default is
{cmd:prefix(ICC)}.

{phang2}
{opt suffix(str)} is a suboption of {opt icc()}; it adds a user-defined string
at the end of the names of saved files.  The default behavior is not to add
any suffix.

{phang2}
{opt cleargraphs} is a suboption of {opt icc()}; it is used to suppress the
default behavior of storing all ICC graphs in Stata memory.  After you specify
this, all graphs are still saved in the current working directory, but only
the last graph is active in Stata.

{dlgtab:Item fit}

{pstd}
{cmd:uirt} allows computing two types of item-fit statistics.  In a single
group setting, when there is enough dichotomously scored items with no missing
responses, item fit can be assessed with the classical S-X2 statistic proposed
by Orlando and Thissen (2000).  The second available item-fit statistic,
chi2W, is more general and can be applied to incomplete data and all IRT
models handled by {cmd:uirt}.

{phang}
{opt chi2w(varlist[, opts])} is used to provide a list of items to compute the
chi2W item-fit statistic.  When {cmd:chi2w(*)} is typed, the chi2W item-fit
statistic is computed for all items declared in the main list of items.  chi2W
is a Wald-type test statistic that compares the observed and expected item
mean scores over a set of ability bins.  The observed and expected scores are
weighted means with weights being an a posteriori density of a person's
ability within the bin -- as in the approach used to compute observed
proportions in ICC plots.  Properties of chi2W have been examined for
dichotomous items; the type I error rate was close to nominal, and it exceeded
S-X2 in statistical power (Kondratek 2020).  The behavior of chi2W for
polytomous items, at the time of this {cmd:uirt} release, has not been
researched.  The results are stored in {cmd:e(item_fit_chi2W)}.  {opt chi2w()}
comes with several suboptions:

{phang2}
{opt bins(#)} is a suboption of {opt chi2w()}; it is used to set the number of
ability intervals for computation of chi2W.  The default settings depend on
the item model and number of freely estimated parameters for the item being
tested.  In general, the default is either {cmd:bins(3)} or a minimal number
of intervals allowing for one degree of freedom after accounting for the
number of estimated item parameters.

{phang2}
{opt npqmin(#)} is a suboption of {opt chi2w()}; it sets a minimum for NPQ
integrated over any ability interval, where N is the number of observations, P
is the expected item mean, and Q=(max_item_score-P).  Larger NPQ values are
associated with better asymptotics of chi2W.  If NPQ for a given ability bin
is smaller than the value declared in {opt npqmin(#)}, {cmd:uirt} will
decrease the number of bins for that item.  The default is {cmd:npqmin(20)}.

{phang2}
{opt npqreport} is a suboption of {opt chi2w()}; it will add a column to
{cmd:e(item_fit_chi2W)} with information about minimum NPQ in ability
intervals.

{phang}
{opt sx2(varlist[, opts])} is used to provide a list of dichotomous items to
compute S-X2 item-fit statistic, as described in Orlando and Thissen (2000).
When {cmd:sx2(*)} is typed, the S-X2 item-fit statistic is computed for all
items declared in the main list of items.  S-X2 cannot be used in a multigroup
setting.  The number-correct score used for grouping is obtained from
dichotomous items -- if polytomous items are present, they are ignored in the
computation of S-X2.  If a dichotomous item has missing responses, it is also
ignored in the computation of S-X2.  The results are stored in
{cmd:e(item_fit_SX2)}.

{phang2}
{opt minfreq(#)} is a suboption of {opt sx2()}; it sets a minimum for both NP
and NQ integrated over any ability interval, where N is the number of
observations, P is the expected item mean, and Q=(1-P).  The default is
{cmd:minfreq(1)}.

{dlgtab:Theta and PVs}

{phang}
{opt theta([nv1 nv2][, opts])} is used to provide specification on ability
variables that are added to the dataset.  {it:nv1} and {it:nv2} are optional.
If specified, the EAP estimator of theta and its standard error will be added
at the end of the dataset using {it:nv1} and {it:nv2} to name these new
variables.  The following suboptions are available for {opt theta()}:

{phang2}
{opt eap} is a suboption of {cmd:theta()}; it will add the EAP estimator of
theta and its standard error at the end of the dataset.  These will be named
{cmd:theta} and {cmd:se_theta} unless {opt suffix()} is specified.  Using
{cmd:eap} is redundant if {it:nv1} and {it:nv2} are provided.

{phang2}
{opt nip(#)} is a suboption of {cmd:theta()}; it sets the number of GH
quadrature points used when calculating the EAP estimator of theta and its
standard error.  The default is {cmd:nip(195)}, which is an obvious overkill,
but it does not consume many resources, while too-low {opt nip()} values may
lead to an inadequate estimate of the standard errors of EAP.

{phang2}
{opt pv(#)} is a suboption of {opt theta()}; it is used to declare the number
of PVs that are added to the dataset.  The default is {cmd:pv(0)} (no PVs
added).  The PVs will be named {cmd:pv_1}, ..., {cmd:pv_}{it:#} unless
{cmd:suffix()} is specified.  The PVs are generated after the estimation is
completed.  The general procedure involves two steps.  In the first step,
{it:#} random draws, b*, of model parameters are taken from a multivariate
normal distribution with means vector {cmd:e(b)} and covariance matrix
{cmd:e(V)}.  In the second step, for each person, {it:#} independent MCMC
chains are run according to the procedure described by Patz and Junker (1999),
with b* parameter draws treated as fixed.  Finally, after a burn-in period,
each of the PVs is drawn from a different MCMC chain.  Such a procedure allows
incorporating IRT model uncertainty in PV generation without the need of
multilevel-structured MCMC, thus reducing the computational expense and
avoiding the use of Bayesian priors for item parameters.  Note that if some of
the item parameters are fixed with the {cmd:fix()} option, the PVs will not
account for the uncertainty of estimation of these fixed parameters.
Additionally, the {opt pvreg()} suboption allows you to modify the procedure
so that it includes conditioning by latent regression.

{phang2}
{opt pvreg(str)} is a suboption of {cmd:theta()}; it is used to perform
conditioning of PVs on ancillary variables.  If variables other than the ones
used in defining the IRT model are used in the analyses performed with PVs,
these variables need to be included in the {opt pvreg()} suboption.
Otherwise, the analyses will produce effects that are biased toward 0.  The
syntax for {opt pvreg()} is the same as that in defining the regression term
in {helpb xtmixed}, for example, {cmd:pvreg(ses ||school:)}.  Note that
multilevel modeling is allowed here.  If {opt pv()} is called without
{cmd:pvreg()}, the PVs for all observations within a group are generated with
the same normal prior distribution of ability with parameters taken from
{cmd:e(group_par)}.  By including the {opt pvreg()} suboption, you modify the
procedure of generating PVs in such a way that after each MCMC step, a
regression of the ability on the variables provided by the user is performed
by {cmd:xtmixed}.  The {cmd:xtmixed} model estimates are then used to
recompute the priors.  Note that if some observations are excluded from the
{cmd:xtmixed} run (for example, because of missing cases on any of the
regressors), these observations will not be conditioned.

{phang2}
{opt suffix(name)} is a suboption of {cmd:theta()}; it specifies a suffix used
in naming new EAP and PVs variables.  It also influences the default naming of
the {it:x} axis in ICC graphs.  If {it:nv1} and {it:nv2} are provided, they
will take precedence in naming EAP estimates and the theta scale on graphs;
however, {opt suffix()} will still apply to the PVs.

{phang2}
{opt scale(#,#)} is a suboption of {cmd:theta()}; it is used to change the
scale of the latent trait for variables that are added to the dataset.  By
default, the EAP and the PVs are obtained according to the group parameters
that are reported in {cmd:e(group_par)}.  Specifying {opt scale(m,sd)} will
rescale the latent trait so that the mean and the standard deviation in the
reference group are {it:m} and {it:sd}.  Note that this will not influence the
parameters reported in {cmd:e(item_par)} and {cmd:e(group_par)} -- only the
variables added with {opt theta()} are affected.  Also note that because 
{opt scale(m,sd)} acts on the latent trait variable level, the EAP estimates
will most probably have smaller standard deviation in the reference group than
{it:sd} because of shrinkage.

{phang2}
{opt skipnote} is a suboption of {opt theta()}; it suppresses adding notes to
newly created variables.  The default behavior is to add notes.

{dlgtab:Fixing and initiating}

{pstd}
{cmd:uirt} allows model parameters to be fixed or initiated with prespecified
values.  Fixing parameters is done with the {opt fix()} option, and initiating
with the {opt init()} option.  These options have similar suboptions and can
also be used simultaneously.  If any model parameter is present in both
{cmd:fix()} and {opt init()}, the {opt fix()} information on that parameter is
used, and {opt init()} information is discarded.  Parameters can be fixed and
initiated in a twofold manner.  One way is to refer to previous {cmd:uirt}
results that are stored in memory, using the {opt prev} suboption (if
{cmd:uirt} estimates are active) or using the {opt from(name)} suboption (if
{cmd:uirt} results {it:name} are stored in memory).  The other way is to
provide matrices with item parameters or group parameters using the
{cmd:imatrix()} or {opt dmatrix()} suboption.  These matrices must have the
form used by {cmd:uirt} for storing results: {cmd:e(item_par)} and
{cmd:e(group_par)}, respectively.  It is possible to fix and initiate only
selected parameters of an item when the {cmd:imatrix()} suboption is used; if
this is the intention, the {cmd:miss} suboption must be included -- otherwise,
{cmd:uirt} will report an error in {opt imatrix()} because it vigorously
checks the appropriateness of provided matrices.  When fixing parameters, you
can also provide information on item category values if they are not the usual
{0,...,max_cat}, using the {cmd:cmatrix()} suboption.

{phang}
{opt fix([opts])} is used to declare parameters to fix.  The suboptions are
the following:

{phang2}
{opt prev} is a suboption of {opt fix()}; it is used to fix item parameters on
estimates from a previous {cmd:uirt} run if {cmd:uirt} was the last command
called.  It will cause the parameters of all items that are found in
{cmd:e(item_par)} to be fixed on values reported in that matrix.

{phang2}
{opt from(name)} is a suboption of {opt fix()}; it is used to fix item
parameters on values from a {cmd:uirt} run that is stored in memory under name
{it:name}.  It works exactly like {opt prev}.  {opt prev} and {opt from(name)}
cannot be used simultaneously.

{phang2}
{opt usedist} is a suboption of {opt fix()}; it is used to fix group
parameters on estimates from a previous {cmd:uirt} run when calling the
{cmd:prev} or {opt from()} suboption.  (The default behavior of {opt prev} and
{cmd:from()} is to fix only the item parameters.)

{phang2} 
{opt imatrix(name)} is a suboption of {opt fix()}; it is used to provide a
matrix with item parameters to be fixed.  With {opt imatrix(name)}, it is
possible to fix only selected parameters of an item.  To do it, you must set
the entries for item parameters that are to be estimated freely to missing
values ({cmd:.}) in the matrix {it:name}, and suboption {opt miss} must be
included.

{phang2}
{opt dmatrix(name)} is a suboption of {opt fix()}; it is used to provide a
matrix with group parameters to be fixed.  It does not allow for missing
entries.

{phang2}
{opt cmatrix(name)} is a suboption of {opt fix()}; it is used to provide a
matrix with item category values if neither {opt prev} nor {opt from(name)} is
used to fix parameters.  This can be handy when previous estimates are used in
datasets with fewer observations, possibly with some item categories not
present in data, and when item categories are not consecutive integers
starting from 0 up to max_cat.

{phang2}
{opt miss} is a suboption of {opt fix()}; it permits the matrix {it:name} in
{opt imatrix(name)} to have missing entries for some item parameters.

{phang}
{opt init([opts])} is used to declare starting values.  The suboptions are the
following:

{phang2}
{opt prev} is a suboption of {opt init()}; it is used to set item parameter
starting values on estimates from a previous {cmd:uirt} run if {cmd:uirt} was
the last command called.  It will cause the parameters of all items that are
found in {cmd:e(item_par)} to be started from values reported in that matrix.

{phang2}
{opt from(name)} is a suboption of {opt init()}; it is used to set item
parameter starting values on estimates from a {cmd:uirt} run that is stored in
memory under name {it:name}.  It works exactly like {opt prev}.  {opt prev}
and {opt from(name)} cannot be used simultaneously.

{phang2}
{opt usedist} is a suboption of {opt init()}; it is used to start group
parameters with estimates from a previous {cmd:uirt} run when calling the
{cmd:prev} or {opt from()} suboption.  (The default behavior of {opt prev} and
{cmd:from()} is to pass starting values only for the item parameters.)

{phang2} 
{opt imatrix(name)} is a suboption of {opt init()}; it is used to provide a
matrix with starting values for item parameters.  With {opt imatrix(name)}, it
is possible to provide starting values only for some parameters of an item.
To do it, you must set the entries for item parameters that are to be started
by {cmd:uirt} defaults to missing values ({cmd:.}) in the matrix {it:name},
and suboption {opt miss} must be included.

{phang2}
{opt dmatrix(name)} is a suboption of {opt init()}; it is used to provide a
matrix with starting values for group parameters.  It does not allow for
missing entries.

{phang2}
{opt miss} is a suboption of {opt init()}; it permits the matrix {it:name} in
{opt imatrix(name)} to have missing entries for some item parameters.

{dlgtab:EM control}

{phang}
{opt nip(#)} sets the number of GH quadrature points used in the EM algorithm.
The default is {cmd:nip(51)}.

{phang}
{opt nit(#)} sets the maximum number of iterations of the EM algorithm.  The
default is {cmd:nit(100)}.

{phang}
{opt ninrf(#)} sets the maximum number of iterations of the
Newton-Raphson-Fisher algorithm within M-step.  The default is
{cmd:ninrf(20)}.  This option is rarely used.

{phang}
{opt crit_ll(#)} sets a stopping rule -- relative change in log likelihood
between EM iterations.  The default is {cmd:crit_ll(1e-9)}.

{phang}
{opt crit_par(#)} sets a stopping rule -- maximum absolute change in parameter
values between EM iterations.  The default is {cmd:crit_par(1e-4)}.

{phang}
{opt errors(string)} is used to choose a method for computation of standard
errors of estimated parameters.  There are four methods available ({cmd:cdm},
{cmd:rem}, {cmd:sem}, {cmd:cp}).  The default is {cmd:err(cdm)}.  Three
methods (centered difference method [CDM], Richardson extrapolation method,
supplemented EM) take the approach of differentiation of the EM mapping, and
one, cross-product (CP), is based on Louis's (1982) CP approach.  The methods
will be briefly described in order of recommendation.  See Jamshidian and
Jennrich (2000) for a general overview of these methods.  CDM for numerical
differentiation of EM mapping is the default option and is recommended for
reporting standard errors.  CP by Louis's method is considerably faster but
biased -- use it when errors are of lesser importance and you want to speed up
the computation.  The Richardson extrapolation method for differentiation of
EM mapping is (unnecessarily) more precise than CDM, at cost of doubling the
computational expense.  Supplemented EM for differentiation of EM mapping
usually takes the most time and is unstable -- not recommended, included for
research purposes.

{phang}
{opt priors(varlist[, opts])} is used to provide a list of items to estimate
with priors.  Only dichotomous items are supported.  When {cmd:*} is typed for
{it:varlist}, the priors specified in {it:opts} will be applied to all
dichotomous items declared in the main list of items.  Note that modification
of the model that is introduced with item parameter priors is accounted for
neither in the reported log likelihood nor in the reported number of degrees
of freedom of the model.  Therefore, likelihood-based statistical testing
(comparing nested models with LR test, DIF analysis, item-fit statistics,
etc.) conducted on models estimated with item parameter priors may be biased.
When priors are used, the convergence is monitored only with {opt crit_par()};
the {opt crit_ll()} stopping rule is ignored.  The prior distributions for
item parameters are specified with the following suboptions of {opt priors()}:

{phang2}
{opt anormal(#,#)} is used to set parameters (mean, sd) of the normal prior
for the discrimination parameter.  If this suboption is skipped, all
discriminations are estimated without priors.

{phang2}
{opt bnormal(#,#)} is used to set parameters of the normal prior (mean, sd)
for the difficulty parameter.  If this suboption is skipped, all difficulties
are estimated without priors.

{phang2}
{opt cbeta(#,#)} is used to set parameters (alpha, beta) of the beta prior for
the pseudoguessing parameter.  If this suboption is skipped, all
pseudoguessing parameters are estimated without priors.

{dlgtab:Reporting}

{phang}
{opt notable} suppresses display of coefficient table.  The default
coefficient table may be large and provides information that is often not
useful in the context of IRT analysis (we are usually not interested if IRT
parameters differ from zero).  Parameters and their errors are accessible in a
compact form in {cmd:e()} matrices, so you may wish not to see the default
coefficient table at all.

{phang}
{opt noheader} suppresses display of model summary after estimation is
complete.

{phang}
{opt trace(#)} allows for controlling how log is printed after iterations.
{cmd:0} -- no log (except warnings); {cmd:1} -- limited log (default option);
{cmd:2} -- detailed log.


{marker examples}{...}
{title:Examples}

{pstd}Setup{p_end}
{phang2}{cmd:. webuse masc2}{p_end}

{pstd}
Run {cmd:uirt} on default settings (one group, 2PLM for 0-1 items, general
regression model for 0-k items), and ask to plot ICC for item {cmd:q6}{p_end}
{phang2}{cmd:. uirt q*, icc(q6)}{p_end}

{pstd}
Continue the analysis using estimates from a previous run as starting values,
and ask that item {cmd:q6} be 3PLM with suboption {opt lrcrit()} turned off;
also plot ICC for that item{p_end}
{phang2}{cmd:. uirt q*, guess(q6, lrcrit(1)) init(prev) icc(q6)}{p_end}

{pstd}
Refit the model with all items asked to be 3PLM; use {cmd:cbeta(5,18)}
distribution as prior for the pseudoguessing parameter to ensure
convergence{p_end}
{phang2}{cmd:. uirt q*, guess(*, lrcrit(1)) priors(*, cbeta(5,18))}{p_end}

{pstd}
Fit a two-group model to data with {cmd:female} grouping variable, all items
2PLM, and test item {cmd:q1} for DIF{p_end}
{phang2}{cmd:. uirt q*, group(female, dif(q1))}{p_end}

{pstd}
Fit a single-group model with all items 2PLM, generate 5 PVs conditioned on
the {cmd:female} variable, and ask that the scale of generated PVs have
mean=500 and sd=100{p_end}
{phang2}{cmd:. uirt q*, theta(, pv(5) pvreg(i.female) scale(500,100))}{p_end}


{marker results}{...}
{title:Stored results}

{pstd}
{cmd:uirt} stores the following in {cmd:e()}:

{synoptset 20 tabbed}{...}
{p2col 5 17 21 2: Scalars}{p_end}
{synopt:{cmd:e(N)}}number of observations{p_end}
{synopt:{cmd:e(df_m)}}model degrees of freedom{p_end}
{synopt:{cmd:e(ll)}}log (restricted) likelihood{p_end}
{synopt:{cmd:e(converged)}}{cmd:1} if converged, {cmd:0} otherwise{p_end}
{synopt:{cmd:e(N_items)}}number of items in the model{p_end}
{synopt:{cmd:e(N_gr)}}number of groups in the model{p_end}

{p2col 5 17 21 2: Macros}{p_end}
{synopt:{cmd:e(cmd)}}{cmd:uirt}{p_end}
{synopt:{cmd:e(cmdline)}}command as typed{p_end}
{synopt:{cmd:e(depvar)}}name of dependent variables (items){p_end}
{synopt:{cmd:e(title)}}title in estimation output{p_end}
{synopt:{cmd:e(properties)}}{cmd:b V}{p_end}
{synopt:{cmd:e(cmdstrip)}}command in form that is passed to {cmd:init()} or
{cmd:fix()} in reruns{p_end}

{p2col 5 17 21 2: Matrices}{p_end}
{synopt:{cmd:e(b)}}coefficient vector{p_end}
{synopt:{cmd:e(Cns)}}constraints matrix{p_end}
{synopt:{cmd:e(V)}}variance-covariance matrix of the estimators{p_end}
{synopt:{cmd:e(item_par)}}estimated item parameters{p_end}
{synopt:{cmd:e(item_par_se)}}standard errors of estimated item parameters{p_end}
{synopt:{cmd:e(group_par)}}estimated group parameters{p_end}
{synopt:{cmd:e(group_par_se)}}standard errors of estimated group parameters{p_end}
{synopt:{cmd:e(group_ll)}}log likelihood by group{p_end}
{synopt:{cmd:e(group_N)}}number of observations by group{p_end}
{synopt:{cmd:e(item_group_N)}}number of observations for each item by group{p_end}
{synopt:{cmd:e(item_cats)}}item categories{p_end}
{synopt:{cmd:e(dif_results)}}LR test results and effect size measures after DIF analysis{p_end}
{synopt:{cmd:e(dif_item_par_GR)}}parameters of DIF items obtained in the reference group{p_end}
{synopt:{cmd:e(dif_item_par_GF)}}parameters of DIF items obtained in the focal group{p_end}
{synopt:{cmd:e(item_fit_chi2W)}}item-fit results for chi2W statistic{p_end}
{synopt:{cmd:e(item_fit_SX2)}}item-fit results for S-X2 statistic{p_end}


{marker acknowledgments}{...}
{title:Acknowledgments}

{pstd}
I wish to thank Cees Glas, who provided me with invaluable consultancy on many
parts of the estimation algorithms used in {cmd:uirt}, and Mateusz Zoltak for
very helpful hints on Mata pointers, which led to significant boost in
efficiency of {cmd:uirt}.  Many thanks to all my colleagues at the Institute
of Educational Research in Warsaw for using {cmd:uirt} at the early stages of
its development and providing me with feedback and encouragement to continue
with this endeavor.  I am also grateful to numerous Stata users who contacted
me with ideas on how to improve the software after its first release.  I feel
especially indebted to Eric Melse for his support in building postestimation
commands that allow for plotting information functions and expected score
curves.  Last but not least, I would like to thank the anonymous reviewer at
the {it:Stata Journal}, who guided me on how to rewrite {cmd:uirt} to make it
more user friendly and more aligned with Stata programming standards.


{marker funding}{...}
{title:Funding}

{pstd}
Preparation of commands of {cmd:uirt} related to item-fit analysis was funded
by the National Science Centre research grant number 2015/17/N/HS6/02965.


{marker references}{...}
{title:References}

{phang}
Bock, R. D., and M. Aitkin. 1981. Marginal maximum likelihood estimation of
item parameters: Application of an EM algorithm. Psychometrika 46: 443–459. 
{browse "https://doi.org/10.1007/BF02293801"}.

{phang}
Dempster, A. P., N. M. Laird, and D. B. Rubin. 1977. Maximum likelihood from
incomplete data via the EM algorithm.
{it:Journal of the Royal Statistical Society, Series B} 39: 1–38. 
{browse "https://doi.org/10.1111/j.2517-6161.1977.tb01600.x"}.

{phang}
Jamshidian, M., and R. I. Jennrich. 2000.
Standard errors for EM estimation. 
{it:Journal of the Royal Statistical Society, Series B} 62: 257–270.
{browse "https://doi.org/10.1111/1467-9868.00230"}.

{phang}
Kondratek, B. 2020.  Item-fit statistic based on posterior probabilities of
membership in ability groups. Working paper.

{phang}
Louis, T. A. 1982.
Finding the observed information matrix when using the EM algorithm.
{it:Journal of the Royal Statistical Society, Series B} 44: 226–233.
{browse "https://doi.org/10.1111/j.2517-6161.1982.tb01203.x"}.

{phang}
Orlando, M., and D. Thissen. 2000. Likelihood-based item-fit indices for
dichotomous item response theory models.
{it:Applied Psychological Measurement} 24: 50–64.
{browse "https://doi.org/10.1177/01466216000241003"}.

{phang}
Patz, R. J., and B. W. Junker. 1999. A straightforward approach to Markov
chain Monte Carlo methods for item response models. 
{it:Journal of Educational and Behavioral Statistics} 24: 146–178. 
{browse "https://doi.org/10.2307/1165199"}.

{phang}
Wainer, H. 1993. Model-based standardized measurement of an item's
differential impact. In {it:Differential Item Functioning}, ed. P. W. Holland
and H. Wainer, 123–136.  Hillsdale, NJ: Lawrence Erlbaum.


{marker author}{...}
{title:Author}

{pstd}
Bartosz Kondratek{break}
Educational Research Institute{break}
Warsaw, Poland{break}
b.kondratek@ibe.edu.pl


{marker alsosee}{...}
{title:Also see}

{p 4 14 2}
Article:  {it:Stata Journal}, volume 22, number 2: {browse "https://doi.org/10.1177/1536867X221106368":st0670}{p_end}
