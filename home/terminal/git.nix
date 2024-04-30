{
  programs.git = {
    enable = true;
    userName = "mham";
    userEmail = "warofzen1@proton.me";
    extraConfig = {
      init.defaultBranch = "main";

      gpg = {
        format = "ssh";
        # ssh.defaultKeyCommand = "sh -c 'echo key::$(ssh-add -L | head -1)'";
      };
      commit.gpgsign = true;

      commit.verbose = true;
      diff.algorithm = "histogram";
      log.date = "iso";
      column.ui = "auto";
      branch.sort = "committerdate";
      # Automatically track remote branch
      push.autoSetupRemote = true;
      # Reuse merge conflict fixes when rebasing
      rerere.enabled = true;

      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
    ignores = [
      ".direnv"
      "result"
    ];
  };
}
