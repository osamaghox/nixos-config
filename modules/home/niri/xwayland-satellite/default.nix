{ pkgs, ... }:
{
home.packages = [ pkgs.xwayland-satellite ];

# تشغيله تلقائياً عند بدء الجلسة
systemd.user.services.xwayland-satellite = {
  Unit = {
    Description = "Xwayland satellite service";
    After = [ "graphical-session.target" ];
  };
  Service = {
    ExecStart = "${pkgs.xwayland-satellite}/bin/xwayland-satellite";
    Restart = "always";
  };
  Install = {
    WantedBy = [ "graphical-session.target" ];
  };
};
}
