-- Chisel description
description = "Captures system calls for MITRE TTP T1485"
short_description = "T1485"
category = "misc"

print('hello')

-- Chisel argument list
args = 
{
	{
		name = "dd", 
		description = "the name of process name used", 
		argtype = "string"
	},
}

print(name)

-- Argument notification callback
function on_set_arg(name, val)
	processName = val
	return true
end

-- Initialization callback
function on_init()
	-- Request the fileds that we need
	procName = chisel.request_field("proc.name")
	eventType = chisel.request_field("evt.type")
	fdType = chisel.request_field("fd.type")
	evtDir = chisel.request_field("evt.dir")
	directory = chisel.request_field("fd.directory")
	localIP = chisel.request_field("fd.lip")
	remoteIP = chisel.request_field("fd.rip")
	processID = chisel.request_field("proc.pid")
	sysArgs = chisel.request_field("evt.args")
	time = chisel.request_field("evt.time")
	parent = chisel.request_field("proc.ppid")
	-- set the filter
	chisel.set_filter("proc.name=split")
	--chisel.set_filter("proc.name=" .. processName)
	--print('ProcessName','\t' ,'EventType','\t', 'FDType','\t', 'EventDirection','\t', 'FilePath','\t', 'ProcessID','\t', 'EventArguments','\t', 'Timestamp','\t', 'ParentProcessID', '\t', 'Local IP', '\t', 'Remote IP')	
	print('ProcessName','EventType','FDType','EventDirection','FilePath','ProcessID','EventArguments','Timestamp','ParentProcessID', 'Local IP', 'Remote IP')
	--print('ProcessName',',' ,'EventType',',', 'FDType',',', 'EventDirection',',', 'FilePath',',', 'ProcessID',',', 'EventArguments',',', 'Timestamp',',', 'ParentProcessID', ',', 'Local IP', ',', 'Remote IP') 
	return true
end

count = 0

-- Event parsing callback
function on_event()
	pn = evt.field(procName)
	et = evt.field(eventType)
	fdt = evt.field(fdType)
	ed = evt.field(evtDir)
	dir = evt.field(directory)
	lip = evt.field(localIP)
	rip = evt.field(rip)
	pid = evt.field(processID)
	sa = evt.field(sysArgs)
	tim = evt.field(time)
	par = evt.field(parent)	
	--print(pn,'\t',et,'\t', fdt,'\t', ed,'\t', dir,'\t', pid,'\t',sa,'\t',tim,'\t',par,'\t',lip,'\t',rip)
	print(pn,et, fdt, ed, dir, pid,sa,tim,par,lip,rip)
	--print(pn,',',et,',', fdt,',', ed,',', dir,',', pid,',',sa,',',tim,',',par,',',lip,',',rip)
end
