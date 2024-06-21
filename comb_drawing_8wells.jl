#!/snap/bin/julia

using Luxor

base_x = 58mm
base_y = 8mm

side_x = 5mm
side_y = 8mm

ear_x = 5mm
ear_y = 5mm

nb_wells = 8

interval_scale = 0.4

well_x = base_x/(nb_wells*(interval_scale+1)-interval_scale)
well_y = 10mm
interval_x = interval_scale * well_x


Drawing(297mm,210mm,"comb8.svg")
origin()
#make base
#background("black")
sethue("black")
#fontsize(50)
#text("hello world")


#make main line 


#---------------------------------------------------------
#
#
#
#
setline(1)
x_end_main_line = base_x+(2*side_x)+(2*ear_x)

points = Point[]
push!(points, Point(x_end_main_line, 0))

push!(points, Point(0,0))

#line(Point(0,0),Point(x_end_main_line, 0), action=:stroke)



# make sides
#---------------------------------
#| 6                             1  |
#-- 5                          2  --
#  | 4                         3 |
#
push!(points, Point(0,ear_y))
push!(points, Point(ear_x,ear_y))
push!(points, Point(ear_x, (side_y)))
#push!(points, Point((ear_x+side_x), (side_y+ear_y)))

for i in collect(0:nb_wells-1)
	active_x = ear_x+side_x+(well_x*i*(1+interval_scale))

	push!(points, Point(active_x, (side_y)))
	push!(points, Point(active_x, (side_y+well_y)))
	push!(points, Point(active_x+well_x, side_y+well_y))
	push!(points, Point(active_x+well_x, side_y))
#rect(active_x, base_y, well_x, well_y, action = :fill)
end


push!(points, Point(x_end_main_line - ear_x, (side_y)))#3
push!(points, Point(x_end_main_line - ear_x, ear_y) ) #2
push!(points, Point(x_end_main_line , ear_y))#1


push!(points, Point(x_end_main_line, 0))
poly(points, :stroke)

#line(Point(0,0), Point(0,-ear_y), action=:fill) #1
#line(Point(0,-ear_y), Point(ear_x,ear_y)) #2
#line(Point(ear_x,ear_y), Point(ear_x, (side_y-ear_y))) #3

#line(Point(x_end_main_line,0), Point(x_end_main_line,-ear_y))#4
# line(Point(x_end_main_line,-ear_y), Point(x_end_main_line - ear_x, ear_y))#5
# line(Point(x_end_main_line - ear_x, ear_y), Point(x_end_main_line - ear_x, (side_y-ear_y)))#6


#make base
#rect(0,0,base_x, base_y, action = :fill)


#make sides 
#rect(-side_x, 0, side_x, side_y, action = :fill)
#rect(base_x, 0, side_x,side_y, action = :fill)
# make ears
#rect(-side_x-ear_x, 0, ear_x, ear_y, action = :fill)
#rect(base_x+side_x, 0, ear_x, ear_y, action = :fill)


#rect(Point(0, 0), 100, 100, action = :stroke)



finish()

preview()
