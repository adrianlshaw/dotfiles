function sloc
        find . -name \*.c\ -print | xargs wc -l  $argv;
end