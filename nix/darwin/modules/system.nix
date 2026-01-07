{pkgs, ...}: {
  system = {
    primaryUser = "dante";
    stateVersion = 5;
    defaults = {
      dock = {
        autohide = true;
        launchanim = false;
      };
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        AppleICUForce24HourTime = true;
        _HIHideMenuBar = true;
      };
      screencapture.location = "~/Pictures/screenshots";
    };
  };
  security.pam.services.sudo_local.touchIdAuth = true;
}
