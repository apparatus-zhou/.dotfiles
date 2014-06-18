alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias l='ls -l'
alias ll='ls -ahlF'

alias df='df -h'
alias lg='ll | grep'
alias pg='ps aux | grep'

alias tmuxa='tmux a || tmux'

alias rmds='find . -name ".DS_Store" -delete'
alias rmpyc='find . -name "*.pyc" -delete'

alias psslocal='pkill -f "sslocal"; cd ~/utils/shadowsocks/; nohup sslocal 1>/dev/null 2>&1 &'

alias xld='xllx download --continue --delete'
alias xll='xllx list --speed --progress'

alias ce='cd ~/workspace/eleme'
alias cdweb='cd ~/workspace/web;'
alias cdwalle='cd ~/workspace/walle;'
alias cdnapos='cd ~/workspace/napos;'

alias cdze='cd ~/workspace/zeus2'
alias cdri='cd ~/workspace/riddick'
alias cdpi='cd ~/workspace/pit-lord'
alias cdj='cd ~/workspace/javis'
alias cdop='cd ~/workspace/openerp'
alias cdsp='cd ~/workspace/spectre'
alias cdpl='cd ~/workspace/polaris'
alias cdpa='cd ~/workspace/test_pandas'

alias redis-server='redis-server /usr/local/etc/redis.conf'

alias gup='git pull --rebase'

alias sbs='sudo brew services'
alias pys='python -m SimpleHTTPServer'

alias riddickup='uwsgi --enable-threads -w riddick.run:app --master --processes 4 -s :3031'
