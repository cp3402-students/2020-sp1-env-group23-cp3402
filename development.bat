@ECHO OFF
SET batch_path=%~dp0
SET theme_name=2020-sp1-project-group23-cp3402
echo Getting Theme...
IF NOT EXIST "%batch_path%public\wp-content\themes\%theme_name%" (
	IF NOT EXIST "%batch_path%public\wp-content\themes" mkdir "%batch_path%public\wp-content\themes"
	git clone https://github.com/cp3402-students/2020-sp1-project-group23-cp3402.git "%batch_path%public\wp-content\themes\%theme_name%"
	mklink /J "%batch_path%%theme_name%" "%batch_path%public\wp-content\themes\%theme_name%"
)
cls
echo Starting Vagrant Environment...
vagrant up
cls
IF EXIST "%batch_path%public\wp-content\themes\%theme_name%\package.json" (
    npm --version >nul 2>&1 && ( 
        cd %batch_path%public\wp-content\themes\%theme_name%
        echo Installing Packages @ %batch_path%public\wp-content\themes\%theme_name%...
        npm i gulp-cli -g
        npm i
        cls
        echo Watching For Theme [%theme_name%] Changes!
        gulp watch
     ) || ( 
        echo NodeJS is Required
      )
) ELSE (
    echo Theme Doesn't Require Watcher: %theme_name%
)
pause