{smcl}
{* *! version 1.1 2022.01.24}{...}
{viewerjumpto "Title" "uirt_icc##title"}{...}
{viewerjumpto "Syntax" "uirt_icc##syntax"}{...}
{viewerjumpto "Description" "uirt_icc##description"}{...}
{viewerjumpto "Options" "uirt_icc##optionssec"}{...}
{viewerjumpto "Examples" "uirt_icc##examples"}{...}
{viewerjumpto "Stored results" "uirt_icc##results"}{...}
{viewerjumpto "Author" "uirt_icc##author"}{...}
{viewerjumpto "Also see" "uirt_icc##alsosee"}{...}
{cmd:help uirt_icc}{right: ({browse "https://doi.org/10.1177/1536867X221106368":SJ22-2: st0670})}
{hline}

{marker title}{...}
{title:Title}

{p2colset 5 17 19 2}{...}
{p2col :{cmd:uirt_icc} {hline 2}}Postestimation command of {help uirt} to
create intraclass correlation coefficient plots and perform graphical item-fit analysis{p_end}


{marker syntax}{...}
{title:Syntax}

{p 8 17 2}
{cmd:uirt_icc} [{varlist}] [{cmd:,} {it:{help uirt_icc##options:options}}]

{pstd}
{it:varlist} must include only variables that were declared in the main list
of items of the current {cmd:uirt} run.  If {it:varlist} is skipped or an
asterisk ({cmd:*}) is used, {cmd:uirt_icc} will plot intraclass correlation
coefficient (ICC) graphs for all items declared in the main list of items of
the current {cmd:uirt} run.

{synoptset 18}{...}
{marker options}{...}
{synopthdr}
{synoptline}
{synopt:{opt bins(#)}}number of ability intervals for observed proportions;
default is {cmd:bins(100)}{p_end}
{synopt:{opt noo:bs}}suppress plotting observed proportions{p_end}
{synopt:{opt pv}}use plausible values (PVs) to compute observed proportions; default is to use numerical integration{p_end}
{synopt:{opt pvbin(#)}}number of PVs in each bin; default is
{cmd:pvbin(10000)}{p_end}
{synopt:{opt c:olors(str)}}list of colors to override default colors of ICC lines{p_end}
{synopt:{opth tw(twoway_options)}}{cmd:graph twoway} options to override default graph layout{p_end}
{synopt:{opt f:ormat(str)}}file format for ICC graphs ({cmd:png}, {cmd:gph},
or {cmd:eps}); default is {cmd:format(png)}{p_end}
{synopt:{opt pref:ix(str)}}set the prefix of filenames{p_end}
{synopt:{opt suf:fix(str)}}set the suffix of filenames{p_end}
{synopt:{opt cl:eargraphs}}suppress storing of graphs in Stata memory{p_end}
{synoptline}


{marker description}{...}
{title:Description}

{pstd}
{cmd:uirt_icc} is a postestimation command of {helpb uirt} that creates ICC
graphs accompanied with information that aids graphical item-fit analysis.
The graphs are saved in the current working directory.  Note that if ICC
graphs for requested items are already saved in the working directory under
default names, they will be overwritten.  If you do not want to overwrite
previous ICCs, change the working directory, rename the existing files, or use
the {cmd:prefix()} or {cmd:suffix()} option.

{pstd}
The default behavior of {cmd:uirt_icc} is to superimpose observed proportions
against the ICC curves to enable a graphical item-fit assessment.  The
observed proportions are computed after quantile-based division of the
distribution of the latent variable.  Item response of a single person is
included simultaneously into many intervals (bins) of theta with probability
proportional to the density of an a posteriori latent trait distribution of
that person in each bin.  The default method uses definite numerical
integration, but after you add the option {opt pv}, PVs will be employed to
achieve this task.  Plotting observed proportions is controlled by
{cmd:bins()} and {opt pvbin()}; it can also be turned off by {opt noobs}.  The
default look of graphs can be overridden by options {opt colors()} and
{cmd:tw()}.


{marker optionssec}{...}
{title:Options}

{phang}
{opt bins(#)} sets the number of intervals into which the distribution of
ability is split when calculating observed proportions of responses.  The
default is {cmd:bins(100)}.

{phang}
{opt noobs} suppresses plotting observed proportions.

{phang}
{opt pv} changes the default method of computing observed proportions from
definite numerical integration to Monte Carlo integration with unconditioned
PVs.  It involves more CPU time, introduces variance due to sampling of PVs,
but accounts for the uncertainty in estimation of item response theory model
parameters.

{phang}
{opt pvbin(#)} sets the number of PVs used for computing observed proportions
of responses within each interval of theta.  The default is
{cmd:pvbin(10000)}.

{phang}
{opt colors(str)} is used to override the default Munsell color system used
for ICC lines.  A list of color names separated by spaces is required.  The
first color in the list applies to the pseudoguessing parameter of the
three-parameter logistic model -- it must be declared even if no
three-parameter logistic model items are in the model.

{phang}
{opth tw(twoway_options)} is used to add user-defined {cmd:graph twoway}
options to override the default graph layout, like {opt xtitle()} or
{cmd:scheme()}, etc.

{phang}
{opt format(str)} specifies the file format in which the ICC graphs are saved
({cmd:png}, {cmd:gph}, or {cmd:eps}).  The default is {cmd:format(png)}.  This
option also influences the graphs created after asking for differential item
functioning analysis.

{phang}
{opt prefix(str)} is used to define a string that is added at the beginning of
the names of saved files.  The default is {cmd:prefix(ICC)}.

{phang}
{opt suffix(str)} adds a user-defined string at the end of the names of saved
files.  The default behavior is not to add any suffix.

{phang}
{opt cleargraphs} is used to suppress the default behavior of storing all ICC
graphs in Stata memory.  After you specify this, all graphs are still saved in
the current working directory, but only the last graph is active in Stata.


{marker examples}{...}
{title:Examples}

{pstd}Setup{p_end}
{phang2}{cmd:. webuse masc1}{p_end}

{pstd}
Fit an item response theory model using all items in the dataset with default
settings of {helpb uirt}{p_end}
{phang2}{cmd:. uirt q*}{p_end}

{pstd}
Create ICC graphs for all items used in the above command -- these will be
stored as {cmd:.png} files in current working directory{p_end}
{phang2}{cmd:. uirt_icc}{p_end}

{pstd}
Create ICC graph only for item {cmd:q1}, change graph title, the name of
{it:x} axis, and the color of the ICC line, and add suffix {cmd:xx} at the end
of filename{p_end}
{phang2}{cmd:. uirt_icc q1, tw(title(ICC graph for item 1) xtitle(My preferred name for {&theta} variable)) color(any_for_c green) suffix(xx)}{p_end}


{marker results}{...}
{title:Stored results}

{pstd}
{cmd:uirt_icc} does not store anything in {cmd:r()}.


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
