#!/bin/bash
# if database isn't initialized:
if [ ! -f "/root/notedata/leanote.0" ]; then
  mongod --dbpath /root/notedata --fork --logpath=/var/log/mongodb.log --auth
  mongorestore -h localhost -d leanote --directoryperdb /root/leanote/mongodb_backup/leanote_install_data/
  mongo 127.0.0.1:27017/leanote /root/addUser.js
else
  mongod --dbpath /root/notedata --fork --logpath=/var/log/mongodb.log --auth
fi

chmod a+x /root/leanote/bin/leanote-linux
/root/leanote/bin/leanote-linux -importPath github.com/leanote/leanote
