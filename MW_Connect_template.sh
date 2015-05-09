#!/bin/bash
openconnect --script=/etc/vpnc/vpnc-script --certificate=<certname>.pfx \ 
--key-password=<certificatePassword> --authgroup=Certificate --user=<mathworksUserName> \
--no-deflate zakim.mathworks.com
