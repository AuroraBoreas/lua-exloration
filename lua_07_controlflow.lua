io.write("please input your age:")
--[[
    read user input,
    convert user input from string to integer
]]
local user_input = math.tointeger(io.read())

if user_input < 8 then
    io.write("go to primary school" .. "\n")
elseif user_input <= 12 and user_input >8 then
    io.write("go to middle school" .. "\n")
elseif user_input <=16 and user_input >12 then
    io.write("go to high school" .. "\n")
elseif user_input <=20 and user_input >16 then
    io.write("go to university" .. "\n")
end

