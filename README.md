## uirt
Stata module to fit unidimensional Item Response Theory models

## Table of Contents
[Description](#description)

[Installation](#installation)

[Usage examples](#usage-examples)

[Suggested citation](#suggested-citation)

[Acknowledgement](#acknowledgement)


## Description
```uirt``` can be used to fit a variety of unidimensional IRT models 
(2PLM, 3PLM, GRM, PCM and GPCM). 
It allows for multi-group modelling, DIF analysis, 
and introduces extensive item-fit analysis tools. 
With ```uirt``` you can also generate plausible values (PVs) 
conditioned via latent regression. 

And If you are having trouble with fitting 3PLM to your data, 
```uirt``` will come to help, as it enables imposing priors on parameter estimation.
Alternatively, an automated explorative search for a 3PLM-fitting 
subset of items is also available.

```uirt``` was featured in the Stata Journal
([Kondratek, 2022a](https://doi.org/10.1177/1536867X221106368)). 
Properties of the chi2W item-fit statistic of ```uirt``` 
were investigated against alternative measures
in the APM article ([Kondratek, 2022b](https://doi.org/10.1177/01466216221108061)).

```uirt``` is written mostly in Mata, 
so it requires only Stata 10 to run. 
It was designed to efficiently handle large datasets, 
especially in the multi-group designs. 


## Installation 
### Latest version

To install the latest version:
```commandline
net install uirt, from(https://raw.githubusercontent.com/bkondratek/uirt/) replace
```
After installation, type:
```commandline
h uirt
```
to see a detailed help and examples.

### Other sources and versions
You can always install ```uirt``` from SSC:
```commandline
 ssc install uirt, replace
```
In general, the SSC version should be the same as the latest. 
But there might be a few days lag between the latest version here, 
and the SSC servers.

Should you want the exact ```uirt``` version 
that was used the Stata Journal article:
```commandline
net install st0670, from(http://www.stata-journal.com/software/sj22-2) replace
```

For your convenience, the SSC package is also available
[here](./ssc_version)
and the SJ package is available [here](./sj_version).

## Usage examples
Load example data used in De Boeck & Wilson (2004):
```commandline
webuse masc2
```
Run uirt on default settings 
(one group, 2PLM for 0-1 items, GRM for 0-k items), 
and ask to plot ICC for item ```q6``` using the ```uirt_icc``` 
postestimation command:
```commandline
uirt q*
uirt_icc q6
```

Note that all postestimation commands of ```uirt``` can also be used 
as options, by skipping the 'uirt_' part. 
So, the above example is equivalent to this one-liner:
```commandline
uirt q*, icc(q6)
```

The single-line usage will take less time 
to execute. Though, for the sake of readibility we will make use of 
the postestimation commands in the following examples.

To lear more about ```uirt``` postestimation commands type:
```commandline
help uirt##postestimation
```

Let us continue the analysis using the estimates from previous run 
as starting values. We will now ask that item ```q6``` be 3PLM 
with sub-option 'lrcrit()' turned off. 
We will also format the graph for that item a little:
```commandline
uirt q*,guess(q6,lr(1)) init(prev) 
uirt_icc q6, tw( xtitle(My own name for the {&theta} scale) )
```

The dataset is small and does not provide enough information to support
unconstrained estimation of the pseudo-guessing parameter.
With ```uirt``` we can impose priors on parameters to circumvent this. 

Fitting a 3PLM to all items with beta(5,18) distribution as
prior for the pseudo-guessing parameter to ensure convergence:
```commandline
uirt q*, guess(*, lr(1)) priors(*, c(5,18))
```

Let us now fit a two-group model to this data with ```female``` as
the grouping variable; all items 2PLM. 
After fitting a two-group model we can test item ```q1``` for DIF:
```commandline
uirt q*,gr(female)
uirt_dif q1 
```

If we want to obtain ability estimates, we can ask either
for the point estimates (expected a posteriori, EAP) with their standard
errors of draw a set of plausible values. The plausible values can
(and should) be conditioned by a latent regression. ```uirt``` uses 
the Stata's powerful ```mixed``` command to run the regression part,
so any model supported by it can be used for conditioning.

Example:
```commandline
uirt q*                            // fitting the model using defaults
uirt_theta ,eap                    // point estimates of ability     
uirt_theta ,pv(5) pvreg(i.female)  // set of 5 PVs, conditioned on female
```

Oh, and here are the two graphs created 
when running the previous examples:
```commandline
gr combine  DIF_q1  ICC_q6
```
<img src=".\graphics\example1.png">

Note that each point on the ICC graph (on the right) 
is the observed frequency of correct responses in a percentile group of
the latent distribution. Such a fine grid 
essentially provides us with a nonparametric response curve for that item. 
Thus, by comparing it to the model based curve we can graphically 
assess the item fit.

Should you prefer to perform some statistical test of the item fit, 
```uirt``` includes the SX2 by Orlando and Thissen (2000)
(only 0-1 items and complete data) and the more general chi2W 
by Kondratek ([2022b](https://doi.org/10.1177/01466216221108061)):

```commandline
uirt q*         // fitting the model with defaults
uirt_sx2 *      // SX2 for all items
uirt_chi2w *    // chi2w for all items
```


## Suggested citation
Kondratek, B. (2022). uirt: A command for unidimensional IRT modeling. 
_The Stata Journal_, 22(2), 243-268. https://doi.org/10.1177/1536867X221106368


## Acknowledgement
I wish to thank Cees Glas who provided me with invaluable 
consultancy on many parts of the estimation algorithms 
used in ```uirt``` and [Mateusz Zoltak](https://github.com/zozlak) 
for very helpful hints on Mata
pointers which led to significant boost in efficiency of ```uirt```. 
Many thanks to all of my colleagues at 
the Institute of Educational Research in Warsaw 
for using ```uirt``` at the early stages of its development 
and providing me with feedback 
and encouragement to continue with this endeavor. 

I am also grateful to numerous Stata users 
who contacted me with ideas on how to improve 
the software after its first release. 
I feel especially indebted to Eric Melse, 
for his support in building postestimation commands 
that allow for plotting information functions and expected score curves. 

Last but not least, I would like to thank the anonymous 
Reviewer at the Stata Journal, 
who had guided me on how to rewrite ```uirt``` to make 
it more user-friendly 
and more aligned with Stata programming standards.

Preparation of modules of ```uirt``` related to item-fit analysis 
was funded by the National Science Centre research grant 
number [2015/17/N/HS6/02965](https://projekty.ncn.gov.pl/en/index.php?projekt_id=297185).