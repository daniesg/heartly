const { environment } = require('@rails/webpacker')
const webpack = require('webpack');
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')

environment.plugins.prepend(
  'ProvidePlugin-JQuery',
  new webpack.ProvidePlugin({
    $: 'jquery'
  })
);

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
module.exports = environment
