{
  fetchurl,
  appimageTools
}:

appimageTools.wrapType2 {
  pname = "zen";
  version = "beta";
  src = fetchurl {
    url = "https://github.com/zen-browser/desktop/releases/download/1.7.3b/zen-x86_64.AppImage";
    hash = "sha256:09f2ksx32mmmyy46wr3sl0n26nr2spydnz36hq949gwjyfpbl9b2";
  };
}
