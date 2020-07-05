-- I wanna sayhello to sth
local function sayhello(name)
    print("hello " .. name)
end
-- a table to store sth whom I wanna sayhello to
local names = {
    "ZL",
    "world!",
    "Lua",
    "bash"
}

-- sayhello to everyone
for _, v in ipairs(names) do
    sayhello(v)
end


-- I wanna create a factorial function
local function factorial(n)
    -- a basic yet recursive function to calculate factorial
    if n < 2 then
        return 1
    else
        return n * factorial(n-1)
    end
end

-- I wanna build a tail-recursion function to calculate factorial
-- interesting: lua function doesnt support optional argument?
local function factorial2(n, a)
    if n == 1 then
        return a
    else
        return factorial2(n-1, n*a)
    end
end


print(factorial(5))
print(factorial2(5, 1))
