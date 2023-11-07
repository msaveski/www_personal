#!/bin/sh

# Upload to server
scp -r _site/* msaveski@ovid.u.washington.edu:public_html/

# make sure to fix the permissions on the server
# chmod -R 750 *



