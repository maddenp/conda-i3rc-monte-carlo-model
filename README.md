# i3rc-monte-carlo-model

A [conda](https://conda.io/en/latest/) packaging of the [the I3RC Community Monte Carlo Radiative Transfer Model](https://github.com/RobertPincus/i3rc-monte-carlo-model). The license of the original code is in effect.

Instructions:

1. Install [Miniconda](https://docs.conda.io/en/latest/miniconda.html).
2. Install conda build tools: `conda install -y conda-build conda-verify`.
3. Build the code: `conda build -c conda-forge --override-channels --error-overlinking recipe`.
4. Create an environment: `conda create -y -n i3rc -c local -c conda-forge --override-channels i3rc-monte-carlo-model`.
5. Activate environment: `conda activate i3rc`.
6. Run `MakeMieTable`, `PhysicalPropertiesToDomain`, or `OpticalPropertiesToDomain`.
