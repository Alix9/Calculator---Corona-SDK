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

-----------------------------------------------------------------------------------------
-- Import the widget module
-----------------------------------------------------------------------------------------
local widget = require( "widget" )
-----------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------
-- Define some variables for the program
-----------------------------------------------------------------------------------------

-- These variables help with the layout position of UI elements
local button_width = 62
local button_height = 62
local button_margin = 10
local margin = 20
local font_size = 36
local display_width = display.contentWidth - ( margin * 2 )	-- Figure the width of the screen less the margins
-----------------------------------------------------------------------------------------




------------------------------------------------------------------------------------------------
-- create a text field 
------------------------------------------------------------------------------------------------
-- Use this to create a colored field behind the display
-- local display_back = display.newRect(margin, margin, display_width, 70) 

-- Create a text field to display the calculator value
local display_txt = display.newText( "0", 0, 0, "7LineDigital", 48 ) -- I used a custom font
display_txt.anchorX = 1
display_txt.anchorY = 0
display_txt:setTextColor(0, 0, 0) 							-- Set the color of the text
display_txt.x = display.contentWidth - (margin + 10)			-- Position the text field
display_txt.y = margin											-- 
------------------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------
-- Load the calculator module
-----------------------------------------------------------------------------------------
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
	display_txt.text = value
	display_txt.anchorX = 1
	display_txt.anchorY = 0
	display_txt.x = display.contentWidth - ( margin + 10 )
	display_txt.y = margin
end
------------------------------------------------------------------------------------------------





-----------------------------------------------------------------------------------------
-- Make some buttons and position them 
-----------------------------------------------------------------------------------------
-- Define a table with all of the default properties for ech button. 
local button_properties = {id="1", 
					    width=62, 
					    height=62,
					    label="1", 
					    labelColor={ default={ 1, 1, 1, 1 }, over={ 0 } },
					    offset=-2,
					    fontSize=font_size, 
					    font="04b03",
						fontSize=32,
					    onPress=on_button }
						
-- Create all buttons. 
-- For each button change the label and id properties of the button_properties table. 
button_properties.label = "1"
button_properties.id = "1"
local button_1 = widget.newButton( button_properties )

button_properties.label = "2"
button_properties.id = "2"
local button_2 = widget.newButton( button_properties )

button_properties.label = "3"
button_properties.id = "3"
local button_3 = widget.newButton( button_properties )

button_properties.label = "4"
button_properties.id = "4"
local button_4 = widget.newButton( button_properties )

button_properties.label = "5"
button_properties.id = "5"
local button_5 = widget.newButton( button_properties )

button_properties.label = "6"
button_properties.id = "6"
local button_6 = widget.newButton( button_properties )

button_properties.label = "7"
button_properties.id = "7"
local button_7 = widget.newButton( button_properties )

button_properties.label = "8"
button_properties.id = "8"
local button_8 = widget.newButton( button_properties )

button_properties.label = "9"
button_properties.id = "9"
local button_9 = widget.newButton( button_properties )

button_properties.label = "."
button_properties.id = "."
local button_dot = widget.newButton( button_properties )

button_properties.label = "+"
button_properties.id = "+"
local button_plus     = widget.newButton( button_properties )

button_properties.label = "-"
button_properties.id = "-"
local button_minus    = widget.newButton( button_properties )

button_properties.label = "X"
button_properties.id = "*"
local button_multiply = widget.newButton( button_properties )

button_properties.label = "/"
button_properties.id = "/"
local button_divide   = widget.newButton( button_properties )

button_properties.label = "C"
button_properties.id = "c"
local button_clear    = widget.newButton( button_properties )

button_properties.label = "="
button_properties.id = "="
button_properties.height = 210
local button_equal    = widget.newButton( button_properties )

button_properties.label = "0"
button_properties.id = "0"
button_properties.width = 130
button_properties.height = button_height
local button_0 = widget.newButton( button_properties )



-- Position buttons on screen
-- Groups of buttons share columns and rows. 
-- Here I defined values for each column and each then set the x and y for buttons in each 
-- row and column. These poisitions are based on the size of the buttons which is set above.

-- Define an x position for each column
local button_col_1 = margin + ( button_width / 2 )
local button_col_2 = button_col_1 + button_width + button_margin
local button_col_3 = button_col_1 + (( button_width + button_margin ) * 2)
local button_col_4 = button_col_1 + (( button_width + button_margin ) * 3)

-- Define a y position for each row
local button_row_0 = 210 - ( button_height + button_margin )
local button_row_1 = 210
local button_row_2 = button_row_1 + button_height + button_margin
local button_row_3 = button_row_1 + ( (button_height + button_margin) * 2 )
local button_row_4 = button_row_1 + ( (button_height + button_margin) * 3 )

button_7.x = button_col_1
button_4.x = button_col_1
button_1.x = button_col_1
button_0.x = 88
button_clear.x = button_col_1

button_8.x = button_col_2
button_5.x = button_col_2
button_2.x = button_col_2
button_dot.x = button_col_3

button_9.x = button_col_3
button_6.x = button_col_3
button_3.x = button_col_3
button_equal.x = button_col_4

button_divide.x = button_col_2
button_multiply.x = button_col_3
button_minus.x = button_col_4
button_plus.x = button_col_4

button_clear.y = button_row_0

button_7.y = button_row_1
button_8.y = button_row_1
button_9.y = button_row_1
button_divide.y = button_row_0

button_4.y = button_row_2
button_5.y = button_row_2
button_6.y = button_row_2
button_multiply.y = button_row_0

button_1.y = button_row_3
button_2.y = button_row_3
button_3.y = button_row_3
button_minus.y = button_row_0

button_0.y = button_row_4
button_dot.y = button_row_4
button_equal.y = 354
button_plus.y = button_row_1
------------------------------------------------------------------------------------------------






