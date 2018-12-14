@echo off
@cls
@color 3F
@mode con cols=80 lines=20
@title Fix Slow Computer
goto check_Permissions

:check_Permissions
    echo --------------------------------------------------------------------------------
    echo (                             Slow computer fixes                              )
    echo --------------------------------------------------------------------------------
    echo.
    echo.
    echo WARNING: Some of these solutions will not work unless you are an admin!
    echo To run as administrator, right click this file and select "Run an Administrator"
    echo.
    echo Press any key to go to the main menu...
    pause > nul
    goto :mainmenu

:mainmenu
    @title Slow Computer Fixes: Main Menu
    cls
    echo --------------------------------------------------------------------------------
    echo (                                  Main Menu                                   )
    echo --------------------------------------------------------------------------------
    echo.
    echo Options:
    echo  1. Fix 100 percent disk usage (stop DiagTrack)
    echo  2. Stop Windows Update (fix slow Internet and/or computer)
    echo  3. Clear temporary files
    echo  4. Start Disk Cleanup
    echo  X. Exit
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    choice /C 1234X /M "Selection: "
           if %errorlevel% EQU 0 ( goto :mainmenu
    ) else if %errorlevel% EQU 1 ( goto :dtstop
    ) else if %errorlevel% EQU 2 ( goto :updstop
    ) else if %errorlevel% EQU 3 ( goto :deltemp
    ) else if %errorlevel% EQU 4 ( goto :diskclean
    ) else if %errorlevel% EQU 5 ( goto :EOF )

:updstop
    @title Slow Computer Fixes: Stop Windows Update
    cls
    color 3f
    echo --------------------------------------------------------------------------------
    echo (                            Stop Windows Update                               )
    echo --------------------------------------------------------------------------------
    echo.
    echo Stopping services (this might take a minute)...
    net stop bits
    net stop wuauserv
    net stop appidsvc
    net stop cryptsvc
    echo Finished!
    echo.
    echo What next?
    echo 1. Go to the main menu
    echo X. Quit
    choice /C 1X /M "Selection: "
           if %errorlevel% EQU 0 ( goto :mainmenu
    ) else if %errorlevel% EQU 1 ( goto :mainmenu
    ) else if %errorlevel% EQU 2 ( goto :EOF)

:deltemp
    @title Slow Computer Fixes: Deleting Temporary Files
    cls
    color 3f
    echo --------------------------------------------------------------------------------
    echo (                          Delete Temporary Files                              )
    echo --------------------------------------------------------------------------------
    echo.
    echo Deleting system temporary files...
    echo.
    del "%SystemDrive%\Windows\Temp\" /Q > "%userprofile%\AppData\Local\Temp\deltemp.log"
    echo System temporary files deleted!
    echo.
    echo.
    echo Deleting user temporary files...
    del "%tmp%" /Q > "%userprofile%\AppData\Local\Temp\deltemp.log"
    echo User temporary files deleted!
    echo.
    echo All temporary files deleted!
    echo.
    timeout /T 2 /nobreak > nul
    cls
    echo --------------------------------------------------------------------------------
    echo (                                   Finished!                                  )
    echo --------------------------------------------------------------------------------
    echo.
    echo Temporary files have been deleted!
    echo.
    echo What would you like to do next?
    echo  1. View the log
    echo  M. Go to the main menu
    echo  X. Quit
    choice /C 1MX /M "Selection: "
           if %errorlevel% EQU 0 ( goto :mainmenu
    ) else if %errorlevel% EQU 1 ( goto :viewtemplog
    ) else if %errorlevel% EQU 2 ( goto :deltemplog
    ) else if %errorlevel% EQU 3 ( goto :EOF )

:viewtemplog
    @title Slow Computer Fixes: Temporary Files Log
    cls
    echo --------------------------------------------------------------------------------
    echo (                             Temporary Files Log                              )
    echo --------------------------------------------------------------------------------      echo.
    copy "%userprofile%\AppData\Local\Temp\deltemp.log" con
    echo.
    echo What would you like to do next?
    echo  M. Go to the main menu
    echo  X. Quit
    choice /C MX /M "Selection: "
           if %errorlevel% EQU 0 ( goto :mainmenu
    ) else if %errorlevel% EQU 1 ( goto :mainmenu
    ) else if %errorlevel% EQU 2 ( goto :EOF )

:deltemplog
    del "%userprofile%\AppData\Local\Temp\deltemp.log" /Q > nul
    cls
    goto :mainmenu

:dtstop
    @title Slow Computer Fixes: Stopping DiagTrack
    cls
    echo --------------------------------------------------------------------------------
    echo (                               Stop DiagTrack                                 )
    echo -------------------------------------------------------------------------------- 
    echo.
    net start diagtrack > nul 2>&1
    net stop diagtrack
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo What next?
    echo  M. Main menu
    echo  X. Quit
    choice /C MX /M "Selection: "
           if %errorlevel% EQU 0 ( goto :mainmenu
    ) else if %errorlevel% EQU 1 ( goto :mainmenu
    ) else if %errorlevel% EQU 2 ( goto :EOF )

:diskclean
    @title Slow Computer Fixes: Start Disk Cleanup
    cls
    echo --------------------------------------------------------------------------------
    echo (                                Disk Cleanup                                  )
    echo --------------------------------------------------------------------------------
    echo.
    echo Starting Disk Cleanup...
    "C:\Windows\System32\cleanmgr.exe" /dC > nul
    echo.
    echo Disk Cleanup finished!
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo What next?
    echo  M. Main menu.
    echo  X. Quit
    choice /C MX /M "Selection: "
           if %errorlevel% EQU 0 ( goto :mainmenu
    ) else if %errorlevel% EQU 1 ( goto :mainmenu
    ) else if %errorlevel% EQU 2 ( goto :EOF )