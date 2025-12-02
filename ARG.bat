@echo off
 chcp 1251 > nul
setlocal enabledelayedexpansion

:start
echo Введите текст:
set /p input=

echo !input! | find /i "детство" > nul
if !errorlevel! equ 0 (
    REM 

    REM Загружаем содержимое файла Data.txt по новой ссылке напрямую. -s отключает вывод прогресса загрузки.
    curl -s -o Data.txt "https://raw.githubusercontent.com/stanislavgrachev12-hub/my-data/main/Data.txt"

    REM Проверяем, успешно ли загружен файл.
    if exist Data.txt (
        REM Успешно загружен.  Отключаем echo, чтобы вывести только текст файла.
        @echo off
        type Data.txt
	echo напиши это стасу
        @echo on

        REM Удаляем скачанный файл, чтобы не засорять диск.
        del Data.txt
    ) else (
        REM Не удалось загрузить файл, вероятно, отсутствует curl или проблемы с сетью.
        echo Ошибка при загрузке Data.txt. Проверьте curl и подключение к сети.
    )

) else (
    REM Слово не найдено
    echo Слово не найдено.
)

pause
goto start


endlocal
