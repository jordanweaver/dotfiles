export default {
  defaultBrowser: "Chrome",
  options: {
    hideIcon: true
  },

  rewrite: [
    {
      // Redirect all http URLs to https
      match: (url) => url.protocol === "http:",
      url: (url) => {
        url.protocol = "https:";
        return url;
      }
    }
  ],

  handlers: [
    {
      // Open links in Safari when the Option key is pressed
      match: (url, context) => context?.keys?.option === true,
      browser: "Safari"
    },

    {
      // Open Google and Setpoint urls in Google Chrome
      match: [
        "*.setpoint.io/*",
        "*.google.com/*", // match google.com subdomains
      ],
      browser: "Google Chrome"
    },

    {
      // Open Zoom links in the Zoom app
      match: (url) =>
        url.host.includes("zoom.us") &&
        (url.pathname.startsWith("/j/") || url.hostname === "zoom.us"),
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