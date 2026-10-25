{...}: {
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [];
    allowedUDPPorts = [];
  };

  # Keep the clock correct over NTP. A skewed clock is the #1 cause of bogus
  # TLS "certificate not valid yet / expired" errors in the browser, since cert
  # validity is checked against system time.
  services.timesyncd.enable = true;

  # Faster name resolution / mDNS for `.local` hosts.
  services.resolved.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };
}
