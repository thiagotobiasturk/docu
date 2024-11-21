const{test, expect} = require ('@playwright/test');

test('has title', async ({page}) => {
  await page.goto('url');
  await page.fill('#cssSelector','text')cia
  const url = page.url();
  await expect(page.getByRole('heading', {name:'title'})).toBe('url');
  await page.getByRole('link', {name:'title'}).click();
  await page.click('#cssSelector');


     Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
