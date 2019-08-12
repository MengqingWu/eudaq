# IP-environment variables are set by user/eudet/misc/environments/setup_eudaq2_aida-tlu.sh 
# Define port
RPCPORT=44000

# Start Run Control
xterm -T "Run Control" -e 'euRun' &
sleep 2 

# Start Logger
xterm -T "Log Collector" -e 'euLog -r tcp://${RUNCONTROLIP}' &
sleep 1

# Start one DataCollector
# name (-t) in conf file

xterm -T "Data Collector TLU" -e 'euCliCollector -n DirectSaveDataCollector -t tlu_dc -r tcp://${RUNCONTROLIP}:${RPCPORT}' &
sleep 1

xterm -T "Data Collector NI/Mimosa" -e 'euCliCollector -n DirectSaveDataCollector -t ni_dc -r tcp://${RUNCONTROLIP}:${RPCPORT}' &
sleep 1

# Start TLU Producer
xterm -T "AidaTluProducer" -e 'euCliProducer -n AidaTluProducer -t aida_tlu -r tcp://${RUNCONTROLIP}:${RPCPORT}' & 


# Start NI Producer locally connect to LV via TCP/IP
xterm -T "NI/Mimosa Producer" -e 'euCliProducer -n NiProducer -t ni_mimosa -r tcp://${NIIP}:${RPCPORT}' &
sleep 1

# OnlineMonitor
xterm -T "Online Monitor" -e 'StdEventMonitor -t StdEventMonitor -r tcp://${RUNCONTROLIP}' & 

#xterm -T "PI Stage" -e 'euCliProducer -n PIStageProducer -t Stage ' &