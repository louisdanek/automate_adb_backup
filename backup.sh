pkill -f adb  # kill adb instances to avoid crashes.
adb devices # initialize adb instance.
adb connect 192.168.1.1:5555  # !! change it by your ip, 5555 is the default port. !!
adb backup -apk -obb -shared -all -system -f backup.ab # you can change arguments. This is a full backup.
if test -s loun.ab  # checks if the backup is accepted and saves the last three successful ones.
then
	echo "backup done !"
	if ls -d "backup3.ab" 1>/dev/null 2>&1
		then
		rm backup3.ab
	fi
	if ls -d "backup2.ab" 1>/dev/null 2>&1
		then
		mv backup2.ab backup3.ab
	fi
	if ls -d "backup1.ab" 1>/dev/null 2>&1
		then
		mv backup1.ab backup2.ab
	fi
	if ls -d "backup.ab" 1>/dev/null 2>&1
		then
		mv backup.ab backup1.ab
	fi
else
	echo "backup failed"
	rm loun.ab  # remove file if backup failed.
fi
