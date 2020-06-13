; homeall.g
; called to home the X, Y, Z axis

G91               			; relative positioning
M201 X400 Y400     			; Set accelerations (mm/s^2)
G1 Z5 F3000 S2   			; lift Z relative to current position
G1 H1 X-250 Y-200 F4000 	; move quickly to X axis endstop and stop there
G1 H1 X134 Y109 F4500  		; move quickly to X axis endstop and stop there
G1 H1 Z-205 F600 			; move Z down until the switch triggers
G92 Z0.30					; set new z position
G1 H2 Z20 F1800			   	; lift Z relative to current position
M201 X2000 Y2000			; Set accelerations (mm/s^2)
G90               			; absolute positioning