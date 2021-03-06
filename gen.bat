::@echo off

for /d %%d in (base geotools machinelearning naturallanguage financialmarkets) do (
  conda activate %%d
  if errorlevel 0 (
    echo %%d
    cd %%d
    pip freeze > requirements.txt
    conda env export > environment.yml
    cd ..
    )
  )

