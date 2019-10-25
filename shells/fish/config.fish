# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

alias matlab='env _JAVA_AWT_WM_NONREPARENTING=1 matlab -nodesktop -nosplash'
