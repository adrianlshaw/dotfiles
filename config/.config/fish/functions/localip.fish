function localip
        ifconfig | grep inet | grep broadcast | awk { printf( $2 \n) } $argv;
end