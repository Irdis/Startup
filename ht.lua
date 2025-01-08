local startup = require('startup')

local ht = {}

ht.startup = startup

ht.setup = function()
    startup.setup({
        {
            name = 'hello',
            cmds = {'cd c:\\temp', 'ping -t ya.ru'}
        },
    })
end

ht.setup()

return ht


