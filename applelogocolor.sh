#!/bin/bash

GRE='32'
YEL='33'
ORA='38;5;208'
RED='31'
PUR='35'
BLU='34'

GREEN='\033[00;32m'
YELLOW='\033[01;33m'
ORANGE='\033[00;38;5;208m'
Red='\033[00;31m'
PURPLE='\033[00;35m'
BLUE='\033[00;34m'
WHITEBOLD='\033[00;1;37m'
WHITE='\033[00;37m'
NC='\033[0m' # No Color

#MacCPU="$(sysctl -a | grep 'machdep.cpu.brand_string:' | awk -F ': ' '{print $2}')"
MacCPU="$(sysctl -n machdep.cpu.brand_string)"
MacUp="$(uptime | awk '{print "up", $3, ($4 == "min," ? "minutes" : ($4 == "mins," ? "minutes" : "days"))}')"
MacRes="$(system_profiler SPDisplaysDataType | awk '/Resolution:/ {print $2, $3, $4, $5, $6, $7}')"
MacDis="$(system_profiler SPDisplaysDataType | awk '/Display Type:/ {print $4, $5, $6, $7}')"
MacPack="$(pkgutil --pkgs | wc -w | awk '{print $1}')"
MacShell="$(zsh --version | awk '{print $1, $2}')"
MacDrive="$(diskutil list | awk '/0:/ {print $3, $4; exit}')"
MacCores="$(sysctl -n hw.ncpu)"
MacRam="$(sysctl -n hw.memsize | awk '{size=$1/1024/1024/1024; printf "%.2f GB\n", size}')"
MacBattery="$(pmset -g batt | awk 'END{ sub(";", ""); print $3 }')"
Date="$(date +"%A, %B %d, %Y")"
Time="$(date +"%I:%M:%S %p")"
Squares="$(echo -e "${GREEN}████${YELLOW}████${ORANGE}████${Red}████${PURPLE}████${BLUE}████")"
Bar="${GREEN}---${YELLOW}----${ORANGE}----${Red}----${PURPLE}----${BLUE}---"
# ASCII art

# Function to print colored text
print_color() {
  local color=$1
  shift
  echo -e "\033[${color}m$@\033[0m"
}



print_color "$GRE" "                         .8""                      ${WHITEBOLD}User: ${WHITE}$(whoami)"
print_color "$GRE" "                       .888""                      $Bar"
print_color "$GRE" "                     .8888""                       ${WHITEBOLD}OS: ${WHITE}$(sw_vers -productName) Monterey"
print_color "$GRE" "                    .8888""                        ${WHITEBOLD}Host: ${WHITE}$(hostname)"
print_color "$GRE" "                    888""                          ${WHITEBOLD}Kernel: ${WHITE}$(uname -rs)"
print_color "$GRE" "                    88""                           ${WHITEBOLD}Uptime: ${WHITE}$MacUp"
print_color "$GRE" "       .88888888888. .88888888888.""               ${WHITEBOLD}Packages: ${WHITE}$MacPack"
print_color "$GRE" "    .8888888888888888888888888888888.""            ${WHITEBOLD}Shell: ${WHITE}$MacShell"
print_color "$GRE" "  .8888888888888888888888888888888888.""           ${WHITEBOLD}CPU: ${WHITE}$MacCPU"
print_color "$YEL" " .&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&""              ${WHITEBOLD}Display: ${WHITE}$MacDis"
print_color "$YEL" " &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&""                ${WHITEBOLD}Resolution: ${WHITE}$MacRes"
print_color "$YEL" " &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&""                 ${WHITEBOLD}Storage: ${WHITE}$MacDrive"
print_color "$ORA" " @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:""                 ${WHITEBOLD}Core Count: ${WHITE}$MacCores"
print_color "$ORA" " @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:""                 ${WHITEBOLD}Memory: ${WHITE}$MacRam"
print_color "$ORA" " @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:""                 ${WHITEBOLD}Battery: ${WHITE}$MacBattery"
print_color "$RED" " %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.""                ${WHITEBOLD}Date: ${WHITE}$Date"
print_color "$RED" " %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.""               ${WHITEBOLD}Time: ${WHITE}$Time"
print_color "$RED" "  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.""             ${WHITEBOLD}IP: ${WHITE}$(ipconfig getifaddr en0)"
print_color "$PUR" "   00000000000000000000000000000000000""           $Bar"
print_color "$PUR" "    000000000000000000000000000000000"
print_color "$PUR" "     0000000000000000000000000000000""             ${WHITEBOLD}Apple Inc. ${WHITE}All rights reserved."
print_color "$BLU" "       ###########################"
print_color "$BLU" "         #######################""                 $Squares"
print_color "$BLU" "           #########^^########""                   $Squares"