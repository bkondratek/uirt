{smcl}
{* *! version 1,0 2021.03.09}{...}
{viewerjumpto "Title" "uirt_sx2##title"}{...}
{viewerjumpto "Syntax" "uirt_sx2##syntax"}{...}
{viewerjumpto "Description" "uirt_sx2##description"}{...}
{viewerjumpto "Option" "uirt_sx2##option"}{...}
{viewerjumpto "Examples" "uirt_sx2##examples"}{...}
{viewerjumpto "Stored results" "uirt_sx2##results"}{...}
{viewerjumpto "Reference" "uirt_sx2##reference"}{...}
{viewerjumpto "Author" "uirt_sx2##author"}{...}
{viewerjumpto "Also see" "uirt_sx2##alsosee"}{...}
{cmd:help uirt_sx2}{right: ({browse "https://doi.org/10.1177/1536867X221106368":SJ22-2: st0670})}
{hline}

{marker title}{...}
{title:Title}

{p2colset 5 17 19 2}{...}
{p2col :{cmd:uirt_sx2} {hline 2}}Postestimation command of {help uirt} to
compute S-X2 item-fit statistic{p_end}


{marker syntax}{...}
{title:Syntax}

{p 8 16 2}
{cmd:uirt_sx2} [{varlist}] [{cmd:,} {it:{help uirt_sx2##options:option}}]

{pmore}
{it:varlist} must include only variables that were declared in the main list
of items of the current {cmd:uirt} run.  If {it:varlist} is skipped or an
asterisk ({cmd:*}) is used, {cmd:uirt_sx2} will either display the results
that are currently stored in the {cmd:e(item_fit_SX2)} matrix or compute the
S-X2 item-fit statistic for all items declared in the main list of items of
the current {cmd:uirt} run.  This behavior depends on whether S-X2 item-fit
statistics were produced by the current {cmd:uirt} run.

{synoptset 14}{...}
{marker options}{...}
{synopthdr :option}
{synoptline}
{synopt:{opt minf:req(#)}}minimum expected number of observations in ability
intervals (NP and NQ); default is {cmd:minf(1)}{p_end}
{synoptline}


{marker description}{...}
{title:Description}

{pstd}
{cmd:uirt_sx2} is a postestimation command of {helpb uirt} that computes the
classical S-X2 statistic proposed by Orlando and Thissen (2000).  It is
available only for dichotomous items, and it cannot be used in a multigroup
setting.  The number-correct score used for grouping is obtained from
dichotomous items -- if polytomous items are present in data, they are ignored
in the computation of S-X2.  If a dichotomous item has missing responses, it
is also ignored in the computation of S-X2.  The results are stored in
{cmd:r(item_fit_SX2)}.


{marker option}{...}
{title:Option}

{phang}
{opt minfreq(#)} sets a minimum for both NP and NQ integrated over any ability
interval, where N is the number of observations, P is the expected item mean,
and Q=(1-P).  The default is {cmd:minfreq(1)}.


{marker examples}{...}
{title:Examples}

{pstd}Setup{p_end}
{phang2}{cmd:. webuse masc2}{p_end}

{pstd}
Fit an item response theory model with all items being a one-parameter
logistic model (a one-parameter logistic model is a dichotomous case of a
partial credit model){p_end}
{phang2}{cmd:. uirt q*, pcm(*)}{p_end}

{pstd}Compute S-X2 item fit statistic for all items{p_end}
{phang2}{cmd:. uirt_sx2}{p_end}

{pstd}
Refit the model with all items being a two-parameter logistic model (the
default for {cmd:uirt}), and compute S-X2 for all items under this
model{p_end}
{phang2}{cmd:. uirt q*}{p_end}
{phang2}{cmd:. uirt_sx2}{p_end}

{pstd}
Refit the model, asking item {cmd:q6} to be a three-parameter logistic model,
and compute S-X2 only for that item{p_end}
{phang2}{cmd:. uirt q*, guess(q6,lr(1))}{p_end}
{phang2}{cmd:. uirt_sx2 q6}{p_end}


{marker results}{...}
{title:Stored results}

{pstd}
{cmd:uirt_sx2} stores the following in {cmd:r()}:

{synoptset 20 tabbed}{...}
{p2col 5 17 21 2: Matrices}{p_end}
{synopt:{cmd:r(item_fit_SX2)}}item-fit results for S-X2 statistic{p_end}


{marker reference}{...}
{title:Reference}

{phang}
Orlando, M., and D. Thissen. 2000. Likelihood-based item-fit indices for
dichotomous item response theory models.
{it:Applied Psychological Measurement} 24: 50–64.
{browse "https://doi.org/10.1177/01466216000241003"}.


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
