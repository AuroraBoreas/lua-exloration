-- I wanna write data into a txt file
local file_name = "hello.txt"
local f = io.open(file_name, "w")
-- surprisingly, column is used in lua when doing FileIO
f:write("hello lua")
f:close()

-- I wanna read data from the text file
f = io.open(file_name, 'r')
local data = f:read()
f:close()
print(data)
