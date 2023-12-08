process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')

module.exports = {
    entry: './app/javascript/packs/application.js',
    node: {
      global: false,
      __filename: false,
      __dirname: false,
    },
  }
