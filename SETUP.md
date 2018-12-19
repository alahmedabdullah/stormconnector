Storm Connector
==================

Setup
-----
1. Install Chiminey (https://github.com/chiminey/docker-chiminey)
2. Go to docker-chiminey directory
```
	$ cd docker-chiminey
```
3. Enter into the Chiminey container
```
	$ ./chimineyterm
```
4. Go to chiminey directory
```
	$ cd /opt/chiminey/current/chiminey
```
5. Modify the SMART_CONNECTORES dictionary in settings_change.py file to have following:
```
        'storm' : {'init': 'chiminey.stormconnector.initialise.StormInitial',
                     'name': 'storm',
                     'description': 'The Storm Model Checker',
                     'payload': '/opt/chiminey/current/chiminey/stormconnector/payload_storm'
                     },
```
6. Modify the INPUT_FIELDS dictionary in settings_change.py file to have following:
```
	'storm' : SCHEMA_PREFIX + "/input/storm",
```
7. Clone the git repository https://github.com/alahmedabdullah/stormconnector.git in /opt/chiminey/current/chiminey
```
	$ git clone https://github.com/alahmedabdullah/stormconnector.git
```
8. Change ownership of the newly created stormconnector directory
```
	$ chown -R chiminey.nginx stormconnector
```
9. Exit from the chiminey container
```
	$ exit
```
10. Restart the chiminey container
```
	$ docker-compose restart chiminey
```
11. Check that storm connector is listed in available smart connectors list
```
	$ ./listscs
```
12. Activate the storm connector and follow the prompts
```
	$ ./activatesc storm
```
