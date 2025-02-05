{ pkgs, ... }:

{
  plugins = {
    lsp = {
      enable = true;
      servers = {
	pyright.enable = true;
	java_language_server.enable = true;
      };
    };
  };
}
