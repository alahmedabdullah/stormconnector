Storm Smart Connector(SC) install
=====================================
The Storm SC installs Storm docker image in each Cloud VM. Please refer to installation steps in https://github.com/alahmedabdullah/stormconnector/blob/master/SETUP.md file for further details on installation steps.

The Input Directory
-------------------

The input directory is provided with a template file 'run.sh_template' which is availabe in 'input_storm' directory of Storm SC install. All the template tags specified in  the run.sh_template file will be internally replaced by Chiminey with corresponding values that are passed in from 'Chiminey Portal' as Json dictionary. The 'run.sh_template' is  also renamed to 'run.sh' with all template tags replaced with corresponding values.

Configure, Create and Execute a Storm Job
---------------------------------------------
'Create Job' tab in 'Chiminey Portal' lists 'storm' form for creation and submission of storm job. The 'storm' form requires definition of 'Compute Resource Name' and 'Storage Location'. Appropiate 'Compute Resource' and 'Storage Resource' need to be defined  through 'Settings' tab in the 'Chiminey portal'.

Payload Parameter Sweep
-----------------------
Payload parameter sweep for 'Storm Smart Connector' in the Chiminey System may be performed by specifying appropiate JSON dictionary in 'Payload parameter sweep' field  of the 'storm' form. 

Following ia an example JSON dictionary to execute Storm model-checker through this Smart Connector:
```
{ "model_checker" :  [ "prism" ], "model_file" :  [ "die.pm" ] , "model_output" :  [ "die.drn" ]  }
```

Above would create one task within a VM that has been allocate by Chiminey for execution of this task. The input fields in 'Cloud Compute Resource' form has to be:

```
Number of VM instances : 1
Minimum No. VMs : 1
```
