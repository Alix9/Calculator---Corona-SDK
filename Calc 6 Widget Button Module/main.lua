-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

-- -----------------------------------------------------------
-- Hide the status bar
-- -----------------------------------------------------------
display.setStatusBar(display.HiddenStatusBar)
-- -----------------------------------------------------------

--------------------------------------------------------------
-- Load back.png
--------------------------------------------------------------
local back = display.newImageRect( "back.png", 320, 480 )
back.x = display.contentCenterX
back.y = display.contentCenterY
--------------------------------------------------------------

--------------------------------------------------------------
-- create a text field 
--------------------------------------------------------------
local display_text = display.newText( "0", 0, 0, "04b03", 48 )
-- display_text:setTextColor( 255, 200, 129 )
display_text:setFillColor( 1, 0.78, 0.5 )
-- display_text:setReferencePoint( display.TopRightReferencePoint )
display_text.anchorX = 1
display_text.anchorY = 0
display_text.x = display.contentWidth - 10
display_text.y = 5
---------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- Import the widget and calculator modules
-----------------------------------------------------------------------------------------
local widget = require( "widget" )
local calculator = require( "calculator" )
-----------------------------------------------------------------------------------------










------------------------------------------------------------------------------------------------
-- function handles button taps
------------------------------------------------------------------------------------------------
-- This function handles all buttons when they are pressed. 
-- It figures out which key was pressed and calls the appropriate function above. 
function on_button(event)
	local key = event.target.id -- get the id of the key
	local value = calculator.calculate( key )
	display_text.text = value
end
------------------------------------------------------------------------------------------------





-----------------------------------------------------------------------------------------
-- Make some buttons and position them 
-----------------------------------------------------------------------------------------
-- Define a table with all of the default properties for ech button. 
local options = {id="1", 
					    width=62, 
					    height=62,
					    label="1", 
					    labelColor={ default={ 1, 1, 1 }, over={ 0 } },
					    labelXOffset=2,
					    labelYOffset=-2,
					    font="04b03",
						fontSize=32,
					    onPress=on_button }
						
-- Create all buttons. 
-- For each button change the label and id properties of the button_properties table. 
options.label = "1"
options.id = "1"
local button_1 = widget.newButton( options )

print( button_1.x )

button_1.x = 100
button_1.y = 130

options.label = "3"
options.id = "3"
local button_3 = widget.newButton( options )

button_3.x = 160
button_3.y = 130


options.label = "."
options.id = "."
local button_dot = widget.newButton( options )

button_dot.x = 220
button_dot.y = 130

options.label = "X"
options.id = "*"
local button_multiply = widget.newButton( options )

button_multiply.x = 280
button_multiply.y = 130

options.label = "="
options.id = "="
local button_equal    = widget.newButton( options )
button_equal.x = 100
button_equal.y = 190

options.label = "C"
options.id = "c"
local button_clear    = widget.newButton( options )
button_clear.x = 40
button_clear.y = 190

-- Position buttons on screen
-- Groups of buttons share columns and rows. 
-- Here I defined values for each column and each then set the x and y for buttons in each 
-- row and column. These poisitions are based on the size of the buttons which is set above.
