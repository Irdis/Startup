startup = require('startup')
startup.run({ white_dev = { disabled = false }, tran = { disabled = true }, tran_dev = { disabled = false }})
startup.stop()

