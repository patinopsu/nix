{ pkgs, ... }: 

{
  services = {
    ipp-usb.enable = true;
    system-config-printer.enable = true;
    printing = {
      enable = true;
      cups-pdf.enable = true;
      browsed.enable = true;
      drivers = with pkgs; [
        gutenprint
        hplip
      ];
    };
  };
}