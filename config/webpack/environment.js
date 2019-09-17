const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)

const { CleanWebpackPlugin } = require('clean-webpack-plugin')
environment.plugins.prepend('CleanWebpackPlugin', new CleanWebpackPlugin())

module.exports = environment
