## Appstore (iOS)
Downloaded from : https://developer.apple.com/app-store/marketing/guidelines


## Playstore (Android)
Downloaded from : https://play.google.com/intl/en_us/badges

Use this script in browser console to automate downloading for all locales

```js
(async () => {
  const locales = [...document.querySelectorAll('select#locale option')].map(el => el.value);
  const btn = document.querySelector('#download-btn');

  for (const locale of locales) {
    btn.setAttribute('download', `${locale}.png`);
    btn.setAttribute('href', `static/images/badges/${locale}_badge_web_generic.png`);
    await new Promise(resolve => setTimeout(resolve, 50));
    btn.click();
    await new Promise(resolve => setTimeout(resolve, 250));
  }
})();
```

## Cleaner

Use cleaner.sh to clean images (transparent background and trimmed).
Only works with png files.

Should be executed at the root of this folder with the store as the first argument :
```sh ./cleaner.sh appstore```
```sh ./cleaner.sh playstore```

Output files will be located at {store}/_cleaned/{locale}.png.
