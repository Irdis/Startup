local startup = {}

startup.setup = function(config)
    startup.config = config;
    startup.main = vim.api.nvim_get_current_buf();
    startup.bufs = {};
end

startup.run = function()
    for _, app in ipairs(startup.config) do
        local b = vim.api.nvim_create_buf(true, true)
        table.insert(startup.bufs, b);

        vim.api.nvim_set_current_buf(b)
        local ch = vim.fn.termopen('cmd');
        vim.api.nvim_command('file ' .. app.name)

        for _, cmd in ipairs(app.cmds) do
            vim.api.nvim_chan_send(ch, cmd .. '\r')
        end
    end
    vim.api.nvim_set_current_buf(startup.main)
end

startup.stop = function()
    for _, buf in ipairs(startup.bufs) do
        if vim.api.nvim_buf_is_valid(buf) then
            vim.api.nvim_buf_delete(buf, { force = true })
        end
    end
    startup.bufs = {}
end

return startup
