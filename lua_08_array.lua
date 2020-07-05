local arr = {
    1, 2, 3, 4, 5, 6
}

for k, v in ipairs(arr) do
    print(string.format("k=%d, v=%d", k, v))
end

-- difference between ipairs() and pairs()
-- ipairs() behaves to loop from index 1, 2 .. stop if gap appears
print("ipairs()")
for i,v in ipairs({[1]='a', [2]='b', [4]='d'}) do
    print(i,v)
end
print("pairs()")
for i,v in ipairs({[2]='a', [3]='b', [4]='d'}) do
    print(i,v)
end
