function parse()
   for line in buffer:gmatch("[^\r\n]+") do
     -- DEBUG print("line:"..line)
     if(string.find(line,"$")) then
       for word in line:gmatch("%S+") do
        print("word:"..word)
       end
     end
   end
end

dofile("screen.lua") -- load display handlers
init_display()       -- set up screen
charsize=45 -- calc chars per screen width using size
blocksize=math.floor(320/charsize) 
buffsize=string.len(buffer)
bstart=213
tmr.alarm( 3 , 500 , 0 , function() parse(); end)
-- DEBUG 
print(buffer)
