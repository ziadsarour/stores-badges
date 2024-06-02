store=$1
color=$2

if [[ $store != "appstore" && $store != "playstore" ]]; then
  echo "store type must be appstore or playstore";
  exit 1;
fi

if [[ $color != "black" && $color != "white" ]]; then
  echo "color type must be black or white";
  exit 1;
fi

locales=();
for png in $store/$color/*.png; do
  locale=$(basename "${png%.png}");
  locales+=("$locale");
done


target=_cleaned;
mkdir -p $target/$store/$color;

for locale in "${locales[@]}"; do
  crop="";

  if [[ $store == "appstore" ]]; then
    crop="-crop +18+18 -crop -18-18";
  elif [[ $store == "playstore" ]]; then
    crop="-crop +10+10 -crop -10-10";
  fi

  convert $store/$color/$locale.png \
    -trim +repage -gravity center \
    $crop \
    -channel rgba -alpha set -fill none -fuzz 10% -opaque "#000000" \
    -trim +repage -gravity center \
    $target/$store/$color/$locale.png;
done
