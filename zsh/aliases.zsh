#Miscellaneous aliases
alias reload!='. ~/.zshrc'
alias load-aliases='source ~/.zshrc'
alias edit-aliases='edit ~/.dotfiles/zsh/aliases.zsh'
alias cls='clear' # Good 'ol Clear Screen command
alias edit='subl' # Opens any file in sublime editor
alias gatling='/usr/local/lib/gatling-charts-highcharts-bundle-3.0.0-RC2/bin/gatling.sh'
alias myip='ipconfig getifaddr en0'
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
alias dotfiles="cd ~/.dotfiles"
alias disable-sleep="sudo pmset -a disablesleep 1"
alias enable-sleep="sudo pmset -a disablesleep 0"

#Finder aliases
alias f='open -a Finder ./' # Opens current directory in MacOS Finder
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

#Git aliases
alias ga='git add -p'
alias go='git checkout'
alias gs='git status'
alias gb='git branch --all'
alias gd='git branch -D'
alias gr='git reset HEAD'
alias gc='git commit'
alias git-clean='git remote prune origin && git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias push='git push'
alias new-push='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias pull='git pull'

#Elasticsearch aliases
alias delete-es='curl -XDELETE '\''http://localhost:9200/_all'\'''
alias start-es='brew services start elasticsearch'
alias stop-es='brew services stop elasticsearch'

#Rabbitmq aliases
alias start-rabbit='brew services start rabbitmq'
alias stop-rabbit='brew services stop rabbitmq'

#Postgres aliases
alias start-pg='brew services start postgresql'
alias stop-pg='brew services stop postgresql'

#kubernetes aliases
alias kpods='kubectl get pods'
alias klogs='kubectl logs'
function kexec(){
  kubectl exec -ti $1 -- bash
}
function set-namespace(){
  kubectl config set-context --current --namespace=$1
}
function set-cluster(){
  aws eks update-kubeconfig --profile vhtxdev --name $1-eks-cluster
}
function kboard(){
  kubectl proxy & kubectl get secret --namespace kube-system $(kubectl -n kube-system get secret | grep eks-admin | awk '{print $1}') -o jsonpath="{.data.token}" | base64 --decode | pbcopy  && sleep 2 && open 'http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#!/login' && fg
}

