local i = 1

-- loop: repeat .. until ..
print("repeat loop")
repeat
    print(i)
    i = i + 1
until i > 10

-- loop: while .. do .. end
print("while loop")
i = 1
while true do
    if i > 10 then
        break
    end
    print(i)
    i = i + 1
end

-- loop: for .. do .. end. similar with vb/vba/bash
print("for loop")
for j = 1, 10, 2 do
    print(j)
end
