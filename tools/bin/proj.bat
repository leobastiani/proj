@ECHO OFF

for %%* in (.) do set projName=%%~nx*

IF [%1] NEQ [] (
	set projName=%*
)


if exist subl (
	subl --project subl\*.sublime-project
	goto:eof
)



rem se tem espaço no nome
SET newProjName=%projName: =. %

if ["%projName%"] NEQ ["%newProjName%"] (
	echo Digite o nome do projeto:
	set /p projName=
)


if not exist subl (
	mkdir subl
)

pushd subl

echo.^{> %projName%.sublime-project
echo.    "folders":>> %projName%.sublime-project
echo.    [>> %projName%.sublime-project
echo.        {>> %projName%.sublime-project
echo.            "path": "..",>> %projName%.sublime-project
echo.            "folder_exclude_patterns":>> %projName%.sublime-project
echo.            [>> %projName%.sublime-project
echo.                "subl",>> %projName%.sublime-project
echo.            ]>> %projName%.sublime-project
echo.        }>> %projName%.sublime-project
echo.    ],>> %projName%.sublime-project
echo.^}>> %projName%.sublime-project

popd

subl --project subl\%projName%.sublime-project