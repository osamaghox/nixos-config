{ lib, ... }:

let
  # دالة لفحص ما إذا كان المجلد يحتوي على ملف default.nix
  isModule = name: type:
    (type == "regular" && lib.hasSuffix ".nix" name && name != "default.nix") ||
    (type == "directory" && builtins.pathExists (./. + "/${name}/default.nix"));

  # جلب كل المحتويات وتصفيتها
  contents = builtins.readDir ./.;
  modules = lib.filterAttrs isModule contents;

in
{
  # تحويل الأسماء المفلترة إلى مسارات كاملة للاستيراد
  imports = map (name: ./. + "/${name}") (lib.attrNames modules);
}



