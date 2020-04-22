; homey.g
; called to home the Y axis

G91               	; relative positioning
M201 Y400       	; Set accelerations (mm/s^2)
G1 Z5 F3000 S2    	; lift Z relative to current position
G1 S1 Y-205 F4000 	; move quickly to Y axis endstop and stop there (first pass)
G1 Z-5 F3000 S2   	; lower Z again
M201 Y2000       	; Set accelerations (mm/s^2)
G90               	; absolute positioning