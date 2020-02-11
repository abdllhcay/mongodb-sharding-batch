@echo off 
set mongo_home_path=D:\mongodb\bin
set root_path=D:\temp\mongodb
set data_path=%root_path%\deployment-test

echo Start config server
start /b "mongod config-server" "%mongo_home_path%\mongod" --configsvr --replSet s0 --dbpath "%data_path%\config" --port 27019 --logpath "%data_path%\log\config.log" --logappend
echo done

timeout /t 2 /nobreak > nul

echo Initialize config replicaset
start /b "mongo config-server" "%mongo_home_path%\mongo" --port 27019 "%root_path%\replicasetConfigServer.js"
echo done

timeout /t 2 /nobreak > nul

echo Start shard servers s1
start /b "mongod shard1" "%mongo_home_path%\mongod" --shardsvr --replSet s1  --dbpath "%data_path%\s1\a" --port 27100 --logpath "%data_path%\log\s1-a.log" --logappend
start /b "mongod shard2" "%mongo_home_path%\mongod" --shardsvr --replSet s1  --dbpath "%data_path%\s1\b" --port 27101 --logpath "%data_path%\log\s1-b.log" --logappend
echo done

timeout /t 2 /nobreak > nul

echo Start shard servers s2
start /b "mongod shard1" "%mongo_home_path%\mongod" --shardsvr --replSet s2  --dbpath "%data_path%\s2\a" --port 27102 --logpath "%data_path%\log\s2-a.log" --logappend
start /b "mongod shard2" "%mongo_home_path%\mongod" --shardsvr --replSet s2  --dbpath "%data_path%\s2\b" --port 27103 --logpath "%data_path%\log\s2-b.log" --logappend
echo done

timeout /t 2 /nobreak > nul

echo Initialize s1 replicaset
start /b "mongo shard1" "%mongo_home_path%\mongo" --port 27100 "%root_path%\replicasetShardServer1.js"
echo done

timeout /t 2 /nobreak > nul

echo Initialize s2 replicaset
start /b "mongo shard2" "%mongo_home_path%\mongo" --port 27102 "%root_path%\replicasetShardServer2.js"
echo done

timeout /t 2 /nobreak > nul

echo Start router server
start /b "mongos router" "%mongo_home_path%\mongos" --configdb s0/localhost:27019 --port 27200 --logpath "%data_path%\log\router.log" --logappend
echo done

timeout /t 20 /nobreak > nul

echo Initialize cluster
start /b "mongo router" "%mongo_home_path%\mongo" --port 27200 "%root_path%\configureSharding.js"
echo done

echo All jobs are done
