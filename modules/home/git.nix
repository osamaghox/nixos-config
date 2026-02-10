{ pkgs, ... }:

{

  # 2. إعدادات Git (يجب أن يكون كل شيء داخل هذه الأقواس)
  programs.git = {
    enable = true;
    userName = "Osama";
    userEmail = "osama@example.com";

    # هنا يجب أن يوضع الـ extraConfig
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}
