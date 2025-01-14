local startup = {}

startup.setup = function(config)
    startup.config = config;
    startup.main = vim.api.nvim_get_current_buf();
    startup.bufs = {};
    startup.running = false;
end

startup.run = function()
    if startup.running then
        print("Already running")
        return;
    end
    startup.running = true;
    for _, app in ipairs(startup.config) do
        if not app.disabled then
            local b = vim.api.nvim_create_buf(true, true)
            table.insert(startup.bufs, b);

            vim.api.nvim_set_current_buf(b)
            local ch = vim.fn.termopen('cmd');
            vim.api.nvim_command('file ' .. app.name)

            for _, cmd in ipairs(app.cmds) do
                vim.api.nvim_chan_send(ch, cmd .. '\r')
            end
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
    startup.running = false;
    startup.bufs = {}
end

return startup
