; homez.g
; called to home the Z axis

G91               	; relative positioning
G1 Z5 F4000 S2    	; lift Z relative to current position
G1 S1 Z-205 F600 	; move Z down until the switch triggers
G92 Z0.20			; set new z position
G1 Z5 F1800 S2   	; lift Z relative to current position
G90              	; absolute positioning