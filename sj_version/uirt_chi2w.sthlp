{smcl}
{* *! version 1,0 2021.03.09}{...}
{viewerjumpto "Title" "uirt_chi2w##title"}{...}
{viewerjumpto "Syntax" "uirt_chi2w##syntax"}{...}
{viewerjumpto "Description" "uirt_chi2w##description"}{...}
{viewerjumpto "Options" "uirt_chi2w##optionssec"}{...}
{viewerjumpto "Examples" "uirt_chi2w##examples"}{...}
{viewerjumpto "Stored results" "uirt_chi2w##results"}{...}
{viewerjumpto "Reference" "uirt_chi2w##reference"}{...}
{viewerjumpto "Author" "uirt_chi2w##author"}{...}
{viewerjumpto "Also see" "uirt_chi2w##alsosee"}{...}
{cmd:help uirt_chi2w}{right: ({browse "https://doi.org/10.1177/1536867X221106368":SJ22-2: st0670})}
{hline}

{marker title}{...}
{title:Title}

{p2colset 5 19 21 2}{...}
{p2col :{cmd:uirt_chi2w} {hline 2}}Postestimation command of {help uirt} to
compute chi2W item-fit statistic{p_end}


{marker syntax}{...}
{title:Syntax}

{p 8 18 2}
{cmd:uirt_chi2w} [{varlist}] [{cmd:,} {it:{help uirt_chi2w##options:options}}]

{pstd}
{it:varlist} must include only variables that were declared in the main list
of items of the current {cmd:uirt} run.  If {it:varlist} is skipped or an
asterisk ({cmd:*}) is used, {cmd:uirt_chi2w} will either display the results
that are currently stored in the {cmd:e(item_fit_chi2W)} matrix or compute the
chi2W item-fit statistic for all items declared in the main list of items of
the current {cmd:uirt} run.  This behavior depends on whether chi2W item-fit
statistics were produced by the current {cmd:uirt} run.

{synoptset 15}{...}
{marker options}{...}
{synopthdr}
{synoptline}
{synopt:{opt bins(#)}}number of ability intervals for computation of chi2W{p_end}
{synopt:{opt npq:min(#)}}minimum expected number of observations in ability
intervals (NPQ); default is {cmd:npqmin(20)}{p_end}
{synopt:{opt npqr:eport}}report information about minimum NPQ in ability intervals{p_end}
{synoptline}


{marker description}{...}
{title:Description}

{pstd}
{cmd:uirt_chi2w} is a postestimation command of {helpb uirt} that computes the
chi2W item-fit statistic.  chi2W is a Wald-type test statistic that compares
the observed and expected item mean scores over a set of ability bins.  The
observed and expected scores are weighted means with weights being an a
posteriori density of a person's ability within the bin -- as in the approach
used to compute observed proportions in intraclass correlation coefficient
plots provided by {cmd:uirt}.  Properties of chi2W have been examined for
dichotomous items; the type I error rate was close to nominal; and it exceeded
S-X2 in statistical power (Kondratek 2020).  The behavior of chi2W for
polytomous items, at the time of this {cmd:uirt} release, has not been
researched.


{marker optionssec}{...}
{title:Options}

{phang}
{opt bins(#)} is used to set the number of ability intervals for computation
of chi2W.  Default settings depend on the item model and number of freely
estimated parameters for the item being tested.  In general, the default is
either {cmd:bins(3)} or a minimal number of intervals allowing for one degree
of freedom after accounting for the number of estimated item parameters.

{phang}
{opt npqmin(#)} sets a minimum for NPQ integrated over any ability interval,
where N is the number of observations, P is the expected item mean, and
Q=(max_item_score-P).  Larger NPQ values are associated with better
asymptotics of chi2W.  If NPQ for a given ability bin is smaller than the
value declared in {opt npqmin(#)}, {cmd:uirt} will decrease the number of bins
for that item.  The default is {cmd:npqmin(20)}.

{phang}
{opt npqreport} adds a column to {cmd:r(item_fit_chi2W)} with information
about the smallest observed NPQ value over the ability intervals used for
computation of chi2W.


{marker examples}{...}
{title:Examples}

{pstd}Setup{p_end}
{phang2}{cmd:. webuse masc2}{p_end}

{pstd}
Fit an item response theory model with all items being a one-parameter
logistic model (a one-parameter logistic model is a dichotomous case of a
partial credit model){p_end}
{phang2}{cmd:. uirt q*, pcm(*)}{p_end}

{pstd}
Compute chi2W item fit statistic for all items{p_end}
{phang2}{cmd:. uirt_chi2w}{p_end}

{pstd}
Refit the model with all items being a two-parameter logistic model (the
default for {cmd:uirt}), and compute chi2W for all items under this
model{p_end}
{phang2}{cmd:. uirt q*}{p_end}
{phang2}{cmd:. uirt_chi2w}{p_end}

{pstd}
Refit the model, asking item {cmd:q6} to be a three-parameter logistic model,
and compute chi2W only for that item{p_end}
{phang2}{cmd:. uirt q*, guess(q6, lrcrit(1))}{p_end}
{phang2}{cmd:. uirt_chi2w q6}{p_end}


{marker results}{...}
{title:Stored results}

{pstd}
{cmd:uirt_chi2w} stores the following in {cmd:r()}:

{synoptset 20 tabbed}{...}
{p2col 5 20 22 2: Matrices}{p_end}
{synopt:{cmd:r(item_fit_chi2W)}}item-fit results for chi2W statistic{p_end}


{marker reference}{...}
{title:Reference}

{phang}
Kondratek, B. 2020.  Item-fit statistic based on posterior probabilities
of membership in ability groups. Working paper.


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

{p 7 14 2}
Help:  {helpb uirt} (if installed){p_end}
