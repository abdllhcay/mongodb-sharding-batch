## MongoDb Sharding Batch

Batch tool for automate the sharding process on MongoDb clusters. There are a lot of tutorials and tools but most of them are outdated. So I updated [asicfr's tool](https://github.com/asicfr/mongoDBonWindows) in accordance with CSRS for the new mongodb versions. Structure is illustrated below.
```
1 x Config Server   localhost:27019
1 x Router          localhost:27200
4 x Shard Servers
          S1        localhost:27100
                    localhost:27101
          S2        localhost:27102
                    localhost:27103
```
This structure is designed for development purposes. For the production environment you should use at least three configuration servers.
