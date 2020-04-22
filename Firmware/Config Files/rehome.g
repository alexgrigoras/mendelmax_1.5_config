; homeall.g
; called to home the X, Y in case of crash detection
G91               			; relative positioning
M201 X400 Y400		     	; Set accelerations (mm/s^2)
G1 Z5						; move z
G1 H1 X-250 Y-200 F4000 	; move quickly to X axis endstop and stop there
M201 X2000 Y2000			; Set accelerations (mm/s^2)
G1 E4 F300			   		; extrude 4mm of filament
G90               			; absolute positioning