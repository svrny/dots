{ config, lib, pkgs, modulesPath, imputs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  networking = {
    hostName = "sylfaenol";
    interfaces.enp3s0.useDHCP = true;
  };
}

