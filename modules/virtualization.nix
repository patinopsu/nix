{ pkgs, lib, config, ... }:

{
  options = {
    sys.virtualization.enable = lib.mkEnableOption "Enable Virtualisation Support";
    sys.virtualization.kvmgt.enable = lib.mkEnableOption "Wheater to enable kvmgt support, Needed for Intel GVT-g";
  };
  config = lib.mkIf config.sys.virtualization.enable {
    virtualisation = {
      kvmgt = lib.mkIf config.sys.virtualization.kvmgt.enable {
        enable = true;
        vgpus = {
          "i915-GVTg_V5_8" = {
            uuid = [ "a45bcaa2-eb87-11f0-8b39-6f2b6719fb9c" ];
          };
        };
      };
      libvirtd = {
        enable = true;
        qemu.swtpm.enable = true;
      };
      docker.enable = true;
      virtualbox.host.enable = true;
      spiceUSBRedirection.enable = true;
    };
    programs = {
      virt-manager.enable = true;
    };
  };
}