{
  virtualisation = {
    kvmgt = {
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
}