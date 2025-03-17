complete -c winemaker -l nobanner -d 'Don\'t use banner'
complete -c winemaker -l backup -d 'Use backup'
complete -c winemaker -l nobackup -d 'Don\'t use backup'
complete -c winemaker -l nosource-fix -d 'Perform source fixing'

complete -c winemaker -l lower-all -d 'Transform everything to lowercase'
complete -c winemaker -l lower-uppercase -d 'Transform uppercase to lowercase'
complete -c winemaker -l lower-none -d 'Don\'t transform uppercase to lowercase'
complete -c winemaker -l lower-include -d 'Transform uppercase to lowercase when no referenced file found'
complete -c winemaker -l nolower-include -d 'Don\'t transform uppercase to lowercase when no referenced file found'

complete -c winemaker -l guiexe -d 'Treat unknown app as GUI app'
complete -c winemaker -l windows -d 'Treat unknown app as GUI app'
complete -c winemaker -l cuiexe -d 'Treat unknown app as console app'
complete -c winemaker -l console -d 'Treat unknown app as console app'
complete -c winemaker -l dll -d 'Treat unknown app as library'

complete -c winemaker -l nodlls -d 'Don\'t use standard libraries'
complete -c winemaker -l mfc -d 'Use MFC based targets'
complete -c winemaker -l nomfc -d 'Use MFC based targets'
complete -c winemaker -l nomsvcrt -d 'Don\'t use msvcrt compilation'

complete -c winemaker -o Dmacro -r -d 'Add macro'
complete -c winemaker -o Idir -r -d 'Add to include path'
complete -c winemaker -o Pdir -r -d 'Add to dll path'
complete -c winemaker -o idll -d 'Add Winelib to import'
complete -c winemaker -o Ldir -r -d 'Add to library path'
complete -c winemaker -o llibrary -r -d 'Link library'

complete -c winemaker -l interactive -d 'Use interactive mode'
complete -c winemaker -l single-target -r -d 'Use single target name'
complete -c winemaker -l generated-files -d 'Generate Makefile'
complete -c winemaker -l nogenerated-files -d 'Don\'t generate Makefile'
complete -c winemaker -l wine32 -d 'Use 32-bit target'
