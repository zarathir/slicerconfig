M862.3 P "[printer_model]" ; printer model check
M862.1 P[nozzle_diameter] ; nozzle diameter check
M115 U3.8.1 ; tell printer latest fw version
M83  ; extruder relative mode
M104 S150; preheat nozzle temp for no-ooze
M140 S[first_layer_bed_temperature] ; set bed temp
G28 W ; home all without mesh bed level
M190 S[first_layer_bed_temperature] ; wait for bed temp
G4 S5; wait another 5 seconds to be sure PINDA is warm enough and that bed has warmed for mesh leveling

G80 ; mesh bed leveling
G1 Y-3.0 F1000.0 ; go outside print area
;M106 S255; Turn cooling fan on to prevent oozing
M104 S[first_layer_temperature] ; set extruder temp
M109 S[first_layer_temperature] ; wait for extruder temp

;Start improved purge line
G92 E0.0 ; reset extrusion distance
G1 E2 F1000 ; de-retract and push ooze
G1 X20.0 E6  F1000.0 ; fat 20mm intro line @ 0.30
G1 X60.0 E3.2  F1000.0 ; thin +40mm intro line @ 0.08
G1 X100.0 E6  F1000.0 ; fat +40mm intro line @ 0.15
G1 E-0.8 F2100; retract to avoid stringing
G1 X99.0 E0 F1000.0 ; -1mm intro line @ 0.00
G1 X110.0 E0 F1000.0 ; +10mm intro line @ 0.00
G1 E0.6 F1500; de-retract
G92 E0.0
M106 S0 ; Turn cooling fan off before printing anything
