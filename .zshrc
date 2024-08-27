### BEGIN INITIALIZTION ===========================================================================
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## Define plugin manager working directory.
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Setup zinit if it isn't already done.
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Custom Configs
MANT_ZCONFIG_HOME="$HOME/.config/zsh"
if [ ! -d "$MANT_ZCONFIG_HOME" ]; then 
    mkdir -p "$(dirname $MANT_ZCONFIG_HOME)"
    touch "$MANT_ZCONFIG_HOME/aliases.zsh"
    touch "$MANT_ZCONFIG_HOME/functions.zsh"
    touch "$MANT_ZCONFIG_HOME/env.zsh"
fi
source "$MANT_ZCONFIG_HOME/aliases.zsh"
source "$MANT_ZCONFIG_HOME/functions.zsh"
source "$MANT_ZCONFIG_HOME/env.zsh"
### END INITIALIZATION ============================================================================

### BEGIN SHELL INTEGRATIONS ======================================================================
eval "$(fzf --zsh)"
### END SHELL INTEGRATIONS ========================================================================

### BEGIN PLUGIN CONFIGS ==========================================================================
## POWERLEVEL10K --------------------------------------------------------------------------------
zinit ice depth=1; zinit light romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## ZSH-COMPLETIONS ------------------------------------------------------------------------------
zinit light zsh-users/zsh-completions
autoload -U compinit && compinit                            # Automatically load completions on startup
zinit cdreplay -q					                        # Recommended by Docs.

## FZF-TAB --------------------------------------------------------------------------------------
zinit light Aloxaf/fzf-tab
zstyle ':completions:*' menu no                             # interactive menu for fuzzy autocompletion
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --icons --color=always $realpath'

## ZSH-SYNTAX-HIGHLIGHTING ----------------------------------------------------------------------
zinit light zsh-users/zsh-syntax-highlighting

## ZSH-AUTOSUGGESTIONS --------------------------------------------------------------------------
zinit light zsh-users/zsh-autosuggestions
# Configure autocompletion history
HISTSIZE=5000                                               # How many commands to save in the history
HISTFILE=~/.zsh_history                                     # where to save the command history
SAVEHIST=$HISTSIZE                                          # save a number of commands equal to the HISTSIZE
HISTDUP=erase                                               # remove duplicate history entries
setopt appendhistory                                        # append to history instead of overwriting
setopt sharehistory                                         # share command history between all sessions
setopt hist_ignore_space                                    # don't store a command if a space precedes it
setopt hist_ignore_all_dups 
setopt hist_save_no_dups
setopt hist_ignore_dups 
setopt hist_find_no_dups
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'      # make history search case-insensitive

### END PLUGIN CONFIGS ============================================================================

### BEGIN SNIPPETS ================================================================================
zinit snippet OMZP::kate
zinit snippet OMZP::pyenv
zinit snippet OMZP::git
zinit snippet OMZP::nmap
zinit snippet OMZP::sudo

### END SNIPPETS ==================================================================================

### BEGIN KEYBINDS ================================================================================
bindkey '^f' autosuggest-accept                 # CTRL f
bindkey '^[' history_search_backward            # CTRL [
bindkey '^]' history_search_forward             # CTRL ]
### END KEYBINDS ==================================================================================
