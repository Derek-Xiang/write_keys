return function(url, callback)
    local stdout = vim.loop.new_pipe(false)
    local stderr = vim.loop.new_pipe(false)
    local result = {}

    local handle
    local function on_exit(code, signal)
        stdout:read_stop()
        stderr:read_stop()
        stdout:close()
        stderr:close()
        handle:close()

        if code == 0 then
            callback(table.concat(result, ''))
        else
            print("Fetch failed with code: " .. code .. " and signal: " .. signal)
        end
    end

    handle = vim.loop.spawn("curl", {
        args = {"-s", url},
        stdio = {nil, stdout, stderr},
    }, vim.schedule_wrap(on_exit))

    vim.loop.read_start(stdout, function(err, data)
        assert(not err, err)
        if data then
            table.insert(result, data)
        end
    end)
end

