if status is-interactive
    # fish_helix_key_bindings 2>/dev/null
    set -g fish_greeting
    set -g async_prompt_functions _pure_prompt_git

    atuin init fish | source
    zoxide init --cmd j fish | source

    set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense'
    carapace _carapace | source
end

# pnpm
set -gx PNPM_HOME "/home/greeed/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
