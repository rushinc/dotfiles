# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

set fish_greeting

alias vim='vim --servername gvim'
alias matlab='cd $HOME/Documents/MATLAB && env _JAVA_AWT_WM_NONREPARENTING=1 matlab -nodesktop -nosplash'
alias comsol='env GTK_PATH=/usr/lib/gtk-2.0 GTK2_RC_FILES=/home/rushin/.gtkrc-2.0_light comsol'
alias ls='lsd'
