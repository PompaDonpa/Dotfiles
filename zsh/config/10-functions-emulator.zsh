# ░░▒▒▓▓▓████▓▓▓▒▒░░
#     EMULATOR
# ░░▒▒▓▓▓████▓▓▓▒▒░░

function screenshot() {
  adb exec-out screencap -p > $1
}

function ecco() { 
  adb shell su 0 setprop gsm.sim.operator.iso-country "$1"
}

function epush() {
  adb push "$1" /sdcard/Download/
}

function 2fa() {
  adb shell input text Lk@jLpnMF3
  adb shell input keyevent 66 
}

function put() {
  adb shell input text $1
}

function ok() {
  adb shell input keyevent 66
}
