local fetch = require('write_keys.fetch')
local parse = require('write_keys.parse')
local insert = require('write_keys.insert')

local function print_json_keys()
    local url = "https://raw.githubusercontent.com/jdorfman/awesome-json-datasets/master/tests/relaxed.json"
    fetch(url, function(json_str)
        local keys = parse(json_str)
        insert(keys)
    end)
end

return {
    print_json_keys = print_json_keys
}

