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

#make base
rect(0,0,base_x, base_y, action = :fill)
#make sides 
rect(-side_x, 0, side_x, side_y, action = :fill)
rect(base_x, 0, side_x,side_y, action = :fill)
# make ears
rect(-side_x-ear_x, 0, ear_x, ear_y, action = :fill)
rect(base_x+side_x, 0, ear_x, ear_y, action = :fill)


for i in collect(0:nb_wells-1)
	active_x = 0+(well_x*i*(1+interval_scale))
	rect(active_x, base_y, well_x, well_y, action = :fill)
end
#rect(Point(0, 0), 100, 100, action = :stroke)



finish()

preview()
