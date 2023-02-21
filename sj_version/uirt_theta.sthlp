{smcl}
{* *! version 1.1 2022.01.24}{...}
{viewerjumpto "Title" "uirt_theta##title"}{...}
{viewerjumpto "Syntax" "uirt_theta##syntax"}{...}
{viewerjumpto "Description" "uirt_theta##description"}{...}
{viewerjumpto "Options" "uirt_theta##optionssec"}{...}
{viewerjumpto "Examples" "uirt_theta##examples"}{...}
{viewerjumpto "Stored results" "uirt_theta##results"}{...}
{viewerjumpto "Reference" "uirt_theta##reference"}{...}
{viewerjumpto "Author" "uirt_theta##author"}{...}
{viewerjumpto "Also see" "uirt_theta##alsosee"}{...}
{cmd:help uirt_theta}{right: ({browse "https://doi.org/10.1177/1536867X221106368":SJ22-2: st0670})}
{hline}

{marker title}{...}
{title:Title}

{p2colset 5 19 21 2}{...}
{p2col :{cmd:uirt_theta} {hline 2}}Postestimation command of {help uirt} to add
expected a posteriori or plausible values{p_end}


{marker syntax}{...}
{title:Syntax}

{p 8 18 2}
{cmd:uirt_theta} [{it:newvar1} {it:newvar2}] [{cmd:,} {it:{help uirt_theta##options:options}}]

{pstd}
{it:newvar1} and {it:newvar2} are optional.  If specified, the expected a
posteriori (EAP) estimator of theta and its standard error (SE) will be added
at the end of the dataset using {it:newvar1} and {it:newvar2} to name these
new variables.

{synoptset 15}{...}
{marker options}{...}
{synopthdr}
{synoptline}
{synopt:{opt eap}}create EAP estimator of theta and its SE{p_end}
{synopt:{opt nip(#)}}number of Gauss–Hermite quadrature points used when calculating EAP
and its SE; default is {cmd:nip(195)}{p_end}
{synopt:{opt pv(#)}}number of plausible values (PVs) added to the dataset; default
is {cmd:pv(0)} (no PVs added){p_end}
{synopt:{opt pvreg(str)}}define regression for conditioning PVs{p_end}
{synopt:{opt suf:fix(name)}}specify a suffix used in naming of EAP and PVs{p_end}
{synopt:{opt sc:ale(#,#)}}scale parameters ({it:m,sd}) of theta in reference group{p_end}
{synopt:{opt skipn:ote}}suppress adding notes to newly created variables{p_end}
{synoptline}


{marker description}{...}
{title:Description}

{pstd}
{cmd:uirt_theta} is a postestimation command of {helpb uirt} that allows
adding EAP point estimates of theta to the dataset.  Drawing PVs is also
available; conditioning of PVs on ancillary variables is supported.


{marker optionssec}{...}
{title:Options}

{phang}
{opt eap} adds the EAP estimator of theta and its SE at the end of the
dataset.  These will be named {cmd:theta} and {cmd:se_theta} unless
{cmd:suffix()} is specified.  Using {opt eap} is redundant if {it:newvar1} and
{it:newvar2} are provided.

{phang}
{opt nip(#)} sets the number of Gauss-Hermite quadrature points used when
calculating the EAP estimator of theta and its SE.  The default is
{cmd:nip(195)}, which is an obvious overkill, but it does not consume many
resources, while too-low {opt nip()} values may lead to an inadequate estimate
of SEs of EAP.

{phang}
{opt pv(#)} is used to declare the number of PVs that are to be added to the
dataset.  The default is {cmd:pv(0)} (no PVs added).  The PVs will be named
{cmd:pv_1}, ..., {cmd:pv_}{it:#} unless {opt suffix()} is specified.  The PVs
are generated after the estimation is completed.  The general procedure
involves two steps.  In the first step, {it:#} random draws, b*, of model
parameters are taken from a multivariate normal distribution with means vector
{cmd:e(b)} and covariance matrix {cmd:e(V)}.  In the second step, for each
person, {it:#} independent Markov chain Monte Carlo (MCMC) chains are run
according to the procedure described by Patz and Junker (1999), with b*
parameter draws treated as fixed.  Finally, after a burn-in period, each of
the PVs is drawn from a different MCMC chain.  Such a procedure allows
incorporating item response theory (IRT) model uncertainty in PV generation
without the need of multilevel-structured MCMC, thus reducing the
computational expense and avoiding the use of Bayesian priors for item
parameters.  Note that if some of the item parameters were fixed with the
{cmd:fix()} option of {cmd:uirt}, the PVs will not account for the uncertainty
of estimation of these fixed parameters.  Additionally, the {cmd:pvreg()}
option allows modifying the procedure so that it includes conditioning by a
latent regression.

{phang}
{opt pvreg(str)} is used to perform conditioning of PVs on ancillary
variables.  If variables other than the ones used in defining the IRT model
are used in the analyses performed with PVs, these variables need to be
included in the {opt pvreg()} option.  Otherwise, the analyses will produce
effects that are biased toward zero.  The syntax for {opt pvreg()} is the same
as that in defining the regression term in {helpb xtmixed}, for example,
{cmd:pvreg(ses ||school:)}.  Note that multilevel modeling is allowed here.
If {opt pv()} is called without {opt pvreg()} the PVs for all observations
within a group are generated with the same normal prior distribution of
ability with parameters taken from {cmd:e(group_par)}.  By including the
{cmd:pvreg()} option, you modify the procedure of generating PVs in such a way
that after each MCMC step, a regression of the ability on the variables
provided by the user is performed by {cmd:xtmixed}. The {cmd:xtmixed} model
estimates are then used to recompute the priors.  Note that if some
observations are excluded from the {cmd:xtmixed} run (for example, because of
missing cases on any of the regressors), these observations will not be
conditioned.

{phang}
{opt suffix(name)} specifies a suffix used in naming new EAP and PVs
variables.  If {it:newvar1} and {it:newvar2} are provided, they will take
precedence in naming EAP; however, {opt suffix()} will still apply to the PVs.

{phang}
{opt scale(#,#)} is used to change the scale of the latent trait for variables
that are added to the dataset.  By default, the EAP and the PVs are obtained
according to the group parameters that are reported in {cmd:e(group_par)}.
Specifying {opt scale(m,sd)} will rescale the latent trait so that the mean
and the standard deviation in the reference group are {it:m} and {it:sd}.
Note that because {opt scale(m,sd)} acts on the latent trait variable level,
the EAP estimates will most probably have smaller standard deviation in the
reference group than {it:sd} because of shrinkage.

{phang}
{opt skipnote} suppresses adding notes to newly created variables.  The
default behavior is to add notes.


{marker examples}{...}
{title:Examples}

{pstd}Setup{p_end}
{phang2}{cmd:. webuse masc2}{p_end}

{pstd}
Fit an IRT model with default settings of {helpb uirt} using items
{cmd:q1}-{cmd:q9}{p_end}
{phang2}{cmd:. uirt q*}{p_end}

{pstd}
Add EAP point estimate of theta to data and its SE with default
names{p_end}
{phang2}{cmd:. uirt_theta, eap}{p_end}

{pstd}
The same as above, but with user-specified variable names{p_end}
{phang2}{cmd:. uirt_theta my_eap my_se_of_eap}{p_end}

{pstd}
Add 5 unconditioned PVs to data, and use suffix {cmd:uncond} when
naming them{p_end}
{phang2}{cmd:. uirt_theta, pv(5) suffix(uncond)}{p_end}

{pstd}
Add 5 PVs to data, but condition them on the {cmd:female} variable, use suffix
{cmd:cond}, and change scale to m=500 and sd=100{p_end}
{phang2}{cmd:. uirt_theta, pv(5) pvreg(i.female) suffix(cond) scale(500,100)}{p_end}

{pstd}
List contents of notes of newly created variables to inspect the comments that
were added by {cmd:uirt_theta}{p_end}
{phang2}{cmd:. notes list}{p_end}


{marker results}{...}
{title:Stored results}

{pstd}
{cmd:uirt_theta} does not store anything in {cmd:r()}.


{marker reference}{...}
{title:Reference}

{phang}
Patz, R. J., and B. W. Junker. 1999. A straightforward approach to Markov
chain Monte Carlo methods for item response models.
{it:Journal of Educational and Behavioral Statistics} 24: 146–178.
{browse "https://doi.org/10.2307/1165199"}.


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
