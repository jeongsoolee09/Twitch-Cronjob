# Twitch-Cronjob

I'm a Twitch Junkie and I can't deny it. That's why I wrote a script that:
- checks if a given channel (specified with the Twitch ID) is live,
- and if the channel is live, downloads the stream.

## Deps

`pip install hy beautifulsoup4 youtube-dl`

- `youtube-dl` does all the heavy-lifting. Kudos to the devs!
- `hy` is the interpreter binary that comes with `pip install hy`.

## Adding Your Channel of Choice

This repo contains an example `twitchconfig.json`. Add your streamer's Twitch ID (`www.twitch.tv/{twitch-id}`) to `streamers`.

## Making This a Cron Job

- [Tutorial on making a cron job](https://docs.oracle.com/cd/E19455-01/805-7229/6j6q8svfo/index.html)
- [Excellent Guide to the Crontab file syntax](https://crontab.guru)

Personally, I run this every 5 minutes, so I set my crontab as:

```cron
*/5 * * * * hy /path/to/main.hy
```
