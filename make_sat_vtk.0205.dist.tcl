#
# This script will create a vtk file from a ParFlow binary file
# this script uses the dem.pfb file to create the vtk file to match topography
# you run this script by typing "tclsh make_sat_vtk.0205.dist.tcl" from the command line
#
# Import the ParFlow TCL package
#
lappend auto_path $env(PARFLOW_DIR)/bin 
package require parflow
namespace import Parflow::*

# set the path to the directory containing the ParFlow output
set path "/<user>/<path>/huc0205"
set runname "HUC0205"

puts $path/$runname.out.satur.00000.pfb

set saturation [pfload -pfb $path/$runname.out.satur.00000.pfb]
set fileout $path/saturation.vtk
set dem [pfload -pfb $path/dem.pfb]

set dzlist "10 200.0 100.0 50.0 25.0 10.0 5.0 1.0 0.6 0.3 0.1"

pfvtksave $saturation -vtk $fileout -var "Satur" -dem $dem -flt -tfg $dzlist

set press [pfload -pfb $path/$runname.out.press.00000.pfb]
set fileout $path/press.vtk
set dem [pfload -pfb $path/dem.pfb]

set dzlist "10 200.0 100.0 50.0 25.0 10.0 5.0 1.0 0.6 0.3 0.1"

pfvtksave $press -vtk $fileout -var "Press" -dem $dem -flt -tfg $dzlist


set permx [pfload -pfb $path/$runname.out.perm_x.pfb]
set fileout $path/permx.vtk
set dem [pfload -pfb $path/dem.pfb]

set dzlist "10 200.0 100.0 50.0 25.0 10.0 5.0 1.0 0.6 0.3 0.1"

pfvtksave $permx -vtk $fileout -var "Kx" -dem $dem -flt -tfg $dzlist

set permx [pfload -pfb $path/$runname.out.perm_x.pfb]
set fileout $path/permx.vtk
set dem [pfload -pfb $path/dem.pfb]

set dzlist "10 200.0 100.0 50.0 25.0 10.0 5.0 1.0 0.6 0.3 0.1"

pfvtksave $permx -vtk $fileout -var "Kx" -dem $dem -flt -tfg $dzlist

set fileout $path/dem.vtk
set streams [pfload -pfb $path/streams.pfb]
set dem [pfload -pfb $path/dem.pfb]

pfvtksave $dem -vtk $fileout -var "dem" -dem $dem 

set fileout $path/streams.vtk
set streams [pfload -pfb $path/streams.pfb]
set dem [pfload -pfb $path/dem.pfb]

pfvtksave $streams -vtk $fileout -var "streams" -dem $dem 

set fileout $path/mask.vtk
set mask [pfload -pfb $path/mask.pfb]
set dem [pfload -pfb $path/dem.pfb]

pfvtksave $mask -vtk $fileout -var "mask" -dem $dem -flt -tfg "1 0.1"