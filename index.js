const puppeteer = require('puppeteer');

(async () => {
  try {
    const browser = await puppeteer.launch({
      args: ['--no-sandbox', '--disable-setuid-sandbox'],
    });
    const page = await browser.newPage();

    // Replace 'YOUR_WEBSITE_URL' with your actual website URL
    await page.goto('https://www.pmtrainingschool.com/');

    const title = await page.title();
    console.log('Website Title:', title);

    await browser.close();
  } catch (err) {
    console.error(err);
  }
})();
