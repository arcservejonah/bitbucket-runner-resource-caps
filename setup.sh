#!/bin/bash -eux

cp runner-resource-caps /usr/local/bin/
cp runner-resource-caps.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable runner-resource-caps.service
systemctl restart runner-resource-caps.service
systemctl status --no-pager runner-resource-caps.service
