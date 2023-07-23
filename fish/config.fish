#!/usr/bin/fish

set -gx PATH $PATH "/home/joe/.cargo/bin" "/home/joe/.local/bin"
set -gx IDF_PATH "/opt/esp/esp-idf"
set -gx EDITOR "nvim"
set -gx LESS "-R"
set -gx N_PREFIX "/home/joe/.local" 
set -gx CONAN_USER_HOME "/home/joe/.config" 

starship init fish | source
