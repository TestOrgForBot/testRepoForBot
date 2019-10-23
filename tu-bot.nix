{ pkgs, config, lib, ... }:

with lib;

let
  storeRoot = import /root/tu-bot;
  port = 3018;
  common = rec {
    path = [ storeRoot ];
    requires = [ "network.target" "postgresql.service" ];
    after = requires;
    environment = {
      TU_APP_TOKEN="xoxp-9411943863-335169030690-346978432930-6888c6960f8cae9f56265347772bd3c8";
      TU_BOT_TOKEN="xoxb-346427574689-6ntp89EXFPAUHn20yWbcndDZ";
      TU_BOT_USER="tu-bot";
      TU_BOT_PWD="tu-bot";
      TU_BOT_DB="tu-bot";
      TU_CHANNEL_LISTEN="G9NJ6TSJC";
      TU_CHANNEL_LOG="CA2F572SZ";
      TU_YT_TOKEN="perm:c3ByaW50Ym90.QmV0dGVyIFRva2Vu.jZFRXnDBY7xxU1Xc2UyyyZ5SZ9gXqL";
      TU_WEB_PORT = toString port;
    };
    serviceConfig = {
      User = "tu-bot";
      WorkingDirectory = "/etc/tu-bot";
    };
  };
  tu-bot-service = srv: lib.mkMerge [ common srv ];
in

{
  config = {
    services.postgresql = {
      enable = true;
      package = pkgs.postgresql100;
      initialScript = pkgs.writeText "tu-bot.sql" ''
        CREATE ROLE "tu-bot" LOGIN PASSWORD 'tu-bot';
        CREATE DATABASE "tu-bot" OWNER "tu-bot";
        CREATE ROLE "tu-bot" LOGIN PASSWORD 'tu-bot';
        CREATE DATABASE "tu-bot" OWNER "tu-bot";
      '';
    };
    systemd.services = {
      tu-bot-migration = tu-bot-service rec {
        script = ''
          if [ ! -e /var/lib/tu-bot/seeded ]; then
            tu-bot-migration --up
            tu-bot-migration --seed
            touch /var/lib/tu-bot/seeded
          fi
        '';
        serviceConfig.Type = "oneshot";
        serviceConfig.RemainAfterExit = true; # probably...
      };
      tu-bot-interactive = tu-bot-service rec {
        wantedBy = [ "multi-user.target" ];
        requires = [ "tu-bot-migration.service" ];
        after = requires;
        script = "tu-bot-interactive";
      };
      tu-bot-report = tu-bot-service rec {
        requires = [ "tu-bot-migration.service" ];
        after = requires;
        script = "tu-bot-report2";
        script = "tu-bot-report";
      };
    };
    systemd.timers.tu-bot-report = {
      wantedBy = [ "timers.target" ];
      description = "tu-bot reports";
      timerConfig = {
        OnCalendar = "Mon..Fri 22:58 UTC";
      };
    };
    users.users.tu-bot = {
      createHome = true;
      home = "/var/lib/tu-bot";
    };
  };
}
