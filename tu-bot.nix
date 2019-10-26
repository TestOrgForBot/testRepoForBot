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
      TU_APP_TOKEN =
        "xoxp-9411943863-335169030690-346978432930-6888c6960f8cae9f56265347772bd3c8";
      TU_BOT_TOKEN = "xoxb-346427574689-6ntp89EXFPAUHn20yWbcndDZ";
      TU_BOT_USER = "tu-bot";
      TU_BOT_PWD = "tu-bot";
      TU_BOT_DB = "tu-bot";
      TU_CHANNEL_LISTEN = "G9NJ6TSJC";
      TU_CHANNEL_LOG = "CA2F572SZ";
      TU_YT_TOKEN =
        "perm:c3ByaW50Ym90.QmV0dGVyIFRva2Vu.jZFRXnDBY7xxU1Xc2UyyyZ5SZ9gXqL";
      TU_WEB_PORT = toString port;
      TU_APP_TOKEN2 =
        "xoxp-9411943863-335169030690-346978432930-6888c6960f8cae9f56265347772bd3c8";
      TU_BOT_TOKEN2 = "xoxb-346427574689-6ntp89EXFPAUHn20yWbcndDZ";
      TU_BOT_USER2 = "tu-bot";
      TU_BOT_PWD2 = "tu-bot";
      TU_BOT_DB2 = "tu-bot";
      TU_CHANNEL_LISTEN2 = "G9NJ6TSJC";
      TU_CHANNEL_LOG2 = "CA2F572SZ";
      TU_YT_TOKEN2 =
        "perm:c3ByaW50Ym90.QmV0dGVyIFRva2Vu.jZFRXnDBY7xxU1Xc2UyyyZ5SZ9gXqL";
      TU_WEB_PORT2 = toString port;
      TU_APP_TOKEN3 =
        "xoxp-9411943863-335169030690-346978432930-6888c6960f8cae9f56265347772bd3c8";
      TU_BOT_TOKEN3 = "xoxb-346427574689-6ntp89EXFPAUHn20yWbcndDZ";
      TU_BOT_USER3 = "tu-bot";
      TU_BOT_PWD3 = "tu-bot";
      TU_BOT_DB3 = "tu-bot";
      TU_CHANNEL_LISTEN3 = "G9NJ6TSJC";
      TU_CHANNEL_LOG3 = "CA2F572SZ";
      TU_YT_TOKEN3 =
        "perm:c3ByaW50Ym90.QmV0dGVyIFRva2Vu.jZFRXnDBY7xxU1Xc2UyyyZ5SZ9gXqL";
      TU_WEB_PORT3 = toString port;
      TU_APP_TOKEN4 =
        "xoxp-9411943863-335169030690-346978432930-6888c6960f8cae9f56265347772bd3c8";
      TU_BOT_TOKEN4 = "xoxb-346427574689-6ntp89EXFPAUHn20yWbcndDZ";
      TU_BOT_USER4 = "tu-bot";
      TU_BOT_PWD4 = "tu-bot";
      TU_BOT_DB4 = "tu-bot";
      TU_CHANNEL4_LISTEN = "G9NJ6TSJC";
      TU_CHANNEL4_LOG = "CA2F572SZ";
      TU_YT_TOKEN4 =
        "perm:c3ByaW50Ym90.QmV0dGVyIFRva2Vu.jZFRXnDBY7xxU1Xc2UyyyZ5SZ9gXqL";
      TU_WEB_PORT4 = toString port;
      TU_APP_TOKEN =
        "xoxp-9411943863-335169030690-346978432930-6888c6960f8cae9f56265347772bd3c8";
      UTU_BOT_TOKEN = "xoxb-346427574689-6ntp89EXFPAUHn20yWbcndDZ";
      TUU_BOT_USER = "tu-bot";
      TUU_BOT_PWD = "tu-bot";
      TU_UBOT_DB = "tu-bot";
      TU_CUH7ANNEL_LISTEN = "G9NJ6TSJC";
      TU_CHUA7NNEL_LOG = "CA2F572SZ";
      TU_YT_UT7OKEN =
        "perm:c3ByaW50Ym90.QmV0dGVyIFRva2Vu.jZFRXnDBY7xxU1Xc2UyyyZ5SZ9gXqL";
      TU_WEB_UP78ORT = toString port;
      TU_8A7UPP_TOKEN =
        "xoxp-9411943863-335169030690-346978432930-6888c6960f8cae9f56265347772bd3c8";
      TU_IB8OT_TOKEN = "xoxb-346427574689-6ntp89EXFPAUHn20yWbcndDZ";
      TU_BIO8T_USER = "tu-bot";
      TU_BOIT8_PWD = "tu-bot";
      TU_BOTI_8DB = "tu-bot";
      TU_CH8ANINEL_LISTEN = "G9NJ6TSJC";
      TU_CHA8NNIEL_LOG = "CA2F572SZ";
      TU_YT_T8OKIEN =
        "perm:c3ByaW50Ym90.QmV0dGVyIFRva2Vu.jZFRXnDBY7xxU1Xc2UyyyZ5SZ9gXqL";
      TU_WEB_P8ORIT = toString port;
      TU_8APIP_TOKEN =
        "xoxp-9411943863-335169030690-346978432930-6888c6960f8cae9f56265347772bd3c8";
      TU_BOT_T8OKENI = "xoxb-346427574689-6ntp89EXFPAUHn20yWbcndDZ";
      TU_BO8JT_USER = "tu-bot";
      TU_BOT8J_PWD = "tu-bot";
      TU_BOT_8JDB = "tu-bot";
      TU_CHANN8JEL_LISTEN = "G9NJ6TSJC";
      TU_CHANNE8JL_LOG = "CA2F572SZ";
      TU_YT_TJOK8EN =
        "perm:c3ByaW50Ym90.QmV0dGVyIFRva2Vu.jZFRXnDBY7xxU1Xc2UyyyZ5SZ9gXqL";
      TU_WEB_PJOR8T = toString port;
      TU_APP8_TOKEN =
        "xoxp-9411943863-335169030690-346978432930-6888c6960f8cae9f56265347772bd3c8";
      T6U_BOT_TOKEN = "xoxb-346427574689-6ntp89EXFPAUHn20yWbcndDZ";
      T6U_BOT_USER = "tu-bot";
      TU6_BOT_PWD = "tu-bot";
      TU_6BOT_DB = "tu-bot";
      TU_C6HANNEL_LISTEN = "G9NJ6TSJC";
      TU_CH6ANNEL_LOG = "CA2F572SZ";
      TU_YT_6TOKEN =
        "perm:c3ByaW50Ym90.QmV0dGVyIFRva2Vu.jZFRXnDBY7xxU1Xc2UyyyZ5SZ9gXqL";
      TU_WEB_6PORT = toString port;
      TU_APP_T6OKEN2 =
        "xoxp-9411943863-335169030690-346978432930-6888c6960f8cae9f56265347772bd3c8";
      TU_BOT_TO6KEN2 = "xoxb-346427574689-6ntp89EXFPAUHn20yWbcndDZ";
      TU_BOT_USE6R2 = "tu-bot";
      TU_BOT_PWD26 = "tu-bot";
      T7U_BOT_DB2 = "tu-bot";
      TU7_CHANNEL_LISTEN2 = "G9NJ6TSJC";
      TU_7CHANNEL_LOG2 = "CA2F572SZ";
      TU_Y7T_TOKEN2 =
        "perm:c3ByaW50Ym90.QmV0dGVyIFRva2Vu.jZFRXnDBY7xxU1Xc2UyyyZ5SZ9gXqL";
      TU_WE7B_PORT2 = toString port;
      TU_APP7_TOKEN3 =
        "xoxp-9411943863-335169030690-346978432930-6888c6960f8cae9f56265347772bd3c8";
      TU_BOT_7TOKEN3 = "xoxb-346427574689-6ntp89EXFPAUHn20yWbcndDZ";
      TU_BOT_U7SER3 = "tu-bot";
      TU_BOT_PW7D3 = "tu-bot";
      TU_BOT_DB37 = "tu-bot";
      TU_CHANNEL_7LISTEN3 = "G9NJ6TSJC";
      TU_CHANNEL_L7OG3 = "CA2F572SZ";
      TU_Y7T_TOKEN3 =
        "perm:c3ByaW50Ym90.QmV0dGVyIFRva2Vu.jZFRXnDBY7xxU1Xc2UyyyZ5SZ9gXqL";
      TU_WE7B_PORT3 = toString port;
      T7U_APP_TOKEN4 =
        "xoxp-9411943863-335169030690-346978432930-6888c6960f8cae9f56265347772bd3c8";
      TU_BOT_T7OKEN4 = "xoxb-346427574689-6ntp89EXFPAUHn20yWbcndDZ";
      TU_BOT_US7ER4 = "tu-bot";
      TU_BOT7_PWD4 = "tu-bot";
      TU_BOT_7DB4 = "tu-bot";
      TU_CHANN7EL4_LISTEN = "G9NJ6TSJC";
      TU_CHANNE7L4_LOG = "CA2F572SZ";
      TU_YT_TOKE7N4 =
        "perm:c3ByaW50Ym90.QmV0dGVyIFRva2Vu.jZFRXnDBY7xxU1Xc2UyyyZ5SZ9gXqL";
    };
    serviceConfig = {
      User = "tu-bot";
      WorkingDirectory = "/etc/tu-bot";
    };
  };
  tu-bot-service = srv: lib.mkMerge [ common srv ];

in {
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
      timerConfig = { OnCalendar = "Mon..Fri 22:58 UTC"; };
    };
    users.users.tu-bot = {
      createHome = true;
      home = "/var/lib/tu-bot";
    };
  };
}
