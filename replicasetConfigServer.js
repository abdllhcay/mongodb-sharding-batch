rs.initiate(
  {
    _id: "s0",
    configsvr: true,
    members: [
      { _id : 0, host : "localhost:27019" }
    ]
  }
)