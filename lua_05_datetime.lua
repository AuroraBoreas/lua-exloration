-- I wanna timer my program's runtime
local start = os.time()
-- Show me cpu clock used program
print("cpu clock:", os.clock())
-- Show me current datetime
print("date time now:", os.date())
local over = os.time()
print("runtime :", os.difftime(over, start))
