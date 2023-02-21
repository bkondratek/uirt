{smcl}
{* *! version 1.1 2022.01.25}{...}
{viewerjumpto "Title" "uirt_dif##title"}{...}
{viewerjumpto "Syntax" "uirt_dif##syntax"}{...}
{viewerjumpto "Description" "uirt_dif##description"}{...}
{viewerjumpto "Options" "uirt_dif##optionssec"}{...}
{viewerjumpto "Examples" "uirt_dif##examples"}{...}
{viewerjumpto "Stored results" "uirt_dif##results"}{...}
{viewerjumpto "Reference" "uirt_dif##reference"}{...}
{viewerjumpto "Author" "uirt_dif##author"}{...}
{viewerjumpto "Also see" "uirt_dif##alsosee"}{...}
{cmd:help uirt_dif}{right: ({browse "https://doi.org/10.1177/1536867X221106368":SJ22-2: st0670})}
{hline}

{marker title}{...}
{title:Title}

{p2colset 5 17 19 2}{...} 
{p2col :{cmd:uirt_dif} {hline 2}}Postestimation command of {help uirt} to perform differential item functioning analysis{p_end}


{marker syntax}{...}
{title:Syntax}

{p 8 16 2}
{cmd:uirt_dif} [{varlist}]  [{cmd:,} {it:{help uirt_dif##options:options}}]

{pstd}
{it:varlist} must include only variables that were declared in the main list
of items of the current {cmd:uirt} run.  If {it:varlist} is skipped or an
asterisk ({cmd:*}) is used, {cmd:uirt_dif} will either display the results
that are currently stored in the {cmd:e(dif_results)} matrix (display mode) or
conduct differential item functioning (DIF) analysis on all items declared in
the main list of items of the current {cmd:uirt} run (estimation mode).  This
behavior depends on whether any DIF analysis was produced by the current
{cmd:uirt} run.

{synoptset 17}{...}
{marker options}{...}
{synopthdr}
{synoptline}
{synopt:{opt f:ormat(str)}}file format for DIF graphs ({cmd:png}, {cmd:gph},
or {cmd:eps}); default is {cmd:format(png)}{p_end}
{synopt:{opt c:olors(str)}}color names to override default plot colors used in DIF graphs{p_end}
{synopt:{opth tw(twoway_options)}}{cmd:graph twoway} options to override default graph layout{p_end}
{synopt:{opt cl:eargraphs}}suppress storing of graphs in Stata memory{p_end}
{synoptline}


{marker description}{...}
{title:Description}

{pstd}
{cmd:uirt_dif} is a postestimation command of {helpb uirt} that allows for DIF
analysis after a two-group model is fit.  For each item specified for DIF
analysis, a two-group model with common item parameters in both groups is
compared against a model with group-specific parameters for that item.
Statistical significance of DIF is verified by a likelihood-ratio test.
Effect measures are computed on the observed score metric (P-DIF) by
subtracting expected mean scores of an item under each of the group-specific
item parameter estimates (Wainer 1993).  Namely,
P-DIF|GR=E(parR,GR)-E(parF,GR), where GR indicates that the reference group
distribution was used for integration and parR and parF stand for item
parameters estimated in GR and GF, respectively.  An analogous P-DIF|GF
measure is also computed.  DIF significance and effect size information are
stored in {cmd:r(dif_results)}.  Group-specific item parameter estimates are
stored in {cmd:r(dif_item_par_GR)} and {cmd:r(dif_item_par_GF)}.  Using
{cmd:uirt_dif} in estimation mode will also result in plotting graphs with
group-specific intraclass correlation coefficients and P-DIFs, which are saved
in the working directory.


{marker optionssec}{...}
{title:Options}

{phang}
{opt format(str)} specifies the file format in which the DIF graphs are saved
({cmd:png}, {cmd:gph}, or {cmd:eps}).  The default is {cmd:format(png)}.

{phang}
{opt colors(str)} is used to override default color codes used for the
group-specific intraclass correlation coefficient and P-DIF lines.  By
default, the plots in the reference group are red, and the plots in the focal
group are blue.  A pair of color names separated by spaces is required.  The
first color applies to the reference group, and the second applies to the
focal group.

{phang}
{opth tw(twoway_options)} is used to add user-defined {cmd:graph twoway}
options to override the default graph layout, like {opt xtitle()} or
{cmd:scheme()}, etc.

{phang}
{opt cleargraphs} is used to suppress the default behavior of storing all DIF
graphs in Stata memory.  After you specify this, all graphs are still saved in
the current working directory, but only the last graph is active in Stata.


{marker examples}{...}
{title:Examples}

{pstd}Setup{p_end}
{phang2}{cmd:. webuse masc2}{p_end}

{pstd}
Fit a two-group item response theory model with default settings of
{helpb uirt} using items {cmd:q1}-{cmd:q9} and {cmd:female} for
grouping{p_end}
{phang2}{cmd:. uirt q*, group(female)}{p_end}

{pstd}
Analyze DIF only for item {cmd:q1}{p_end}
{phang2}{cmd:. uirt_dif q1}{p_end}

{pstd}
Perform DIF analysis for all items, and change graph scheme and group-specific
coloring of plots{p_end}
{phang2}{cmd:. uirt_dif *, tw(scheme(sj)) color(gs2 gs6)}{p_end}


{marker results}{...}
{title:Stored results}

{pstd}
{cmd:uirt_dif} stores the following in {cmd:r()}:

{synoptset 20 tabbed}{...}
{p2col 5 17 21 2:Matrices}{p_end}
{synopt:{cmd:r(dif_results)}}likelihood-ratio test results and effect-size measures after DIF analysis{p_end}
{synopt:{cmd:r(dif_item_par_GR)}}parameters of DIF items obtained in the reference group{p_end}
{synopt:{cmd:r(dif_item_par_GF)}}parameters of DIF items obtained in the focal group{p_end}


{marker reference}{...}
{title:Reference}

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

{p 7 14 2}
Help:  {helpb uirt} (if installed){p_end}
