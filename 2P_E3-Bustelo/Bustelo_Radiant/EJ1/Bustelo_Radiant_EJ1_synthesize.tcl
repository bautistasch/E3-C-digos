if {[catch {

# define run engine funtion
source [file join {C:/lscc/radiant/3.0} scripts tcl flow run_engine.tcl]
# define global variables
global para
set para(gui_mode) 1
set para(prj_dir) "D:/Users/nicob/Desktop/Electro3/2P_E3-Bustelo/Bustelo_Radiant"
# synthesize IPs
# synthesize VMs
# synthesize top design
file delete -force -- Bustelo_Radiant_EJ1.vm Bustelo_Radiant_EJ1.ldc
run_engine_newmsg synthesis -f "Bustelo_Radiant_EJ1_lattice.synproj"
run_postsyn [list -a iCE40UP -p iCE40UP5K -t SG48 -sp High-Performance_1.2V -oc Industrial -top -w -o Bustelo_Radiant_EJ1_syn.udb Bustelo_Radiant_EJ1.vm] "D:/Users/nicob/Desktop/Electro3/2P_E3-Bustelo/Bustelo_Radiant/EJ1/Bustelo_Radiant_EJ1.ldc"

} out]} {
   runtime_log $out
   exit 1
}
