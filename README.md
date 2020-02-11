## MongoDb Sharding Batch

Batch tool for automate the sharding process on MongoDb clusters. There are a lot of tutorials and tools but most of them are outdated. So I updated [asicfr's tool](https://github.com/asicfr/mongoDBonWindows) in accordance with CSRS for the new mongodb versions. Structure is illustrated below.

<p>1 x Config Server&emsp;localhost:27019</p>
<p>1 x Router&emsp;&emsp;&emsp;&emsp;localhost:27200</p>
<p>4 x Shard Servers
    <br>&emsp;&emsp;S1&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;localhost:27100<br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;localhost:27101</p>
    <p>&emsp;&emsp;S2&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;localhost:27102<br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;localhost:27103</p>

This structure is designed for development purposes. For the production environment you should use at least three configuration servers.
