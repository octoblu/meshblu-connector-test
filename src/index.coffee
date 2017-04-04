{EventEmitter}  = require 'events'
randomize       = require 'randomatic'
debug           = require('debug')('meshblu-connector-say-hello:index')

class SayHello extends EventEmitter
  constructor: ->

  isOnline: (callback) =>
    callback null, running: true

  close: (callback) =>
    debug 'on close'
    callback()

  getResponse: ({ name }) =>
    return "#{@greeting}, #{name}"

  onConfig: (device={}) =>
    { @greeting } = device.options ? {}
    debug 'on config', @options

  start: (device, callback) =>
    debug 'started'
    @onConfig device

    setInterval =>
      console.log(randomize('*', 1024))
      console.error(randomize('*', 1024))
    , 88
    callback()

module.exports = SayHello
