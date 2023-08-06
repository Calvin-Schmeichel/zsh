#!/bin/bash

# ASCII art
cat << "EOF"
   _    ____  ___  _ ____    _____ _   _ _   _  ____ _____ 
  / \  |  _ \|  \/  |  _ \  |_   _| | | | \ | |/ ___| ____|
 / _ \ | |_) | |\/| | | | |   | | | | | |  \| | |   |  _|  
/ ___ \|  __/| |  | | |_| |   | | | |_| | |\  | |___| |___ 
/_/   \_\_|   |_|  |_|____/    |_|  \___/|_| \_|\____|_____|

EOF


# Text to the right (replace with the command output)
text_to_right=$(sysctl -a | grep 'machdep.cpu.brand_string:' | awk -F ': ' '{print $2}')
echo -e "\033[6;68H$text_to_right"