--[[
How to understand metatable in Lua @ Nicol Bolas, SO

A metatable is simply a table that is used to control the behavior of another table (or userdata). A table is a metatable only because it is used as a metatable. That is, being a "metatable" is not a fundamental property of a table. There is no "create_metatable" function or anything. It's just the name we use for a table which is used to control other tables.

Certain operations on tables (or userdata) are specified to check the table's metatable first. If the table (or userdata) has a metatable, and that metatable has a certain key/value pair in it, then the operation will use that key/value pair to perform that operation instead of the normal logic.

Each operation which can be overridden by a metatable has a specific key name associated with it. So if you try to perform addition on a table, the system will look for the __add key in the metatable in order to access it.

The value in the pair is usually (though not always) a function. Such functions are generally called "metafunctions". The parameters it takes and the meaning of its return value is defined by the particular operation calling it. A few operations allow the value to be a table or something else.

In Lua, you assign a metatable to a table (but not userdata) with the setmetatable function. From C, you use the lua_setmetatable function to assign a table (or userdata) a metatable.

Metatables are particularly important for C code that exposes C objects as userdata. Raw userdata is just an opaque blob of bits; Lua defines very few legal operations that can be performed on them by default. But by assigning them a metatable, you can give the userdata more abilities through metafunctions.

]]

--[[
    understand self in Lua @ Planet_Granite, devforum.roblox.com

Assuming I have understood your post correctly, self is a Lua variable that is automatically assigned to when doing OOP related programming.

In Lua there are two ways to call a method.

someObject.Method()
and

someObject:Method()
These lines of code will both call the same method, however they’ll do something slightly different with the arguments.

local someObject = {
  Method = print
}

someObject.Method("Test") --> "Test"
someObject:Method("Test") --> table: 0x0000, "Test"
The reason you get table: 0x000 is because the object on which you call the method is passed as an argument automatically when using the : operator.

Now, where does the self variable fit into all of this? Well, you can also define a function using the same syntax as I have shown you above.

function someObject.Method(a, b)
  -- self does not exist here
end
and

function someObject:Method(a, b)
  -- self exists here
end
The difference is that the second example will also have the self variable defined and it’ll be set to the first value passed to the method.

For example

function someObject:Method()
  print(self)
end
someObject.Method("Test") --> "Test"
tl;dr the following two Lua snippets will do exactly the same thing.

function someObject.Method(self)
  print(self)
end

function someObject:Method()
  print(self) -- self is automatically defined
end
]]

-- I wanna check if table has a metatable
local t = {}
print(getmetatable(t)) -->nil

-- I wanna set metatable for a table
local t1 = {}
setmetatable(t, t1)
assert(getmetatable(t) == t1)

-- A base class
Shape = {area = 0}

-- Base class method new

function Shape:new (o,side)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   side = side or 0
   self.area = side*side;
   return o
end

-- Base class method printArea

function Shape:printArea ()
   print("Shape area = ",self.area)
end

-- Creating an object
local myshape = Shape:new(nil,10)
myshape:printArea()

Square = Shape:new()

-- Derived class method new

function Square:new (o,side)
   o = o or Shape:new(o,side)
   setmetatable(o, self)
   self.__index = self
   return o
end

-- Derived class method printArea

function Square:printArea ()
   print("Square area =",self.area)
end

-- Creating an object
local mysquare = Square:new(nil,10)
mysquare:printArea()

-- derived rectangle class
Rectangle = Shape:new()
function Rectangle:new(o, length, width)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.length = length or 0
    self.width = width or 0
    self.area = length * width
    return o
end

function Rectangle:printArea()
    print("Rectangle area = ", self.area)
end

local myrect = Rectangle:new(nil, 10, 20)
myrect:printArea()
