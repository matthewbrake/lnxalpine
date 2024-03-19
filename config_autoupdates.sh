#!/bin/sh
# Auto update
echo -e "#!/bin/sh\napk upgrade --update | sed \"s/^/[\`date\`] /\" >> /var/log/apk-autoupgrade.log" > /etc/periodic/daily/apk-autoupgrade && \
	chmod 700 /etc/periodic/daily/apk-autoupgrade
