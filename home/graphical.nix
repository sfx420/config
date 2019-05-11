{ config, pkgs, lib, ... }:

let
  base00 = "#1d1f21";
  base01 = "#282a2e";
  base02 = "#373b41";
  base03 = "#969896";
  base04 = "#b4b7b4";
  base05 = "#c5c8c6";
  base06 = "#e0e0e0";
  base07 = "#ffffff";
  base08 = "#cc6666";
  base09 = "#de935f";
  base0a = "#f0c674";
  base0b = "#b5bd68";
  base0c = "#8abeb7";
  base0d = "#81a2be";
  base0e = "#b294bb";
  base0f = "#a3685a";

  serif     = "FuraCode Nerd Font";
  sansSerif = "FuraCode Nerd Font";
  monospace = "FuraCode Nerd Font Mono";
in
  {
    imports = [
      ./gtk.nix
      ./sxhkd.nix
    ];

    config = with lib; mkMerge [
      (rec {
        home.file.".themes" = xdg.configFile."themes";

        home.packages = with pkgs; [
          ffmpeg
          font-awesome-ttf
          imagemagick
          mpv
          youtube-dl
        ] ++ (with config.resources.programs; [
          terminal.package
        ]);

        programs.browserpass.enable = true;

        programs.zathura.enable = true;
        programs.zathura.options.completion-bg = base02;
        programs.zathura.options.completion-fg = base0c;
        programs.zathura.options.completion-highlight-bg = base0c;
        programs.zathura.options.completion-highlight-fg = base02;
        programs.zathura.options.default-bg = base00;
        programs.zathura.options.default-fg = base01;
        programs.zathura.options.highlight-active-color = base0d;
        programs.zathura.options.highlight-color = base0a;
        programs.zathura.options.index-active-bg = base0d;
        programs.zathura.options.inputbar-bg = base00;
        programs.zathura.options.inputbar-fg = base05;
        programs.zathura.options.notification-bg = base0b;
        programs.zathura.options.notification-error-bg = base08;
        programs.zathura.options.notification-error-fg = base00;
        programs.zathura.options.notification-fg = base00;
        programs.zathura.options.notification-warning-bg = base08;
        programs.zathura.options.notification-warning-fg = base00;
        programs.zathura.options.recolor = true;
        programs.zathura.options.recolor-darkcolor = base06;
        programs.zathura.options.recolor-keephue = true;
        programs.zathura.options.recolor-lightcolor = base00;
        programs.zathura.options.selection-clipboard = "clipboard";
        programs.zathura.options.statusbar-bg = base01;
        programs.zathura.options.statusbar-fg = base04;

        xdg.configFile."chromium/Default/User StyleSheets/devtools.css".source = ../dotfiles/chromium/devtools.css;
        xdg.configFile."kitty/kitty.conf".text = ''
          background                  ${base00}
          foreground                  ${base05}

          color0                      ${base00}
          color1                      ${base08}
          color2                      ${base0b}
          color3                      ${base0a}
          color4                      ${base0d}
          color5                      ${base0e}
          color6                      ${base0c}
          color7                      ${base05}
          color8                      ${base03}
          color9                      ${base08}
          color10                     ${base0b}
          color11                     ${base0a}
          color12                     ${base0d}
          color13                     ${base0e}
          color14                     ${base0c}
          color15                     ${base07}
          color16                     ${base09}
          color17                     ${base0f}
          color18                     ${base01}
          color19                     ${base02}
          color20                     ${base04}
          color21                     ${base06}

          close_on_child_death        yes
          cursor_blink_interval       0
          cursor_shape                underline
          cursor_stop_blinking_after  0
          editor                      ${config.resources.programs.editor.executable.path}
          font_family                 ${monospace}
          font_size                   ${if pkgs.stdenv.isDarwin then "16.0" else "15.0"}
          hide_window_decorations     ${if pkgs.stdenv.isLinux then "yes" else "no"}
          initial_window_height       800
          initial_window_width        1200
          scrollback_pager            ${pkgs.less}/bin/less --chop-long-lines --RAW-CONTROL-CHARS +INPUT_LINE_NUMBER
          tab_bar_edge                top
        '';
        xdg.configFile."mpv/config".text = ''
          alang=eng,en,rus,ru
        '';
        xdg.configFile."oomox/colors".source = ../dotfiles/oomox/colors;
        xdg.configFile."themes".source = ../dotfiles/themes;

        xresources.properties."*.background" = base00;
        xresources.properties."*.base00" = base00;
        xresources.properties."*.base01" = base01;
        xresources.properties."*.base02" = base02;
        xresources.properties."*.base03" = base03;
        xresources.properties."*.base04" = base04;
        xresources.properties."*.base05" = base05;
        xresources.properties."*.base06" = base06;
        xresources.properties."*.base07" = base07;
        xresources.properties."*.base08" = base08;
        xresources.properties."*.base09" = base09;
        xresources.properties."*.base0A" = base0a;
        xresources.properties."*.base0B" = base0b;
        xresources.properties."*.base0C" = base0c;
        xresources.properties."*.base0D" = base0d;
        xresources.properties."*.base0E" = base0e;
        xresources.properties."*.base0F" = base0f;
        xresources.properties."*.color0" = base00;
        xresources.properties."*.color1" = base08;
        xresources.properties."*.color2" = base0b;
        xresources.properties."*.color3" = base0a;
        xresources.properties."*.color4" = base0d;
        xresources.properties."*.color5" = base0e;
        xresources.properties."*.color6" = base0c;
        xresources.properties."*.color7" = base05;
        xresources.properties."*.color8" = base03;
        xresources.properties."*.color9" = base08;
        xresources.properties."*.color10" = base0b;
        xresources.properties."*.color11" = base0a;
        xresources.properties."*.color12" = base0d;
        xresources.properties."*.color13" = base0e;
        xresources.properties."*.color14" = base0c;
        xresources.properties."*.color15" = base07;
        xresources.properties."*.color16" = base09;
        xresources.properties."*.color17" = base0f;
        xresources.properties."*.color18" = base01;
        xresources.properties."*.color19" = base02;
        xresources.properties."*.color20" = base04;
        xresources.properties."*.color21" = base06;
        xresources.properties."*.cursorColor" = base05;
        xresources.properties."*.foreground" = base05;
        xresources.properties."rofi.auto-select" = false;
        xresources.properties."rofi.color-active" = [ base00 base0b base01 base03 base05 ];
        xresources.properties."rofi.color-normal" = [ base00 base04 base01 base03 base06 ];
        xresources.properties."rofi.color-urgent" = [ base00 base0f base01 base03 base06 ];
        xresources.properties."rofi.color-window" = [ base00 base01 ];
        xresources.properties."rofi.opacity" = 90;
        xresources.properties."ssh-askpass*background" = base00;
        xresources.properties."xscreensaver.logFile" = "/var/log/xscreensaver.log";
        xresources.properties."Xcursor.size" = 20;
        xresources.properties."Xft.antialias" = 1;
        xresources.properties."Xft.autohint" = 0;
        xresources.properties."Xft.hinting" = 1;
        xresources.properties."Xft.hintstyle" = "hintslight";
        xresources.properties."Xft.lcdfilter" = "lcddefault";
        xresources.properties."Xft.rgba" = "rgb";
      })

      (mkIf pkgs.stdenv.isLinux {
        home.packages = with pkgs; [
          gnome3.dconf
          gnome3.glib_networking
          gorandr
          i3lock
          libnotify
          maim
          networkmanagerapplet
          pavucontrol
          rsibreak
          slop
          spotify
          sxhkd
          sxiv
          wmname
          xautolock
          xclip
          xdo
          xdotool
          xsel
          xtitle
        ];

        home.keyboard.layout = "lv,ru";
        home.keyboard.variant = "qwerty";
        home.keyboard.options = [
          "grp:alt_space_toggle"
          "terminate:ctrl_alt_bksp"
          "eurosign:5"
          "caps:escape"
        ];

        home.sessionVariables._JAVA_AWT_WM_NONREPARENTING = "1";

        programs.feh.enable = true;

        programs.rofi.enable = true;
        programs.rofi.terminal = config.resources.programs.terminal.executable.path;
        programs.rofi.separator = "none";
        programs.rofi.lines = 10;
        programs.rofi.width = 20;
        programs.rofi.scrollbar = false;

        services.dunst.enable = true;
        services.dunst.settings."global".browser = config.resources.programs.browser.executable.path;
        services.dunst.settings."global".dmenu = "${pkgs.rofi}/bin/rofi -dmenu -p dunst";
        services.dunst.settings."global".follow = "keyboard";
        services.dunst.settings."global".font = "Monospace 10";
        services.dunst.settings."global".format = "%a: <b>%p%s</b>\n%b";
        services.dunst.settings."global".icon_position = "left";
        services.dunst.settings."global".startup_notification = false;
        services.dunst.settings."shortcuts".close = "ctrl+space";
        services.dunst.settings."shortcuts".close_all = "ctrl+shift+space";
        services.dunst.settings."shortcuts".context = "ctrl+shift+period";
        services.dunst.settings."shortcuts".history = "ctrl+grave";
        services.dunst.settings."urgency_critical".background = base00;
        services.dunst.settings."urgency_critical".foreground = base08;
        services.dunst.settings."urgency_critical".timeout = 0;
        services.dunst.settings."urgency_low".background = base00;
        services.dunst.settings."urgency_low".foreground = base07;
        services.dunst.settings."urgency_low".timeout = 6;
        services.dunst.settings."urgency_normal".background = base00;
        services.dunst.settings."urgency_normal".foreground = base0d;
        services.dunst.settings."urgency_normal".timeout = 10;

        services.network-manager-applet.enable = true;

        services.polybar.config = ../dotfiles/polybar/config;
        services.polybar.enable = true;
        services.polybar.package = pkgs.polybar.override {
          alsaSupport = true;
          mpdSupport = true;
          githubSupport = true;
        };
        services.polybar.script = ''
          i=0
          for m in $(${pkgs.gorandr}/bin/randrq -f '{{.Name}}:{{.Width}}'); do
          name="''${m%:*}"
          width="''${m#*:}"

          size="-small"
          [[ ''${width} -gt 1920 ]] && size="-big"

          suf=""
          [[ $i == 0 ]] && suf="-tray"

          MONITOR="''${name}" ${pkgs.polybar}/bin/polybar -r top''${size}''${suf}&

          let i=i+1
          done
        '';


        services.redshift.enable = true;
        services.redshift.provider = "manual";
        services.redshift.tray = true;

        services.screen-locker.enable = true;
        services.screen-locker.inactiveInterval = 20;
        services.screen-locker.lockCmd = "${pkgs.i3lock}/bin/i3lock -t -f -i ~/pictures/lock";

        xdg.configFile."bspwm/bspwmrc".source = ../dotfiles/bspwm/bspwmrc;
        xdg.configFile."sway/config".source = ../dotfiles/sway/config;

        xsession.enable = true;
        xsession.windowManager.command = ''
          ${pkgs.feh}/bin/feh --bg-fill "$HOME/pictures/wp"
          ${pkgs.networkmanagerapplet}/bin/nm-applet &
          ${pkgs.xorg.xset}/bin/xset s off -dpms
          ${pkgs.xorg.xsetroot}/bin/xsetroot -cursor_name left_ptr
          ${pkgs.wmname}/bin/wmname LG3D

          /run/wrappers/bin/sudo ''${HOME}/.local/bin/fix-keycodes

          ${pkgs.pulseaudioFull}/bin/pactl upload-sample /usr/share/sounds/freedesktop/stereo/bell.oga x11-bell
          ${pkgs.pulseaudioFull}/bin/pactl load-module module-x11-bell sample=x11-bell display=$DISPLAY

          ${pkgs.xbanish}/bin/xbanish &

          SXHKD_SHELL=${pkgs.bash}/bin/bash ${pkgs.sxhkd}/bin/sxhkd -m -1 &
          ${pkgs.bspwm}/bin/bspwm
        '';

        xsession.windowManager.i3.config.focus.followMouse = false;
        xsession.windowManager.i3.config.fonts = [
          "Unifont"
          monospace
        ];
      })
    ];
  }
