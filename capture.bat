::
:: For the requested python environment, this captures the env.yml and reqs.txt  pyenvironment files
::

@echo off

:: Check if argument 1 is missing
if "%~1"=="" (
    echo Error: Argument is missing.
    echo Usage: %~nx0 ^<environment name^>
    exit /b 1
)

SETLOCAL
set "envname=%~1"

call conda activate %envname%
cd %envname%
pip list --format=freeze > requirements.txt
conda env export -n %envname% > environment.yml
cd ..

ENDLOCAL
@echo done
@echo on