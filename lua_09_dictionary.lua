local t = {}

-- dont notation
t["a"] = 1
t["b"] = 2
t["c"] = 4

print(t)

for k, v in pairs(t) do
    io.write(string.format("k=%s, v=%d", k, v),"\n")
end
