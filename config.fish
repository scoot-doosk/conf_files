
if status is-interactive

    # PATH configuration
    fish_add_path /opt/homebrew/bin
    fish_add_path /opt/homebrew/ruby/bin
    fish_add_path /Users/scottwd/.local/bin
    fish_add_path /Users/scottwd/.local/share/gem/ruby/3.4.0/bin

    # Enable ANSI colors
    set -gx CLICOLOR 1

    # Chrome through Princeton SSH SOCKS proxy
    function proxy
        set -l proxy_host csesbh2.princeton.edu
        set -l proxy_port 8888

        ssh -D $proxy_port -f -C -q $proxy_host 'sleep 15'

        "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
            --proxy-server="socks5://127.0.0.1:$proxy_port" \
            --host-resolver-rules="MAP * 0.0.0.0 , EXCLUDE localhost" \
            --user-data-dir="$HOME/Library/Application Support/Google/Chrome/ProxiedProfile" &
    end

    # Chrome through colo SSH SOCKS proxy
    function proxy_colo
        set -l proxy_host tiger3-nfs
        set -l proxy_port 9999

        ssh -D $proxy_port -f -C -q $proxy_host 'sleep 15'

        "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
            --proxy-server="socks5://127.0.0.1:$proxy_port" \
            --host-resolver-rules="MAP * 0.0.0.0 , EXCLUDE localhost" \
            --user-data-dir="$HOME/Library/Application Support/Google/Chrome/ProxiedProfile" &
    end

end

