{smcl}
{* *! version 1.0 2022.02.11}{...}
{viewerjumpto "Title" "uirt_inf##title"}{...}
{viewerjumpto "Syntax" "uirt_inf##syntax"}{...}
{viewerjumpto "Description" "uirt_inf##description"}{...}
{viewerjumpto "Options" "uirt_inf##optionssec"}{...}
{viewerjumpto "Examples" "uirt_inf##examples"}{...}
{viewerjumpto "Stored results" "uirt_inf##results"}{...}
{viewerjumpto "Author" "uirt_inf##author"}{...}
{viewerjumpto "Also see" "uirt_inf##alsosee"}{...}
{cmd:help uirt_inf}{right: ({browse "https://doi.org/10.1177/1536867X221106368":SJ22-2: st0670})}
{hline}

{marker title}{...}
{title:Title}

{p2colset 5 17 19 2}{...}
{p2col :{cmd:uirt_inf} {hline 2}}Postestimation command of {help uirt} to plot
information functions{p_end}


{marker syntax}{...}
{title:Syntax}

{p 8 16 2}
{cmd:uirt_inf} [{varlist}] [{cmd:,} {it:{help uirt_inf##options:options}}]

{pstd}
{it:varlist} must include only variables that were declared in the main list
of items of the current {cmd:uirt} run.  If {it:varlist} is skipped or an
asterisk ({cmd:*}) is used and no options are added, {cmd:uirt_inf} will
create a graph with item information functions for all items declared in the
main list of items of the current {cmd:uirt} run.

{synoptset 18}{...}
{marker options}{...}
{synopthdr}
{synoptline}
{synopt:{opt t:est}}test-level I(theta){p_end}
{synopt:{opt se}}conditional standard error, instead of I(theta); only with {opt test}{p_end}
{synopt:{opt gr:oups}}group-specific I(theta); only with {opt test} and a
multigroup model{p_end}
{synopt:{opth tw(twoway_options)}}{cmd:graph twoway} options to override default graph layout{p_end}
{synoptline}


{marker description}{...}
{title:Description}

{pstd}
{cmd:uirt_inf} is a postestimation command of {helpb uirt}.  It allows one to
plot the information functions of individual items or the information function
of a test consisting of items provided in {it:varlist}.  The test information
function is obtained with the {opt test} option.  It is equal to the sum of
individual item information functions and a term that accounts for the prior
distribution of theta (reciprocal of the variance of the prior).  In a
multigroup model, this may result in different shapes of test information
functions for each group.  By default, {cmd:uirt_inf} will plot the test
information function only for the reference group.  If you wish to see the
group-specific I(theta) plots, you should add the {opt groups} option.  When
{opt test} is used together with {opt se}, a function of the standard error of
the estimate of theta is plotted instead of the default I(theta).  It is equal
to the reciprocal of the square root of the test information function.
Group-specific standard error plots in multigroup models can be obtained by
adding the {opt groups} option.


{marker optionssec}{...}
{title:Options}

{phang}
{opt test} creates a graph with the test information function for items
specified in {it:varlist}.  It can be modified with {opt se} to produce a
standard error plot.  In multigroup models, it can also be modified with
{cmd:groups} to produce group-specific plots.

{phang}
{cmd:se} modifies the {opt test} option to produce a plot with the standard
error of theta estimates.  In multigroup models, it can also be modified with
{cmd:groups} to include group-specific plots.

{phang}
{opt groups} modifies the test-level graphs to include group-specific plots.
It will take no effect in a single-group model or if the option {opt test} is
not included.

{phang}
{opth tw(twoway_options)} is used to add user-defined {cmd:graph twoway}
options to override the default graph layout, like {opt xtitle()},
{cmd:scheme()}, etc.


{marker examples}{...}
{title:Examples}

{pstd}Setup{p_end}
{phang2}{cmd:. webuse masc2}{p_end}

{pstd}Fit a two-group item response theory model with {helpb uirt}{p_end}
{phang2}{cmd:. uirt q*, group(female)}{p_end}

{pstd}Item information function for {cmd:q1}{p_end}
{phang2}{cmd:. uirt_inf q1}{p_end}

{pstd}Item information functions for all items{p_end}
{phang2}{cmd:. uirt_inf}{p_end}

{pstd}Test information function assuming all items{p_end}
{phang2}{cmd:. uirt_inf *, test}{p_end}

{pstd}Group-specific test information functions{p_end}
{phang2}{cmd:. uirt_inf *, test groups}{p_end}

{pstd}
Create a graph with group-specific standard error functions; name it for use
in next step{p_end}
{phang2}{cmd:. uirt_inf *, test se groups tw(name(se_theta_inf))}{p_end}

{pstd}
Add the expected a posteriori (EAP) estimate and its standard error to the
dataset with {helpb uirt_theta}; create a scatterplot of the standard error of
EAP and EAP; combine with the graph from previous step to compare the
results{p_end}
{phang2}{cmd:. uirt_theta, eap}{p_end}
{phang2}{cmd:. twoway (scatter se_theta theta if female==0, yvarlab(female=0) ) || (scatter se_theta theta if female==1, yvarlab(female=1)),}
{cmd:xscale(range(-4 4)) name(se_theta_eap) ytitle(Standard error of EAP) xtitle(EAP of theta) title (EAP - error vs estimates)}{p_end}
{phang2}{cmd:. graph combine se_theta_eap se_theta_inf, ycommon}{p_end}


{marker results}{...}
{title:Stored results}

{pstd}
{cmd:uirt_inf} does not store anything in {cmd:r()}.


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
