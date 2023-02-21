# uirt
Stata module to fit unidimensional Item Response Theory models

# Description
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


# Installation - latest version

To install the latest version:
```commandline
net install uirt, from(https://raw.githubusercontent.com/bkondratek/uirt/uirt_latest/) replace
```
After installation, type:
```commandline
h uirt
```
to see a detailed help and examples.

# Installation - other sources and versions
You can always install ```uirt``` from ssc:
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

For your convenience, the SSC package is also available [here](https://github.com/bkondratek/uirt/tree/main/ssc_version)
and the SJ package is available [here](https://github.com/bkondratek/uirt/tree/main/sj_version).

# Suggested citation
Kondratek, B. (2022). uirt: A command for unidimensional IRT modeling. 
_The Stata Journal_, 22(2), 243-268. https://doi.org/10.1177/1536867X221106368

# Acknowledgement
I wish to thank Cees Glas who provided me with invaluable 
consultancy on many parts of the estimation algorithms used in ```uirt```
and Mateusz Zoltak for very helpful hints on Mata
pointers which led to significant boost in efficiency of ```uirt```. 
Many thanks to all of my colleagues at the Institute of Educational Research in Warsaw 
for using ```uirt``` at the early stages of its development and providing me with feedback 
and encouragement to continue with this endeavor. I am also grateful to numerous Stata users 
who contacted me with ideas on how to improve the software after its first release. 
I feel especially indebted to Eric Melse, for his support in building postestimation commands 
that allow for plotting information functions and expected score curves. 
Last but not least, I would like to thank the anonymous Reviewer at the Stata Journal, 
who had guided me on how to rewrite ```uirt``` to make it more user friendly 
and more aligned with Stata programming standards.
