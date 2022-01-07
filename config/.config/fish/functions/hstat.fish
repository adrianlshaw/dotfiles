function hstat
        curl -o /dev/null --silent --head --write-out %{http_code}\n $1 $argv;
end