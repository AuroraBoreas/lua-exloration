Class = {}

function Class:new(super)
    local class, metatable, properties = {}, {}, {}
    class.metatable = metatable
    class.properties = properties

    function metatable:__index(key)
        local prop = properties[key]
        if prop then
            return prop.get(self)
        elseif class[key] ~= nil then
            return class[key]
        elseif super then
            return super.metatable.__index(self, key)
        else
            return nil
        end
    end

    function metatable:__newindex(key, value)
        local prop = properties[key]
        if prop then
            return prop.set(self, value)
        elseif super then
            return super.metatable.__newindex(self, key, value)
        else
            rawset(self, key, value)
        end
    end

    function class:new(...)
        local obj = setmetatable({}, self.metatable)
        if obj.__new then
            obj:__new(...)
        end
        return obj
    end

    return class
end

ElectronicDevice = Class:new()

function ElectronicDevice:__new()
    self.isOn = false
end

ElectronicDevice.properties.isOn = {}
function ElectronicDevice.properties.isOn:get()
    return self._isOn
end
function ElectronicDevice.properties.isOn:set(value)
    self._isOn = value
end

function ElectronicDevice:Reboot()
    self._isOn = false
    self:ResetHardware()
    self._isOn = true
end

Router = Class:new(ElectronicDevice)

Modem = Class:new(ElectronicDevice)

function Modem:WarDialNeighborhood(areaCode)
    local cisco = Router:new()
    cisco:Reboot()
    self:Reboot()
    if self._isOn then
        self:StartDialing(areaCode)
    end
end
