{
  networking.nameservers = [
    "45.90.28.0#ed12d9.dns.nextdns.io"
    "2a07:a8c0::#ed12d9.dns.nextdns.io"
    "45.90.30.0#ed12d9.dns.nextdns.io"
    "2a07:a8c1::#ed12d9.dns.nextdns.io"
  ];

  services.resolved = {
    enable = true;
    dnssec = "true";
    fallbackDns = [
      "45.90.28.0#ed12d9.dns.nextdns.io"
      "2a07:a8c0::#ed12d9.dns.nextdns.io"
      "45.90.30.0#ed12d9.dns.nextdns.io"
      "2a07:a8c1::#ed12d9.dns.nextdns.io"
    ];
    dnsovertls = "true";
  };
}
