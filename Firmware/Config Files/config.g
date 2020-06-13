; Configuration file for MendelMax MK3
; Duet WiFi 1.03

; General preferences
G90											; Send absolute coordinates
M83											; Relative extruder moves

; Network
M552 S0										; Disable network
M550 P"MendelMax MK3"						; Set machine name
 ; M551 P""									; Set password
M552 S1										; Enable network
M586 P0 S1									; Enable HTTP
M586 P1 S0									; Disable FTP
M586 P2 S0									; Disable Telnet

; Drives
M569 P0 S0									; Drive 0 goes backwards
M569 P1 S0									; Drive 1 goes forwards
M569 P2 S0									; Drive 2 goes forwards
M569 P3 S0									; Drive 3 goes forwards
M350 X16 Y16 Z16 E16 I1						; Configure microstepping with interpolation
M92 X80 Y80 Z400 E415						; Set steps per mm
M201 X2000 Y2000 Z200 E5000					; Set maximum accelerations, mm/sec^2
M203 X12000 Y12000 Z1800 E7200				; Set maximum speeds (mm/min)
M204 S1250 T1250							; Set acceleration (S) and travel acceleration (T)
M566 X600 Y600 Z24 E270						; Set the jerk limits, mm/min
M906 X800 Y800 Z800 E600 I30				; Set motor currents(mA) and motor idle factor in %
M84 S30										; Set idle timeout
 ; M593 F42.3								; Cancel ringing at 42.3Hz
 ; M572 D0 S0.02							; Pressure advance for extruder 0

; Axis Limits
M208 X-38 Y0 Z0 S1							; Set axis minim
M208 X212 Y200 Z205 S0						; Set axis maxim

; Endstops
M915 X Y S2									; Set stall detection
M574 X1 Y1 S3								; Set endstops controlled by motor load detection
M591 D0 P5 C3 R5:100 E3.0 S1  				; Duet3D laser sensor for extruder drive 0, connected to endstop input 3 (E0), tolerance 5 to 80%, 3mm comparison length, enabled

; Z-Probe
M574 Z1 S2									; Set endstops controlled by probe   
M558 P5 I1 H5 F200 T8000					; Set Z probe type/mode 9. H=Dive Height. F=Speed the bed moves
M556 S0 X0 Y0 Z0							; Set orthogonal axis compensation parameters
M557 X14.0:198.0 Y7.0:191.0 S46:46			; Define mesh grid
G31 P25 X28 Y3 Z0.30						; Set Z probe trigger value, offset and trigger height 
M376 H3										; Set bed compensation taper. H=max height                          	   

; Heaters                               
M307 H0 A106.7 C487.5 D1.0 S1.00 V24.1 B0	; Disable bang-bang mode for the bed heater and set PWM limit
M305 P0 T100000 B4138 C0 R4700				; Set thermistor + ADC parameters for heater 0
M143 H0 S120								; Set temperature limit for heater 0 to 120C
M307 H1 A773.2 C289.0 D4.6 S1.00 V24.2 B0
M305 P1 T100000 B4725 C7.060000e-8 R4700	; Set thermistor + ADC parameters for heater 1
M143 H1 S285								; Set temperature limit for heater 1 to 285C

; Fans
M106 P0 S0 I0 B1 F30 H-1 C"Cooling"			; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off
M106 P1 S1 I0 B1 F500 H1 T50 C"Hotend"		; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned on
M106 P2 S1 I0 B1 F3500 H1 T50 C"Controller"	; Set fan 2 value, PWM signal inversion and frequency. Thermostatic control is turned on

; Tools
M563 P0 D0 H1								; Define tool 0
G10 P0 X0 Y0 Z0								; Set tool 0 axis offsets
G10 P0 R0 S0								; Set initial tool 0 active and standby temperatures to 0C

; Automatic power saving
M911 S23 R24 P"M913 X0 Y0 G91 M83 G1 E-5 F2700"	; Set voltage thresholds and actions to run on power loss

; Miscellaneous
M501										; Load saved parameters from non-volatile memory
T0											; Select first tool