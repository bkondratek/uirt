{smcl}
{* *! version 1.0 2022.02.09}{...}
{viewerjumpto "Title" "uirt_esf##title"}{...}
{viewerjumpto "Syntax" "uirt_esf##syntax"}{...}
{viewerjumpto "Description" "uirt_esf##description"}{...}
{viewerjumpto "Options" "uirt_esf##optionssec"}{...}
{viewerjumpto "Examples" "uirt_esf##examples"}{...}
{viewerjumpto "Stored results" "uirt_esf##results"}{...}
{viewerjumpto "Author" "uirt_esf##author"}{...}
{viewerjumpto "Also see" "uirt_esf##alsosee"}{...}
{cmd:help uirt_esf}{right: ({browse "https://doi.org/10.1177/1536867X221106368":SJ22-2: st0670})}
{hline}

{marker title}{...}
{title:Title}

{p2colset 5 17 19 2}{...}
{p2col :{cmd:uirt_esf} {hline 2}}Postestimation command of {help uirt} to plot
expected score functions for items and expected sum-score function for a set
of items{p_end}


{marker syntax}{...}
{title:Syntax}

{p 8 16 2}
{cmd:uirt_esf} [{varlist}] [{cmd:,} {it:{help uirt_esf##options:options}}]

{pstd}
{it:varlist} must include only variables that were declared in the main list
of items of the current {cmd:uirt} run.  If {it:varlist} is skipped or an
asterisk ({cmd:*}) is used and no options are added, {cmd:uirt_esf} will
create expected score functions of individual item (IESF) plots for all items
declared in the main list of items of the current {cmd:uirt} run.

{synoptset 18}{...}
{marker options}{...}
{synopthdr}
{synoptline}
{synopt:{opt tesf}}draw expected sum-score function (test characteristic curve) instead of IESF{p_end}
{synopt:{opt all}}create both IESF and test-level expected sum-score (TESF) graphs{p_end}
{synopt:{opt bins(#)}}number of ability intervals for observed mean scores;
default is {cmd:bins(100)}{p_end}
{synopt:{opt noo:bs}}suppress plotting observed mean scores{p_end}
{synopt:{opt c:olor(str)}}color name to override default color of expected
score function (ESF) lines and markers{p_end}
{synopt:{opth tw(twoway_options)}}{cmd:graph twoway} options to override default graph layout{p_end}
{synopt:{opt f:ormat(str)}}file format for ESF graphs ({cmd:png}, {cmd:gph},
or {cmd:eps}); default
is {cmd:format(png)}{p_end}
{synopt:{opt pref:ix(str)}}set the prefix of filenames{p_end}
{synopt:{opt suf:fix(str)}}set the suffix of filenames{p_end}
{synopt:{opt cl:eargraphs}}suppress storing of graphs in Stata memory{p_end}
{synoptline}


{marker description}{...}
{title:Description}

{pstd}
{cmd:uirt_esf} is a postestimation command of {helpb uirt}.  It allows one to
plot the IESF or the expected sum-score function of a test consisting of items
provided in {it:varlist} (TESF).  On an item level, it is similar to 
{helpb uirt_icc}.  The difference is that {cmd:uirt_icc} draws probabilities
of each response-category against theta, whereas {cmd:uirt_esf} plots the
expected item score against theta.  For binary items, the intraclass
correlation coefficient (ICC) and IESF are the same (only the range of the
{it:y} axis may be different, if item is not coded {cmd:0}-{cmd:1}).  IESF
becomes useful to analyze psychometric properties of polytomous items,
especially when there are many response categories (single curve characterizes
performance of the item) or when numerical values of response categories are
not equally spaced.  The TESF is obtained with the {opt tesf} option.  The
TESF is also called the test characteristic curve.

{pstd}
The default behavior of {cmd:uirt_esf} is to superimpose means of observed
scores against the estimated expected response curves.  This aids graphical
assessment of model fit.  The observed mean scores are computed after
quantile-based division of the distribution of the latent variable,
analogously as in {helpb uirt_icc}.  Plotting observed mean scores is
controlled by {cmd:bins()}; it can also be turned off by {opt noobs}.
The default look of graphs can be overridden by options {opt color()}
and {cmd:tw()}.

{pstd}
Note that if ESF graphs for requested items are already saved in the working
directory under default names, they will be overwritten after the command is
repeated.  If you do not want to overwrite previous files, change the working
directory, rename the existing files, or use the {opt prefix()} or
{cmd:suffix()} option.


{marker optionssec}{...}
{title:Options}

{phang}
{opt tesf} creates a plot with the expected sum-score function of a test
consisting of items provided in the {it:varlist}.  Such a plot is described
with the acronym TESF in this help file, but it is also known as the test
characteristic curve.

{pmore}
{cmd:uirt_esf} adds observed mean scores to all plots by default.  Note that
for TESF, {cmd:uirt_esf} does this by summing the observed mean scores of
individual items.  Even if the number of observations differ between items in
your data (incomplete designs, missing data), each item will be included with
equal weight in the sum-score.

{phang}
{opt all} results in plotting both the item-level IESF graphs and the
test-level TESF graph.

{phang}
{opt bins(#)} sets the number of intervals into which the distribution of
ability is split when calculating observed mean scores.  The default is
{cmd:bins(100)}.

{phang}
{opt noobs} suppresses plotting observed proportions.

{phang}
{opt color(str)} is used to override the default color ({cmd:green}) that is
used for both the ESF lines and the observed score markers.

{phang}
{opth tw(twoway_options)} is used to add user-defined {cmd:graph twoway}
options to override the default graph layout, like {opt xtitle()} or
{cmd:scheme()}, etc.

{phang}
{opt format(str)} specifies the file format in which the ESF graphs are saved
({cmd:png}, {cmd:gph}, or {cmd:eps}).  The default is {cmd:format(png)}.

{phang}
{opt prefix(str)} is used to define a string that is added at the beginning of
the names of saved files.  The default for the item response functions is
{cmd:prefix(esf)}.  The test response function has no default prefix.

{phang}
{opt suffix(str)} adds a user-defined string at the end of the names of saved
files.  The default behavior is not to add any suffix.

{phang}
{opt cleargraphs} is used to suppress the default behavior of storing all ICC
graphs in Stata memory.  After you specify this, all graphs are still saved in
the current working directory, but only the last graph is active in Stata.


{marker examples}{...}
{title:Examples}

{pstd}
Setup{p_end}
{phang2}{cmd:. webuse masc1}{p_end}
{phang2}{cmd:. generate s_q8q9 = q8 + q9}{p_end}

{pstd}
Fit an item response theory model to binary items {cmd:q1}-{cmd:q7} and the
artificial three-categorical item {cmd:s_q8q9} with {helpb uirt}; create ICC
plot for {cmd:s_q8q9} with {helpb uirt_icc}{p_end}
{phang2}{cmd:. uirt q1-q7 s_q8q9}{p_end}
{phang2}{cmd:. uirt_icc s_q8q9, tw(title(Item s_q8q9: ICC plot))}{p_end}

{pstd}
Create IESF plot for {cmd:s_q8q9}, and combine the two graphs to compare
information from ICC and IESF{p_end}
{phang2}{cmd:. uirt_esf s_q8q9, tw(title("Item s_q8q9: IESF plot"))}{p_end}
{phang2}{cmd:. graph combine ICC_s_q8q9 IESF_s_q8q9}{p_end}

{pstd}
Create TESF plot for all items used in the current {helpb uirt} run{p_end}
{phang2}{cmd:. uirt_esf *, tesf}{p_end}


{marker results}{...}
{title:Stored results}

{pstd}
{cmd:uirt_esf} does not store anything in {cmd:r()}.


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
