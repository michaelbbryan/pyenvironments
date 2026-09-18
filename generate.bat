::
:: Creates a python environment from the pyenvironment files
::     and installs it into the ipython kernel for work in Jupyter
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

echo Generating environment: %envname%

:: The requested environment should not exist, so activating it should throw and error.
call conda activate %envname% >nul 2>nul
if errorlevel 1 (
    @echo Creating %envname% environment
    cd %envname%
    call conda env create -n %envname% -f environment.yml 
    call conda activate %envname% 
    call ipython kernel install --user --name=%envname% 
    call conda activate base 
    cd ..
  ) else (echo Environment %envname% already exists)

ENDLOCAL
@echo done
