; homex.g
; called to home the X axis

G91               	; relative positioning
M201 X400       	; Set accelerations (mm/s^2)
G1 Z5 F3000 S2    	; lift Z relative to current position
G1 S1 X-250 F4000 	; move quickly to X axis endstop and stop there
G1 Z-5 F3000 S2   	; lower Z again
M201 X2000       	; Set accelerations (mm/s^2)
G90               	; absolute positioning