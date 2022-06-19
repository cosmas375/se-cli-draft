grep -o '"[a-zA-Z0-9]*":[^{]*{' ./fuck.json | grep '[a-zA-Z0-9]' | tr -d '{ "\n' | sed 's/:/ /g'
