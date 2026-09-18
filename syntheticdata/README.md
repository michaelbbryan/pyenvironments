# syntheticdata

This folder provides the environment.yml and requirements.txt files for generating a python environment
that includes popular packages for generating synthetic datasets.



Notes:

* the sdv pacakge installation will need a C++ compiler. For Windows, that would come from VS build tools named "Desktop development with C++".
* It will also require pytorch.



conda install -c pytorch -c conda-forge sdv -y

