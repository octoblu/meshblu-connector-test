http = require 'http'

class SayHello
  constructor: ({@connector}) ->
    throw new Error 'SayHello requires connector' unless @connector?

  do: ({data}, callback) =>
    return callback @_userError(422, 'data.name is required') unless data?.name?

    {name} = data

    metadata =
      code: 200
      status: http.STATUS_CODES[200]

    data =
      response: @connector.getResponse {name}

    callback null, {metadata, data}

  _userError: (code, message) =>
    error = new Error message
    error.code = code
    return error

module.exports = SayHello
