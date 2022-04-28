--There are seven exercises in this test. By setting values in the following table, you can choose which exercises are run
exercise = {true, false, false, false, false, false, false, false}

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
-- Exercise 1: write a function for reversing order of elements in a table
-- ----------------------------------------------------------------------------------
-- see code labeled MAIN below for calling your code
-- write your code instead of comment marked SOLUTION 1
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--

--helper function for printing tables
function PrintTable(tbl)
	local s = ""
	for _, val in ipairs(tbl) do
		s = s .. val .. "\t"
	end
	print(s .. "\n")
end

--write the body of the following function
function ReverseTable(tbl)
	local s = tbl
	local r = {};

	t = (#tbl/2)*2;

	for i=0, t do
		f = s[i]
		r[i+1],r[#s-i+1] = s[#s-i], s[i]
	end

	-- String return
	--rString = "";
	--for k, v in pairs(r) do
	--	rString = rString .. v  ..  "\t";
	--end
	--print(rString);

	-- Table return
	print(table.concat(r, "\t"))
end


--[[ MAIN chunk for the Exercise 1]]--
if exercise[1] then
	local t = {1, 2, 3, 4, 5}

	print("before reverse")
	PrintTable(t)

	print("after reverse")
	ReverseTable(t)
end

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
-- Exercise 2: Switches I
-- ----------------------------------------------------------------------------------
-- In a game, there is a door that will open when all of three switches are
-- in an "ON" state. At the beginning of the level, all switches are in the
-- "OFF" state. Whenever a switch is pressed, the function OnSwitch is
-- called and it will get as a parameter the number of the switch that was
-- activated. You will have to write the body for this function that will
-- handle switch logic (on every press they change their state, i.e. go from
-- OFF to ON or from ON to OFF), and set global variable "doorOpened"
-- to "true" when all the switches are ON.
-- You will also have to write the body for the function ResetSwitches()
-- that will initialize all switches and doorOpened variable to their
-- starting state (all OFF and doorOpened == false).
-- The main chunk of this test will call function RunSwitchTest1 and 2
-- that will call OnSwitch several times and verify that the doorOpened
-- variable has always the right values.

-- Write the body for the following function
function OnSwitch(switch)
	-- Truing the false bool
	switches[switch] = not switches[switch];

	for _, v in pairs(switches) do
		if v == false then
			-- if there is just one door closed the loop breaks 
			doorOpened = false;
			break
		else
			doorOpened = true;
		end
	end
end

-- Write the body for the following function
function ResetSwitches()
	-- Reset of everything
	doorOpened = false;
	for i=1, #switches do
		switches[i] = false;
	end
end

function RunSwitchTest1()
	OnSwitch(1)
	if doorOpened then print("*** FAIL ***") return -1 end
	OnSwitch(2)
	if doorOpened then print("*** FAIL ***") return -2 end
	OnSwitch(3)
	if not(doorOpened) then print("*** FAIL ***") return -3 end
	print("*** Switch Test 1 Successful ***");
	return 0
end

function RunSwitchTest2()
	OnSwitch(1)
	if doorOpened then print("*** FAIL ***") return -1 end
	OnSwitch(2)
	if doorOpened then print("*** FAIL ***") return -2 end
	OnSwitch(1)
	if doorOpened then print("*** FAIL ***") return -3 end
	OnSwitch(3)
	if doorOpened then print("*** FAIL ***") return -4 end
	OnSwitch(1)
	if not(doorOpened) then print("*** FAIL ***") return -5 end
	print("*** Switch Test 2 Successful ***");
	return 0
end


--[[ MAIN chunk for the Exercise 2]]--
-- Declare your state variables in the following section
-- Do not modify the lines designed to test your solution
if exercise[2]  then
	-- Dynamic solution
	-- if there were more switches than 3
	-- DOG
	--[[
	numOfSw = 3
	switches = {}
	for i = 1, numOfSw, 1 do
		switches[i] = false;
	end
	--]]

	switches = {false, false, false};
	--[[SOLUTION 2: declare the variable(s) to store the switch(es) state(s) above this line but do not modify the rest of the function]]--
	doorOpened = false
	RunSwitchTest1()
	ResetSwitches()
	RunSwitchTest2()
end

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
-- Exercise 3: Prime numbers generator
-- ----------------------------------------------------------------------------------
-- This is a warm up exercise. Write code that will print prime numbers
-- smaller than 1000 such that the sums of their numerals are also prime
-- numbers. For example, 23 is such number because 2 + 3 = 5 and 5 is also
-- a prime number. On the other hand, 13 is a prime number but the sum of
-- its numerals is 4 which is not, so we do not want it. The first ten
-- numbers in this sequence are: 2, 3, 5, 7, 11, 23, 29, 41, 43, 47

--[[ MAIN chunk for the Exercise 3]]--
if exercise[3] then
	--[[ SOLUTION 3]]--
	function isPrimeNum(num)
		local num = tonumber(num);
		if not num or num<2 or (num % 1 ~=0) then 
			return false;
		elseif num > 2 and (num % 2 == 0) then 
			return false;
		elseif num > 5 and (num % 5 == 0) then 
			return false;
		else
			for i = 3, math.sqrt(num), 2 do
				if (num % i == 0) then
					return false;
				end
			end
			return true
		end
	end

	maxNumber = 1000;
	primeNumberArray = ""
	for i = 1, maxNumber, 1 do
		if isPrimeNum(i) then
			finalSum = 0;
			-- sum of the prime number digits checker
			for digit in string.gmatch(tostring(i),'%d') do
				finalSum = finalSum + digit;
			end	
			if isPrimeNum(finalSum) then
				primeNumberArray = primeNumberArray .. i .. "\t";
			end
		end
	end
	print(primeNumberArray)
end

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
-- Exercise 4: Matrix multiplication
-- ----------------------------------------------------------------------------------
-- Write a function that will multiply two matrices
-- If you do not remember matrix multiplaction, the simple rule is that (for
-- square matrix) the result has the same rank (number of rows and columns)
-- and that the element in i-th row and j-th column is the dot product of the
-- i-th row in the left matrix and j-th column in right matrix. (The dot
-- product is the sum of products of corresponding vector elements, i.e.
-- a . b = a_1 * b_1 + a_2 * b_2 ...)
-- Bonus question: write a class Matrix with methodds GetAsRows() and
-- GetAsColumns()
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--

-- BONUS 
-- DOG
-- Bonus solution under this
Matrix = 
{
	matrixArray = {}
}

function Matrix:new(m)
	this = {}
	Matrix.matrixArray = m
end

-- returns Row from set table or preset
function Matrix:GetAsRows (index, mTable)
	matrixArray = mTable or Matrix.matrixArray

	-- Valid 💯 index check
	if #matrixArray[1] >= index and 0 < index and #matrixArray ~= 0 then
		return(matrixArray[index]);
	else
		print("Incorrect Table!");
		return 0;
	end
end

-- returns Column from set table or preset
function Matrix:GetAsColumns (index, mTable)
	collumnReturn = {};
	
	matrixArray = mTable or Matrix.matrixArray

	-- Valid 💯 index check
	if #matrixArray[1] >= index and 0 < index and #matrixArray ~= 0 then
		for i = 1, #matrixArray, 1 do
			table.insert(collumnReturn, matrixArray[i][index]);
		end

		return collumnReturn;
	else
		print("Incorrect Table!");
		return 0;
	end

end
-- Bonus solution above this

--helper function for printing matrices
function PrintMatrix(m)
	if m == false then
		print("Incorrect Matrices")
		return
	end
	for _,row in ipairs(m) do
		local s = ""
		for _, val in ipairs(row) do
			s = s .. val .. "\t"
		end
		print(s)
	end
end

--write the body of the following function
-- Both matrices are supplied row-based. You do not have to check that all
-- rows have the same number of columns and that number of rows in the left
-- matrix is equal to the number of columns in the right matrix
-- make sure that your function is universal - not every matrix needs to be 3x3!
-- !parameter l: left matrix
-- !parameter r: right matrix

function MultiplyMatrices(l, r)
	--[[ SOLUTION 4]]--

	-- Inner numbers equal check
	if #l[1] ~= #r then
		return false   
	end 

	local result = {}
	for i = 1, #l do
		result[i] = {}
		for j = 1, #r[1] do
			result[i][j] = 0
			for k = 1, #r do
				result[i][j] = result[i][j] + l[i][k] * r[k][j]
			end
		end
	end
	return result
end

--[[ MAIN chunk for the Exercise 4]]--
if exercise[4] then
	local m1 =
	{
		{1, -2, 3},
		{2, -5, 10},
		{-1, 2, -2}
	}

	local m2 =
	{
		{10, -2, 5},
		{6, -1, 4},
		{1, 0, 1}
	}

	-- BONUS SOLUTION
	-- DOG
	--
	-- Matrix:new(m1)
	-- print(table.concat(Matrix:GetAsRows(3),", ")) 
	-- print(table.concat(Matrix:GetAsColumns(1, m2),", ")) 

	m2 = MultiplyMatrices(m1,m2)
	PrintMatrix(m2)
end

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
-- Exercise 5: Switches II
-- ----------------------------------------------------------------------------------
-- Similar to the first example, but this time the switches need to be pressed
-- in certain order. The switches are buttons, that is, they do not stay down
-- when pressed (they do not have ON and OFF state). Any time a button is
-- pressed, the function OnPressed is called and it will get the number of the
-- button as its parameter. You will have to write the body for this function
-- and set the variable "riddleState" to the right state. There are three
-- possible states: Off, In Progress and On. Initially, the riddle is in the
-- Off state. If the right (i.e. first) button is pressed, it goes into the
-- InProgress state and stays there as long as the right buttons are pressed.
-- If all the buttons are pressed in the right order, the riddle will go into
-- the On state. If an error is made, the riddle goes back into Off state
-- and the sequence starts from beginning.
-- The right order of switches for our riddle is 4 - 1 - 3 - 2
-- See the test function RunRiddleTest1 for examples how the riddleState
-- changes


-- Write the body of the following function

function OnPressed(switch)
	buttonOrder = {4,1,3,2}
	table.insert(numOfPressed,switch);

	for i = 1, #numOfPressed, 1 do
		if buttonOrder[i] == numOfPressed[i] then
			riddleState = 1
		elseif buttonOrder[i] ~= numOfPressed[i] then
			riddleState = 0
			numOfPressed = {}
			return
		end

		if #buttonOrder == #numOfPressed then
			riddleState = 2
			return
		end
	end
end

function RunRiddleTest1()
	OnPressed(4)
	if riddleState ~= ERiddleState.rsInProgress then print("*** Riddle Test 1 FAIL 1 ***") return -1 end
	OnPressed(1)
	if riddleState ~= ERiddleState.rsInProgress then print("*** Riddle Test 1 FAIL 2 ***") return -2 end
	OnPressed(4)
	if riddleState ~= ERiddleState.rsOff then print("*** Riddle Test 1 FAIL 3 ***") return -3 end
	OnPressed(1)
	if riddleState ~= ERiddleState.rsOff then print("*** Riddle Test 1 FAIL 4 ***") return -4 end
	OnPressed(4)
	if riddleState ~= ERiddleState.rsInProgress then print("*** Riddle Test 1 FAIL 5 ***") return -5 end
	OnPressed(1)
	if riddleState ~= ERiddleState.rsInProgress then print("*** Riddle Test 1 FAIL 6 ***") return -6 end
	OnPressed(3)
	if riddleState ~= ERiddleState.rsInProgress then print("*** Riddle Test 1 FAIL 7 ***") return -7 end
	OnPressed(2)
	if riddleState ~= ERiddleState.rsOn then print("*** Riddle Test 1 FAIL 8 ***") return -8 end
	print("*** Riddle Test 1 Successful ***");
	return 0
end


--[[ MAIN chunk for the Exercise 5]]--
if exercise[5]  then

	-- Dynamic variable declare
	numOfPressed = {}
	numOfSw = 4
	switches = {}
	for i = 1, numOfSw, 1 do
		switches[i] = i;
	end
--[[SOLUTION 5: declare the variable(s) to store the state above this line but do not modify the rest of the function]]--
	ERiddleState = { rsOff= 0, rsInProgress = 1, rsOn = 2 }
	riddleState = ERiddleState.rsOff
	RunRiddleTest1()
end


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
-- Exercise 6: Lunar lander
-- ----------------------------------------------------------------------------------
-- Your task will be writing an iterative simulation of a lunar landing.
-- The following table defines the basic physical characterstics of a lunar lander.
-- Write the body of the Land method, that takes as a parameter the amount of fuel
-- (in kilograms) burned at this iteration and calculate the new values of speed and
-- height above the surface. Your method will return 0 if the descent continues,
-- +1 if the landing was successful (i.e. the height < 0 and speed of descent is slower
-- than max_landing_speed) or -1 when the landing crashed (i.e. the height < 0 and
-- rate of descent is faster than max_landing_speed). The amount of fuel burned
-- in one iteration is limited by max_thrust. The length of the iteration is up to you,
-- about 10 s seems like a good starting choice.
-- This was a popular game back in the age of programmable calculators.
-- Physics refresher course:
--    The propulsion force F applied to the lander is:
--       F = engine_impulse * amount_of_burned_fuel / time_interval
--    This will translate to the acceleration a:
--       a = F / lander_mass
--    The engine accelaration and moon gravity will pull the lander and
--    change its speed:
--       v_new = v_old + a * time_interval - lunar_g * time_interval
--    and its height:
--       height_new = height_old + v_old * time_interval + 0.5 * (a - lunar_g) * time_interval^2
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--

lander = {
	mass = 10000, --kg, including fuel
	fuel = 4000, --kg
	speed = 0, --m/s, vertical
	height = 15000, --m above surface
	const = {
		impulse = 3000, --N * s/kg, this is thrust generated per 1 kg of fuel burned per 1 s
		g = 1.6, --m/s^2, lunar gravity
		max_landing_speed = 5, --m/s
		max_thrust = 40000, --N, maximum thrust
	}
}

-- Write the body for the following function
-- !parameter w: weight of the fuel burned in this iteration
-- !returns: 	0: descent continues,
--		1: successful landing,
--		-1: crash
function lander:Land(w)
	-- Check if player is in given distance
	if lander.height < 0 and -lander.speed < lander.const.max_landing_speed then
		return 1
	elseif lander.height < 0 and -lander.speed > lander.const.max_landing_speed then
		return -1
	end

	-- v = velocity = rychlost
	-- a = accelaration = zrychleni
	-- f = force = tlak
	-- w = fuel
	
	-- Check if time_interval wont be manual
	if time_interval == null then
		time_interval = 1;
	end

	w = math.abs(w)

	-- amount of fuel from other information formula
	-- 40000 = 3000 * w / time_interval
	-- w = 40000/3000/time_interval
	-- max fuel
	max_w = lander.const.max_thrust / lander.const.impulse / time_interval;

	-- Check if inputed fuel isnt too much considering max_thrust
	if w > max_w then
		w = max_w;
	end	

	-- Check for fuel
	if w >= lander.fuel then
		w = lander.fuel;
	end

	-- Fuel and mass decrease
	lander.fuel = lander.fuel - w;
	lander.mass = lander.mass - w;
	
	-- Thrust
	f = lander.const.impulse * w / time_interval;

	-- Accelaration
	a = f / lander.mass;

	-- New Speed
	v_old = lander.speed;
	v_new = v_old + a * time_interval - lander.const.g * time_interval;
	lander.speed = v_new;

	-- New height
	height_old = lander.height;
	height_new = height_old + v_old * time_interval + 0.5 * (a - lander.const.g) * time_interval^2;
	lander.height = height_new;
---------------------------------------------------------------------------------
	return 0
end

--[[ MAIN chunk for the Exercise 6]]--
if exercise[6] then
	step = 1
    local input = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 133, 133, 133, 0, 133, 133, 133, 133, 0, 0, 133}
    local manual_drive = false

	--UP
	--local input = 0

	local r = 0
	while r == 0 do
        print(string.format("Height: %.2f, Speed: %.2f, Fuel: %.2f", lander.height, lander.speed, lander.fuel))

        local w = 0
        if manual_drive then
            print("Enter amount of fuel to burn:")
            io.flush()
            w = io.read()
        else
			-- For successful landing comment THIS and uncomment THAT and UP above 
			-- DOG

			-- THAT
			--input = input + 0.043047; 
			--w = input

			-- THIS
			if step < #input + 1 then
                w = input[step]
            end
				
            print("Fuel burned: ", w)
        end
		r = lander:Land(1 * w) --multiplaction converts string to number
        step = step + 1
        if step > 1000 then
            print("Lunar lander does not land")
            r = -2
        end
	end
	if r == 1 then
		print("success")
	else
		print("CRASH")
	end
end

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Exercise 7:  car steering
-- ---------------------------------------------------------------------------------
-- Look at the following definitions of the classes wayPoint and car
-- The car can be controlled like a car in "graph paper simulation" you might
-- have played as a kid. The car speed is defined as a "vector" of two integers:
-- number of squares to move on x (left-right) axis and y (up-down) axis every
-- turn. The speed of the car can change at most by 1 in either direction.
-- Some examples:
--   speed {0, 0}: car is standing
--   speed {3, 3}: car is going in upper right direction. After maximum possible
--     braking, its speed will be {2, 2}, after maximum possible acceleration it
--     will be {4, 4}. Other possible new speeds are {3, 4}, {3, 2}, {4, 3}, {4, 2},
--     {2, 4}, {2, 3} and of course {3, 3}.
-- Your task is to write the function Steer that takes as parameters a car
-- and waypoint and output 2 numbers that define change of speed. Either number
-- can only be equal to -1, 0 or +1. The Steer function must take the car to
-- waypoint and let it stop there. The fewer steps you take to get there
-- the better. (Our reference solution takes 6 steps)

-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --
-- :: class WayPoint ::--
wayPoint =
{
	x = 0,
	y = 0,
	r = 1
}

-- :: Constructor for WayPoint
function wayPoint:new(xx, yy, rr)
	this = {}
	setmetatable(this, self)
	self.__index = self
	self.x = xx or self.x
	self.y = yy or self.y
	self.r = rr or self.r
	return this
end

-- :: Is point in waypoint range?
-- !parameter xx: x position of the car
-- !parameter yy: y position of the car
-- !returns: true if the car distance from waypoint is less than wayPoint.range, false otherwise
function wayPoint:IsInRange(xx,yy)
	local d = self:GetDistanceSq(xx, yy)
	if d < self.r * self.r then
		return true
	end
	return false
end

-- :: Get direction from car to waypoint
-- !parameter xx: x position of the car
-- !parameter yy: y position of the car
-- !returns: normalized vector pointing from car to the waypoint
function wayPoint:GetDirection(xx, yy)
	local dx = self.x - xx
	local dy = self.y - yy
	local n = math.sqrt(dx * dx + dy * dy)
	if n == 0 then
		n = 1
	end
	return dx/n, dy/n
end

-- :: Get squared distance from car to waypoint
-- !parameter xx: x position of the car
-- !parameter yy: y position of the car
-- !returns: square of distance between car and waypoint
function wayPoint:GetDistanceSq(xx, yy)
	local dx = self.x - xx
	local dy = self.y - yy
	return dx * dx + dy * dy
end
-- :: End of WayPoint class
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --


-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --
-- :: Class Car ::--
car =
{
	speed = {x = 1; y = 0},
	position = {x = 0; y = 0}
}

-- :: Update speed and move the car
-- Speed is first updated, than the position is updated with the new speed
-- !parameter vx: horizontal change of speed (can only be -1, 0 or +1)
-- !parameter vy: vertical change of speed (can only be -1, 0 or +1)
function car:Move(vx, vy)
	assert((vx * vx == 1) or vx == 0, "Invalid vx");
	assert((vy * vy == 1) or vy == 0, "Invalid vy");
	self.speed.x = self.speed.x + vx
	self.speed.y = self.speed.y + vy
	self.position.x = self.position.x + self.speed.x
	self.position.y = self.position.y + self.speed.y
end
-- :: End of Car class
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --


-- helper function for plotting the car and waypoint position
function Plot(c, w)
	print("========Position=", c.position.x, c.position.y, "===Speed=", c.speed.x, c.speed.y);
	for y = 0,20 do
		local s = ""
		for x = 0,40 do
			if (w.x == x) and (w.y == y) then
				s = s .. " +"
			elseif (c.position.x == x) and (c.position.y == y) then
				s = s .. " O"
			elseif ((c.position.x + c.speed.x) == x) and ((c.position.y + c.speed.y) == y) then
				s = s .. " o"
			else
				s = s .. " ."
			end
		end
		print(s)
	end
end


function Steer(c, w)
	--[[SOLUTION 7]]--
	-- I also noticed I made the car drift, try waypoint 0 0, car 40 20
	-- Pretty cool right, bonus points?
	-- DOG

	speedLimit = 4;

	breakX = wayPoint.x - car.position.x;
	breakY = wayPoint.y - car.position.y;

	-- Check in which dir the car is driving A/D W/S
	if car.speed.x < 0 then
		minusX = -1
	else
		minusX = 1
	end
	
	if car.speed.y < 0 then
		minusY = -1
	else
		minusY = 1
	end
	
	-- Check if car should accelerate (to right) judging by the distance 
	if breakX > (car.speed.x * car.speed.x)*minusX then
		if math.abs(car.speed.x) == 1 and breakX == math.abs(car.speed.x) * 2 then
			returnX = 0
			-- Check of speed exceeding 
		elseif car.speed.x ~= speedLimit then
			returnX = 1
		else
			returnX = 0
		end
	-- Check if car should accelerate (to left) judging by the distance 
	elseif breakX < (car.speed.x * car.speed.x)*minusX  then
		if math.abs(car.speed.x) == 1 and breakX == math.abs(car.speed.x) * 2 then
			returnX = 0
		elseif car.speed.x ~= -speedLimit then
			returnX = -1
		else
			returnX = -0
		end
	else
		returnX = 0
	end

	-- Check if car should accelerate (to top) judging by the distance 
	if breakY > (car.speed.y * car.speed.y)*minusY then
		if math.abs(car.speed.y) == 1 and breakY == math.abs(car.speed.y) * 2 then
			returnY = 0
		elseif car.speed.y ~= speedLimit then
			returnY = 1
		else
			returnY = 0
		end
	-- Check if car should accelerate (to bottom) judging by the distance 
	elseif breakY < (car.speed.y * car.speed.y)*minusY then
		if math.abs(car.speed.y) == 1 and breakY == math.abs(car.speed.y) * 2 then
			returnY = 0
		elseif car.speed.y ~= -speedLimit then
			returnY = -1
		else
			returnY = -0
		end
	else
		returnY = 0
	end

	return returnX, returnY
end


--[[ MAIN chunk for the Exercise 7]]--
if exercise[7] then
	local wp = wayPoint:new(10,10,2)
	for i = 1,100 do
		Plot(car, wp)
		local vx, vy = Steer(car, wp)
		car:Move(vx, vy)
		if wp:IsInRange(car.position.x, car.position.y) and (car.speed.x == 0) and (car.speed.y == 0) then
			print("Target reached in", i, "iterations")
			break
		end
	end
end

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Exercise 8: Sorting robots
-- ---------------------------------------------------------------------------------
-- It is a roll call time in robot land. Robots are standing on the field, but
-- unfortunately they are not ordered by size.
-- The roll call field can be imagine as one-dimensional array of spots, each
-- of which can be occupied by only one robot at the time.
-- Using the methods of the roll call object:
--      is_pos_free -- tests if a position is occupied by a robot or not
--      which_is_smaller -- for two robots tests which of them is smaller
--      walk_robot -- tell a robot to walk from one place to another
-- arrange the robots by size from the smalles to the largest, starting
-- from position 1.
-- Measuring robots and walking them arround, so the robots keep track
-- of how much of this they have to do. At the end of shuffling around they
-- will tell you what was the total cost of your instructions. Try to make
-- this number as small as possible. Our reference solution has cost 4218.
-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --
-- :: class Robot ::--
robot =
{
    pos = 0,
    size = 0,
	comparisons = 0,
    walked = 0,

    new = function(self, ppos, ssize)
        this = {}
        setmetatable(this, self)
        self.__index = self
        this.pos = ppos
        this.size = ssize
        return this
    end,

    -- get robot's size
    get_size = function(self)
        self.comparisons = self.comparisons +1
        return self.size
    end,

    -- walk and remember how much you walked
    walk = function(self, destination)
        self.walked = self.walked + math.abs(self.pos - destination)
        self.pos = destination
    end,

    -- used i.a. by roll_call:dump()
    dump = function(self)
        print("Pos: \t" .. self.pos, "Size: \t" .. self.size, "Comp: " .. self.comparisons, "Walk: " .. self.walked)
    end
}

-- :: class RollCall :: --
function MakeRollCall()
    local self = {
        -- this table will hold the robots
        robots = { },
        n_robots = 0,
        max_pos = 0,
        -- this is the cost of walking and making comparisons respectively
        walk_cost = 1,
        comp_cost = 1,
    }

    -- returns true if the position in the roll_call is empty
    local is_pos_free = function(pos)
        return self.robots[pos] == nil
    end

     -- calculate total cost of robot manipulation so far
    local total_cost = function()
        local walk_cost = 0
        local comp_cost = 0
        for i = 1, self.max_pos do
            if not(is_pos_free(i)) then
                walk_cost = walk_cost + self.robots[i].walked
                comp_cost = comp_cost + self.robots[i].comparisons
            end
        end
        walk_cost = walk_cost * self.walk_cost
        comp_cost = comp_cost * self.comp_cost
        return walk_cost + comp_cost, walk_cost, comp_cost
    end

    -- returns the postion where the smaller robot stands
    -- if pos1 or pos2 is actually empty, returns nil
    local which_is_smaller = function(pos1, pos2)
        if (is_pos_free(pos1) or is_pos_free(pos2)) then
            return nil
        end
        if self.robots[pos1]:get_size() < self.robots[pos2]:get_size() then
            return pos1
        else
            return pos2
        end
    end

    -- let the robot at position from_pos walk to position to_pos and return 0
    -- if from_pos is empty or to_pos is full, function returns 1 or 2
    local walk_robot = function(from_pos, to_pos)
        if (is_pos_free(from_pos)) then
            print("Cannot move robot at " .. from_pos .." to " .. to_pos .. "that position is empty")
            return 1
        end
        if not (is_pos_free(to_pos)) then
            print("Cannot move robot to " .. to_pos .." from " .. from_pos .. " that position is not empty")
            return 2
        end
        if (to_pos > self.max_pos) then
            self.max_pos = to_pos
        end
        self.robots[from_pos]:walk(to_pos)
        self.robots[to_pos] = self.robots[from_pos]
        self.robots[from_pos] = nil
        return 0
    end

    local is_ordered = function()
        if (is_pos_free(1)) then
            return false
        end
        for i = 2, self.n_robots do
            if (is_pos_free(i)) then
                return false
            end
            if (self.robots[i].size < self.robots[i - 1].size) then
                return false
            end
        end
        return true
    end

    -- print out all the robots on roll_call
    local dump = function()
        for i = 1, self.max_pos do
            if (is_pos_free(i)) then
                print("Position " .. i .. " is empty")
            else
                self.robots[i]:dump()
            end
        end
    end

    -- returns number of robots present
    local get_n_robots = function()
        return self.n_robots
    end

    --local sizes = { 3, 2, 4, 1, 5 , 8, 9}
    local sizes = {41, 59, 60, 95, 33, 14, 12, 98, 84, 38, 50, 57, 80, 61, 1, 71, 97, 83, 29, 51, 62, 44, 2, 18, 15, 24, 35, 46, 67, 13, 23, 73, 34, 36, 53, 56, 90, 19, 8, 45, 28, 32, 39, 5, 9, 3, 99, 48, 26, 47, 43, 76, 72, 40, 27, 17, 64, 58, 20, 89, 31, 94, 21, 4, 65, 69, 93, 16, 66, 22, 10, 42, 77, 88, 85, 86, 7, 63, 25, 54, 68, 75, 81, 30, 55, 52, 11, 100, 6, 91, 82, 96, 74, 78, 79, 92, 87, 37, 70, 49}
    for i = 1, #sizes do
        self.robots[i] = robot:new(i, sizes[i])
    end
    self.max_pos = #sizes
    self.n_robots = #sizes

    return {
        total_cost = total_cost,
        is_pos_free = is_pos_free,
        which_is_smaller = which_is_smaller,
        walk_robot = walk_robot,
        is_ordered = is_ordered,
        dump = dump,
        get_n_robots = get_n_robots
    }
end

-- ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --
--[[ MAIN chunk for the Exercise 8]]--
if exercise[8] then
    roll_call = MakeRollCall()

	--[[SOLUTION 8]]--

	-- Back To Back Bubble sort
	-- Proprably not very good and efficient
	-- But with defining blind array i couldnt come
	-- up with nothing better, but hey, it works :thumbsup:
	-- plus i spent too much time on this exercise
	-- that i think it gave me a bit of brain damage

	-- I think the syntax is not very good either
	-- but im too afraid if I move with something it wont work

	-- DOG

	function checkSmaller(a, b, i, switchON)
		-- switch which determines if 
		-- the code is going forward or backwards
		if switchON then
			switchNum = 1
		else
			switchNum = -1
		end

		-- Start to End sorting
		if switchON then
			smaller = roll_call.which_is_smaller(a, b);
			if smaller == a then
				roll_call.walk_robot(a, emptySpace)
				emptySpace = emptySpace + switchNum;
				if len == i then
					roll_call.walk_robot(len,len-1)
				end	
			elseif smaller == b then
				roll_call.walk_robot(b, emptySpace)
				emptySpace = emptySpace + switchNum;
				roll_call.walk_robot(emptySpace, b)
				if len == i then
					roll_call.walk_robot(len,len-1)
				end	
			else
				if len == i then
					roll_call.walk_robot(len,len-1)
				end	
				return 3
			end
		else
		-- End to Start sorting
			smaller = roll_call.which_is_smaller(a, b);
			if smaller == b then
				roll_call.walk_robot(a, emptySpace)
				emptySpace = emptySpace + switchNum;
			elseif smaller == a then
				roll_call.walk_robot(b, emptySpace)
				emptySpace = emptySpace + switchNum;
				roll_call.walk_robot(emptySpace, b)
				if 1 == i then
					roll_call.walk_robot(1,2)
				end	
			else
				if 1 == i then
					roll_call.walk_robot(1,2)
				end	
				return 3
			end
		end
	end

	len = roll_call.get_n_robots();

	smallestNumber = 1;
	emptySpace = 1;
	roll_call.walk_robot(1,len+1)
	len = roll_call.get_n_robots() + 1;


	while roll_call.is_ordered() == false do
		-- Left to Right ---->
		for q = 1, len, 1 do
			for i = q+1, len, 1 do
				if checkSmaller(q,i,i,true) == 3 then
					break
				end		
			end
		end	
		emptySpace = len;
	
		if roll_call.is_ordered() then
			break
		end

		-- Right to Left <----
		for q = len, 1, -1 do
			for i = q, 1, -1 do
				if checkSmaller(q,i-1,i,false) == 3 then
					break
				end		
			end
		end	
		if roll_call.is_ordered() then
			break
		end
		emptySpace = 1;
	end
	-- solution above this line


    print(roll_call.is_ordered())
    t, w, c = roll_call.total_cost()
    print("Total cost was: " .. t, "Walking cost was:" .. w, "Comparison cost was: " .. c)

end
