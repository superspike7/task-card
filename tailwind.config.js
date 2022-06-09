module.exports = {
  content: [
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*",
  ],
  theme: {
    extend: {
      keyframes: {
        flash: {
          "0%": { opacity: 0 },
          "5%": { opacity: 1 },
          "60%": { opacity: 1 },
          "100%": { opacity: 0 },
        },
      },
      animation: {
        flash: "flash 4s both",
      },
    },
  },
  plugins: [],
};
