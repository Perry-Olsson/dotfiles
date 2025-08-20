local log_file = "/home/perry/awesomewm.log"

LOG = function (value_str)
    local file, err = io.open(log_file, "a")
    if file ~= nil then
        file:write(value_str)
        file:close()
    end
end
