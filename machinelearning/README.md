This environment assumes the base environment,
with additional jupyter and ipython installed.

Then adds:

conda create --name machinelearning python=3.14 -y
conda activate machinelearning 
conda install -c conda-forge ^
      xgboost ^
      lightgbm ^
      catboost ^
      tensorflow ^
      keras ^
      pytorch ^
      -y
