{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # fileSystems."/mnt/raidet" = {
  #     device = "/dev/disk/by-uuid/28e6c20f-660b-4d9c-85b2-afa54a3b789a";
  #     fsType = "ext4";
  # };

  environment.systemPackages = with pkgs; [
    apacheHttpd
    seafile-client
    seafile-shared
    skype
    # adwaita-icon-theme
    ctags
    # elementary
    # gitAndTools.git-crypt
    # gitAndTools.hub
    # gnome-themes-standard
    # xev
    # linuxPackages.virtualbox
    # redis
    youtube-dl
  ];

  # system.stateVersion = "16.03";

  nixpkgs.config = {
    # virtualbox.enableExtensionPack = true;
  };

  services.xserver = {
    # xkbOptions = "eurosign:e";
    # autorun = true;

    desktopManager = {
      # kde5.enable = true;
      # gnome3.enable = true;
      # kodi.enable = true;
    };

    windowManager = {
      # stumpwm.enable = true;
      # wmii.enable = true;
      # awesome.enable = true;
    };
  }

  # nix = {
  #   package = pkgs.nixStable;
  #   useChroot = true;
  #   nrBuildUsers = 16;
  #   gc.automatic = true;
  #   trustedBinaryCaches = [ http://cache.nixos.org http://hydra.nixos.org ];
  # };

  # security.setuidPrograms = [ "pmount" "pumount" ];

  services.samba = {
    enable = true;
    extraConfig = ''
    guest account = nobody
    map to guest = bad user

    [share]
       comment = Shared
       path = /mnt/share
       browseable = yes
       read only = no
       guest ok = yes
       writable = yes
       valid users = andrzej
    '';
  };

  virtualisation = {
    docker.enable = true;
    virtualbox.host.enable = true;
    libvirtd.enable = true;
  };

  # services.locate = {
  #   enable = true;
  #   period = "00 15 * * *";
  # };


  # services.syncthing = {
  #   enable = true;
  #   dataDir = "/home/andrzej/.config/syncthing";
  #   user = "andrzej";
  # };

  # services.cron = {
  #   enable = true;
  #   systemCronJobs = [ "49 05 * * * curl -k http://freedns.afraid.org/dynamic/update.php?QkJrVUZJNEp1dG84S3FwN2lZaW8xT0FYOjExMjAyMzY4"];
  # };


  # security.grsecurity = {
  #   enable = true;
  #   testing = true;
  #   config.system = "desktop";
  # };

  # VirtualBox specific stuff.
  # boot.initrd.checkJournalingFS = false;
  # services.virtualboxGuest.enable = true;

  services.nginx = {
    enable = false;
    config = ''
  #user  nobody;
  worker_processes  1;
  #error_log  logs/error.log;
  #error_log  logs/error.log  notice;
  #error_log  logs/error.log  info;
   #pid        logs/nginx.pid;

   events {
     worker_connections  1024;
   }
   http {
    include       ${pkgs.nginx}/conf/mime.types;
    default_type  application/octet-stream;
    #access_log  logs/access.log  main;
    sendfile        on;
    #tcp_nopush     on;
    #keepalive_timeout  0;
    keepalive_timeout  65;
    #gzip  on;

    server {
        listen       80;
        server_name  localhost;
        #charset koi8-r;
        #access_log  logs/host.access.log  main;
        location / {
            root   /var/www;
            root   /var/www;
            index  index.html index.htm;
        }
        #error_page  404              /404.html;
        # redirect server error pages to the static page /50x.html
        #
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }
        # proxy the PHP scripts to Apache listening on 127.0.0.1:80
        #
        #location ~ \.php$ {
        #    proxy_pass   http://127.0.0.1;
        #}
        # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
        #
        #location ~ \.php$ {
        #    root           html;
        #    fastcgi_pass   127.0.0.1:9000;
        #    fastcgi_index  index.php;
        #    fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
        #    include        fastcgi_params;
        #}
        # deny access to .htaccess files, if Apache's document root
        # concurs with nginx's one
        #
        #location ~ /\.ht {
        #    deny  all;
        #}
    }


    # another virtual host using mix of IP-, name-, and port-based configuration
    #
    #server {
    #    listen       8000;
    #    listen       somename:8080;
    #    server_name  somename  alias  another.alias;
    #    location / {
    #        root   html;
    #        index  index.html index.htm;
    #    }
    #}

    # HTTPS server
    #
    #server {
    #    listen       443 ssl;
    #    server_name  localhost;
    #    ssl_certificate      cert.pem;
    #    ssl_certificate_key  cert.key;
    #    ssl_session_cache    shared:SSL:1m;
    #    ssl_session_timeout  5m;
    #    ssl_ciphers  HIGH:!aNULL:!MD5;
    #    ssl_prefer_server_ciphers  on;
    #    location / {
    #        root   html;
    #        index  index.html index.htm;
    #    }
    #}
  }
  '';
  };
}

