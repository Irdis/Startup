local M = {}

M.setup = function(config)
    M.config = config.apps;
    M.bufs = {};
    M.running = false;
end

M.log = function(msg)
    print('[startup] ' .. msg)
end

M.run = function(options)
    local main = vim.api.nvim_get_current_buf();
    if M.running then
        M.log("Already running")
        return;
    end
    M.running = true;
    for _, app in ipairs(M.config) do
        if not M.is_disabled(app, options) then
            local b = vim.api.nvim_create_buf(true, true)
            table.insert(M.bufs, b);

            vim.api.nvim_set_current_buf(b)
            local ch = vim.fn.termopen('cmd');
            vim.api.nvim_command('file ' .. app.name)

            for _, cmd in ipairs(app.cmds) do
                vim.api.nvim_chan_send(ch, cmd .. '\r')
            end
        end
    end
    vim.api.nvim_set_current_buf(main)
end

M.is_disabled = function(app, options)
    if not options or not options[app.name] then
        return app.disabled
    end

    local app_options = options[app.name]
    if app_options['disabled'] ~= nil then 
        return app_options['disabled']
    end

    if app.disabled then
        return true
    end
    return false;
end

M.stop = function()
    for _, buf in ipairs(M.bufs) do
        if vim.api.nvim_buf_is_valid(buf) then
            vim.api.nvim_buf_delete(buf, { force = true })
        end
    end
    M.running = false;
    M.bufs = {}
end

return M
