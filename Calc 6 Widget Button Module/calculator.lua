
local M = {}
-----------------------------------------------------------------------------------------
-- These define the string used for operations by the calculator
-- Your buttons should assign these strings as the id to each button.
-----------------------------------------------------------------------------------------
local DOT = "."			-- Decimal
local ADD = "+"			-- Add
local SUBTRACT = "-"	-- Subtract
local MULTIPLY = "*"	-- Multiply
local DIVIDE = "/"		-- Divide
local EQUAL = "="		-- Equal
local CLEAR = "c"		-- Clear
local PERCENT = "%"		-- Percent -- value * current / 100

local total_digits = 9	-- This sets the total number of digits displayed by the calculator

local value = 0
local lastOperation = CLEAR
local decimalPlace = 1.0
local current = 0 


-- Save operations 
local operations_array = {}



-----------------------------------------------------------------------------------------
-- define some functions to handle the calculator 
-----------------------------------------------------------------------------------------
-- This function updates the display to show the current value
function update( n )				-- This function displays the value in the text field 
	-- *** try trimming the string to a number o digits to fit the field when using a fixed width font
	n = tostring( n )				-- Convert the number to a string
	n = n:sub( 1, total_digits )	-- get characters 1 to 9
	-- ***
	-- **********************************************************
	-- For testing display the variables used for calculations
	-- print(  "current???:" .. current .. " operator:" .. lastOperation .. " value:" .. value .. " decimal:" .. decimalPlace )
	-- *********************************************************
end 

-- This handles a digit when pressed
function pressDigit( n )
	if lastOperation == EQUAL then 
		lastOperation = CLEAR
	end 
	
	if decimalPlace >= 1 then 
		current = ( current * 10 ) + n
	else 
		current = current + ( n * decimalPlace )
		decimalPlace = decimalPlace * 0.1
	end 
	update( current )
end 

-- Press the dot figure the decimal 
function pressDot()
	if lastOperation == EQUAL then 
		lastOperation = CLEAR
	end 
	
	if lastOperation == CLEAR then 
		
	end  
	
	if decimalPlace == 1.0 then 
		decimalPlace = 0.1
	end 
end 

-- This handles an operator
function pressOperation( op ) 
	
	print("current:", current, "op", op, "value", value)
	
	if lastOperation ~= EQUAL then
		operations_array[#operations_array+1] = current
	end
	operations_array[#operations_array+1] = op
	
	if lastOperation == ADD then 
		value = value + current
	elseif lastOperation == SUBTRACT then 
		value = value - current
	elseif lastOperation == MULTIPLY then  
		value = value * current
	elseif lastOperation == DIVIDE then  
		value = value / current
	elseif lastOperation ~= EQUAL then 
		value = current 
		-- print("~= EQUAL")
	elseif lastOperation == PERCENT then 
		value = value * current / 100
	end 
	
	lastOperation = op
	decimalPlace = 1.0
	current = 0
	
	if op == EQUAL then 
		print("*** value", value)
		operations_array[#operations_array+1] = value
	end 
		
	if op == CLEAR then 
		value = 0
		operations_array = {}
	end 
	
	update( value )
end 
-----------------------------------------------------------------------------------------



local function get_array()
	return operations_array
end 
M.get_array = get_array

------------------------------------------------------------------------------------------------
-- function calculator key presses
------------------------------------------------------------------------------------------------
-- This function handles all buttons when they are pressed. 
-- It figures out which key was pressed and calls the appropriate function above. 
local function calculate( key )
	if key == DOT then 
		pressDot() 
	elseif string.find( "0123456789", key ) then -- The character is a number
		pressDigit( tonumber( key ) )
	else
		pressOperation( key ) 
		return value
	end 
	return current
end
M.calculate = calculate
------------------------------------------------------------------------------------------










-------------
-- Experimenting
local selectedNumber = 0
local runningTotal = 0
local method = ""
local function calculate2(key)
	if string.find("1234567890", key) then 
		local n = tonumber(key)
		selectedNumber = selectedNumber * 10 + n
	else 
		method = key
	end 
	
end 
M.calculate2 = calculate2
-------------












------------------------------------------------------------------------------------------------
return M