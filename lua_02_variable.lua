--[[
    w/o local, a is global variable.
    it means a can be accessed from other namespaces.
    with local, b is local. access of b is constrained in this namespace only.
]]
A = 1
local b = 2

print("a:", A)
print("b:", b)
