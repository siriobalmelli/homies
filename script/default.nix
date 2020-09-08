## toolbench scripts, for installation on a running system
# TODO: de-facto 'ghostscript' dependency for merge_pdf is not encoded anywhere
{ writeShellScriptBin }:

let
  tbh_flush_dns = writeShellScriptBin "tbh_flush_dns"
    (builtins.readFile ./flush_dns.sh);
  tbh_gemset_nix = writeShellScriptBin "tbh_gemset_nix"
    (builtins.readFile ./gemset_nix.sh);
  tbh_install = writeShellScriptBin "tbh_install"
    (builtins.readFile ./install.sh);
  tbh_mac_tftp = writeShellScriptBin "tbh_mac_tftp"
    (builtins.readFile ./mac_tftp.sh);
  tbh_merge_pdf = writeShellScriptBin "tbh_merge_pdf"
    (builtins.readFile ./merge_pdf.sh);
  tbh_preview = writeShellScriptBin "tbh_preview"
    (builtins.readFile ./preview.sh);
  tbh_pyenv = writeShellScriptBin "tbh_pyenv"
    (builtins.readFile ./pyenv.sh);

in
[
  tbh_flush_dns
  tbh_gemset_nix
  tbh_install
  tbh_mac_tftp
  tbh_merge_pdf
  tbh_preview
  tbh_pyenv
]
