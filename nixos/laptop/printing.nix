{ pkgs, ... }: 

{
  services.ipp-usb.enable = true;
  services.system-config-printer.enable = true;
  services.printing = {
    enable = true;
    cups-pdf.enable = true;
    browsed.enable = true;
    drivers = with pkgs; [
      gutenprint
      cnijfilter2
      hplip
      ];
  };
}