/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{html,ts}"],
  theme: {
    extend: {}
  },
  daisyui: {
    themes: [
      "light",
      "dark",
      "cupcake",
      "bumblebee",
      "emerald",
      "garden",
      "wireframe",
      "cmyk",
      "lemonade",
      {
        customtheme: {
          primary: "#cbbef7",
          secondary: "#74ccf2",
          accent: "#b1ed89",
          neutral: "#1f1523",
          "base-100": "#322f56",
          info: "#517af6",
          success: "#76e0a2",
          warning: "#f3d85e",
          error: "#eb567b"
        }
      }
    ]
  },
  plugins: [require("daisyui")]
}
