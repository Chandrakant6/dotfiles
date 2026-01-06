#================ User defined ==========#

#===== git aliases =====
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gca='git commit -a -m'
alias gco='git checkout'
alias gb='git branch'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log --oneline --graph --decorate'
alias gp='git push'
alias gpo='git push origin'
alias gpl='git pull'
alias gcl='git clone'

#==== custom alias =====

alias update='sudo apt update && sudo apt upgrade'

alias py='python3'

#==== custom function====

# make dir and cd into it
mkcd(){
	mkdir -p "$1" && cd "$1"
}

# run ollama's tinyllama
#llama() {
#	echo "$" | ollama run phi
#}

clr(){
	clear
	fortune | cowsay -f "$(ls /usr/share/cowsay/cows | shuf -n 1)" | lolcat
}

# list and print toilet fonts
ls_ft(){
	for font_path in /usr/share/figlet/*.tlf; do
		font=$(basename "$font_path" .tlf)
		echo -e "\n=== Font: $font ==="
		toilet -f "$font" "${1:-Hello}"
	done
}

venv(){ # create and activate venv
	python3 -m venv .venv
	source .venv/bin/activate
}

# auto activate and deactivate venv
cd(){
	builtin cd "$@" || return

	if [ -n "$VIRTUAL_ENV" ] && [ ! -f "./.venv/bin/activate" ]; then
		deactivate
	fi
	if [ -f ".venv/bin/activate" ]; then
		source .venv/bin/activate
	fi
}
