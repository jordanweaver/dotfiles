// Use https://finicky-kickstart.now.sh to generate basic configuration
// Learn more about configuration options: https://github.com/johnste/finicky/wiki/Configuration

module.exports = {
  defaultBrowser: "Safari",
  options: {
    // Hide the finicky icon from the top bar
    hideIcon: true
  },
  rewrite: [
    {
      // Redirect all urls to use https
      match: ({ url }) => url.protocol === "http",
      url: { protocol: "https" }
    }
  ],
  handlers: [
    {
      // Open links in Safari when the option key is pressed
      // Valid keys are: shift, option, command, control, capsLock, and function.
      // Please note that control usually opens a tooltip menu instead of visiting a link
      match: () => finicky.getKeys().option,
      browser: "Safari"
    },
    {
      // Open Google and Indeed urls in Google Chrome
      match: [
        "*.indeed.com/*",
        "*.indeed.net/*",
        "*.indeed.tech/*",
	      "indeedlearn.remote-learner.net/*",
        "indeed-pte.slack.com/*",
	      "*.datadoghq.com/*",
	      "*.indeed.onelogin.com/*",
	      "*.indeedhuddle.com/*",
        "*.google.com/*", // match google.com subdomains
      ],
      browser: "Google Chrome"
    },
        {
        // Open Spotify links in app
        match: [
            "*.spotify.com/*"
        ],
        browser: "Spotify",
    },
    {
      match: [
        "zoom.us/*",
        finicky.matchDomains(/.*\zoom.us/),
        /zoom.us\/j\//,
      ],
      browser: "us.zoom.xos"
    },
    {
      // Open any link clicked in apps array in Google Chrome
      match: ({ opener }) =>
       ["Slack"].includes(opener.name),
      browser: "Google Chrome"
    }
  ]
};
