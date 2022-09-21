# █▓▒░ pick a random number
if [[ "$(uname)" == "Darwin" ]]; then
    _RAND=`gshuf -i1-7 -n1`
else
    _RAND=`shuf -i1-7 -n1`
fi

#█▓▒░ Display <Welcome PompaDonpa> figlet-ascii banner
# https://devhints.io/figlet
case $_RAND in
1)
clear
echo "Welkom PompaDonpa" | figlet -f pepper
;;
2)
clear
echo "Willkommen PompaDonpa" | figlet -f cybermedium
;;
3)
clear
echo "Üdvözöljük PompaDonpa" | figlet -f stampatello
;;
4)
clear
echo "ようこそ PompaDonpa" | figlet -f bell
;;
5)
clear
echo "Welcome PompaDonpa" | figlet -f thin
;;
6)
clear
echo "Välkommen PompaDonpa" | figlet -f rectangles
;;
7)
clear
echo "Bienvenido PompaDonpa" | figlet -f script
;;
esac
