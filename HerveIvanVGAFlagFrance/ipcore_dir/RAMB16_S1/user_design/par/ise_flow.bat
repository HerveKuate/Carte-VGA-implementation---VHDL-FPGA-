call rem_files.bat



echo Synthesis Tool: XST

mkdir "../synth/__projnav" > ise_flow_results.txt
mkdir "../synth/xst" >> ise_flow_results.txt
mkdir "../synth/xst/work" >> ise_flow_results.txt

xst -ifn ise_run.txt -ofn mem_interface_top.syr -intstyle ise >> ise_flow_results.txt
ngdbuild -intstyle ise -dd ../synth/_ngo -uc RAMB16_S1.ucf -p xc3s200ft256-5 RAMB16_S1.ngc RAMB16_S1.ngd >> ise_flow_results.txt

map -intstyle ise -detail -cm speed -pr off -c 100 -o RAMB16_S1_map.ncd RAMB16_S1.ngd RAMB16_S1.pcf >> ise_flow_results.txt
par -w -intstyle ise -ol std -t 1 RAMB16_S1_map.ncd RAMB16_S1.ncd RAMB16_S1.pcf >> ise_flow_results.txt
trce -e 100 RAMB16_S1.ncd RAMB16_S1.pcf >> ise_flow_results.txt
bitgen -intstyle ise -f mem_interface_top.ut RAMB16_S1.ncd >> ise_flow_results.txt

echo done!
