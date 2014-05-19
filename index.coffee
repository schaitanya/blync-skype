blync  = require 'blync'
skyper = require 'skyper'


device = blync.getDevice(0)

skyper.desktop.on 'notification', (body) ->

  [type, status] = body.split(' ')
  return false unless type is 'USERSTATUS'

  color = switch status
    when 'DND' then 'red'
    when 'AWAY' then 'yellow'
    when 'INVISIBLE' then 'magenta'
    when 'OFFLINE' then 'off'
    else 'green'

  try
    device.setColor color
  catch e
    console.log 'Error: ', e