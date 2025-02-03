{
  fetchurl,
  appimageTools
}:

appimageTools.wrapType2 {
  pname = "zen";
  version = "twilight";
  src = fetchurl {
    url = "https://github.com/zen-browser/desktop/releases/download/twilight/zen-x86_64.AppImage";
    hash = "sha256:0ddrk73i3mxah2f9hdjfx86gzqn0fnsgvw7r5ciynb693xrrjpnh";
  };
}
