# Colors
Blue='\e[00;34m'
White='\e[00;37m'
Red='\e[00;31m'
BoldRed='\e[01;31m'
Green='\e[00;32m'
Yellow='\e[00;33m'
Reset='\e[00m'
##############

TitleColor=${Blue}

# python binaries
Pybin=($(find . -name '*.pyc' -type f))

# tilde binaries
Tilbin=($(find . -name '*.bg.w' -o -name '*.ew' -o -name '*.kbi' -o -name '*.kbj' -type f))

# Temporary files
TMP=($(find . -name '*.py~' -o -name '*.swp' -type f))

# Display files to be deleted
#echo "List of files to be deleted:"

if [ ${#Pybin[@]} != "0" ]; then
    printf "\n${TitleColor}Python Binary Files:${Reset}\n"
    printf '%s\n' "${Pybin[@]}"
fi

if [ ${#Tilbin[@]} != "0" ]; then
    printf "\n${TitleColor}TILDE Binary Files:${Reset}\n"
    printf '%s\n' "${Tilbin[@]}"
fi

if [ ${#TMP[@]} != "0" ]; then
    printf "\n${TitleColor}Temporary Files:${Reset}\n"
    printf '%s\n' "${TMP[@]}"
fi


# Total number of files to be deleted
Total=$((${#Pybin[@]}+${#Tilbin[@]}+${#TMP[@]}))

# Ask confirmation for deletion / echo repo is clean
if [ ${Total} -gt 0 ]; then
    
    printf "\n${Red}Total files to be deleted: %d${Reset}\n" "${Total}"
    
    echo "Do you wish to delete all the listed files?"
    select yn in "Yes" "No"; do
        case $yn in
            Yes ) 
                find . -name '*.pyc' -type f -delete
                find . \( -name '*.bg.w' -o -name '*.ew' -o -name '*.kbi' -o -name '*.kbj' \) -type f -delete
                find . -name '*.py~' -o -name '*.swp' -type f -delete
                break;;
            No ) exit;;
        esac
    done
else
    echo -e "${Green}Repository is clean!${Reset}"
fi
