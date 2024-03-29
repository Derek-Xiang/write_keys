return function(json_str)
    local json_ok, json_data = pcall(vim.json.decode, json_str)
    if not json_ok then
        print("Error parsing JSON")
        return {}
    end
    
    local keys = {}
    for key, _ in pairs(json_data) do
        table.insert(keys, key)
    end
    
    return keys
end
