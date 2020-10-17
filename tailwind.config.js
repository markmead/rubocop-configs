module.exports = {
  future: {
    removeDeprecatedGapUtilities: true,
    purgeLayersByDefault: true,
    defaultLineHeights: true,
    standardFontWeights: true,
  },
  purge: ['./app/**/*.html.erb', './app/helpers/**/*.rb'],
  theme: {
    container: (theme) => ({
      center: true,
      padding: {
        default: theme('padding.4'),
        sm: theme('padding.6'),
      },
    }),
    typography: {
      default: {
        css: {
          'code::before': {
            content: 'none',
          },
          'code::after': {
            content: 'none',
          },
        },
      },
    },
    extend: {},
  },
  variants: {},
  plugins: [require('@tailwindcss/ui'), require('@tailwindcss/typography')],
}
