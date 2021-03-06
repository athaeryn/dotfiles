module.exports = {
  config: {
    fontSize: 16,

    // retina screen:
    fontFamily: 'Iosevka-light, "Fira Code", "Fira Mono", Menlo, monospace',
    // non-retina screen:
    // fontFamily: 'Iosevka, "Fira Code", "Fira Mono", Menlo, monospace',

    cursorColor: 'rgba(255, 255, 255, 0.5)',
    cursorShape: 'BLOCK',

    foregroundColor: '#e7e3d9',
    backgroundColor: '#18181a',

    borderColor: 'black',

    // custom css
    css: ``,
    termCSS: `
      * {
        -webkit-font-feature-settings: "liga" on, "calt" on, "dlig" on !important;
        text-rendering: optimizeLegibility !important;
        -webkit-font-smoothing: antialiased;
      }
    `,

    padding: '0',

    colors: {
      black: '#232323',
      red: '#e07071',
      green: '#bad14d',
      yellow: '#f2b555',
      blue: '#54b2dd',
      magenta: '#ab83b8',
      cyan: '#58b6a8',
      white: '#a3a6a4',

      lightBlack: '#787878',
      lightRed: '#c94844',
      lightGreen: '#a0a459',
      lightYellow: '#d9a752',
      lightBlue: '#5696b1',
      lightMagenta: '#856389',
      lightCyan: '#5f8f8b',
      lightWhite: '#dfd8c9'
    }
  },

  bell: false,

  plugins: [],
  localPlugins: []
};
