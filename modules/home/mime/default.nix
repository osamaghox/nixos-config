{ config, lib, ... }:

let
  cfg = config.userSettings.mime;
  
  # مصفوفة التطبيقات الافتراضية
  defaultApps = {
    text = [ "org.gnome.TextEditor.desktop" ];
    image = [ "imv-dir.desktop" ];
    audio = [ "mpv.desktop" ];
    video = [ "mpv.desktop" ];
    directory = [ "nemo.desktop" ];
    office = [ "libreoffice.desktop" ];
    pdf = [ "org.gnome.Evince.desktop" ];
    terminal = [ "ghostty.desktop" ];
    archive = [ "org.gnome.FileRoller.desktop" ];
    discord = [ "webcord.desktop" ];
  };

  # خريطة أنواع الملفات (MIME Types)
  mimeMap = {
    text = [ "text/plain" ];
    image = [
      "image/bmp" "image/gif" "image/jpeg" "image/jpg"
      "image/png" "image/svg+xml" "image/tiff"
      "image/vnd.microsoft.icon" "image/webp"
    ];
    audio = [
      "audio/aac" "audio/mpeg" "audio/ogg" "audio/opus"
      "audio/wav" "audio/webm" "audio/x-matroska"
    ];
    video = [
      "video/mp2t" "video/mp4" "video/mpeg" "video/ogg"
      "video/webm" "video/x-flv" "video/x-matroska"
      "video/x-msvideo"
    ];
    directory = [ "inode/directory" ];
    office = [
      "application/vnd.oasis.opendocument.text"
      "application/vnd.oasis.opendocument.spreadsheet"
      "application/vnd.oasis.opendocument.presentation"
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
      "application/vnd.openxmlformats-officedocument.presentationml.presentation"
      "application/msword" "application/vnd.ms-excel"
      "application/vnd.ms-powerpoint" "application/rtf"
    ];
    pdf = [ "application/pdf" ];
    terminal = [ "terminal" ];
    archive = [
      "application/zip" "application/rar" "application/7z" "application/*tar"
    ];
    discord = [ "x-scheme-handler/discord" ];
  };

  # دالة منطقية لربط الأنواع بالتطبيقات تلقائياً
  associations = with lib.lists;
    listToAttrs (
      flatten (
        lib.mapAttrsToList (
          key: map (type: lib.attrsets.nameValuePair type defaultApps."${key}")
        ) mimeMap
      )
    );
in
{
  ### 1. تعريف الخيارات (Options)
  options.userSettings.mime = {
    enable = lib.mkEnableOption "Enable Default Applications Management (MIME)";
  };

  ### 2. التنفيذ (Implementation)
  config = lib.mkIf cfg.enable {
    # إجبار النظام على استخدام ملف الإعدادات الخاص بنا
    xdg.configFile."mimeapps.list".force = true;
    
    xdg.mimeApps = {
      enable = true;
      associations.added = associations;
      defaultApplications = associations;
    };

    home.sessionVariables = {
      # منع برامج ويندوز (Wine) من تخريب ارتباطات الملفات
      WINEDLLOVERRIDES = "winemenubuilder.exe=d";
    };
  };
}
