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

echo Removing environment: %envname%

:: The requested environment should exist, so activating it should NOT throw an error.

call conda activate %envname% >nul 2>nul
if errorlevel 1 (
    @echo Error: %envname% does not exist!
  ) else (
    call conda env remove --name %envname% -y
    call jupyter kernelspec remove %envname% -y
)

ENDLOCAL
@echo done
