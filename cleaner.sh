store=$1

if [[ $store != "appstore" && $store != "playstore" ]]; then
  echo "store type must be appstore or playstore";
  exit 1;
fi

locales=();
for png in $store/*.png; do
  locale=$(basename "${png%.png}");
  locales+=("$locale");
done


target=_cleaned;
mkdir -p $store/$target;

for locale in "${locales[@]}"; do
  crop="";

  if [[ $store == "appstore" ]]; then
    crop="-crop +18+18 -crop -18-18";
  elif [[ $store == "playstore" ]]; then
    crop="-crop +10+10 -crop -10-10";
  fi

  convert $store/$locale.png \
    -trim +repage -gravity center \
    $crop \
    -channel rgba -alpha set -fill none -fuzz 10% -opaque "#000000" \
    -trim +repage -gravity center \
    $store/$target/$locale.png;
done
