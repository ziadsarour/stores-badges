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

