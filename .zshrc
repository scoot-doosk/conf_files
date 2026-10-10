#put homebrew in path
path+=('/Users/scottwd/.local/share/gem/ruby/3.4.0/bin')
path+=('/opt/homebrew/bin')
path+=('/Users/scottwd/.local/bin')


#function to start chrome but proxy through tunnel
proxy() {
  PROXY_HOST=csesbh2.princeton.edu
  PROXY_PORT=8888
  ssh -D $PROXY_PORT -f -C -q $PROXY_HOST 'sleep 15'
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
    --proxy-server="socks5://127.0.0.1:$PROXY_PORT" \
    --host-resolver-rules="MAP * 0.0.0.0 , EXCLUDE localhost" \
    --user-data-dir="/Users/scottwd/Library/Application Support/Google/Chrome/ProxiedProfile" &
}

proxy_colo() {
  PROXY_HOST=tiger3-nfs
  PROXY_PORT=9999
  ssh -D $PROXY_PORT -f -C -q $PROXY_HOST 'sleep 15'
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
    --proxy-server="socks5://127.0.0.1:$PROXY_PORT" \
    --host-resolver-rules="MAP * 0.0.0.0 , EXCLUDE localhost" \
    --user-data-dir="/Users/scottwd/Library/Application Support/Google/Chrome/ProxiedProfile" &
}



#enable ansi colors
export CLICOLOR=1
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/ruby/bin:$PATH"
