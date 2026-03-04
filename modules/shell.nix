{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    histSize = 100000;

    ohMyZsh = {
      enable = true;
      plugins = [ "git" ];
    };

    interactiveShellInit = ''
      autoload -U promptinit; promptinit
      # Hook direnv
      eval "$(direnv hook zsh)"
      # Starship prompt
      eval "$(starship init zsh)"
    '';
  };

  environment.systemPackages = with pkgs; [
    starship
    direnv
  ];
}
