export default {
  defaultBrowser: "Safari",
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
      // Open Zoom links in the Zoom app
      match: (url) =>
        url.host.includes("zoom.us") &&
        (url.pathname.startsWith("/j/") || url.hostname === "zoom.us"),
      browser: "us.zoom.xos"
    }
  ]
};