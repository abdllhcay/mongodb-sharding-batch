db.adminCommand({"addshard":"s1/localhost:27100,localhost:27101"});
db.adminCommand({"addshard":"s2/localhost:27102,localhost:27103"});
db.adminCommand({"enablesharding":"mydb2"});
db.adminCommand({"shardcollection":"mydb2.mycollection2","key":{"shardkey":"hashed"}});
