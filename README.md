# durable-functions-example
This repository is for practicing durable functions for python.

## Usage

Start Azure Functions
```sh
$ func start
Found Python version 3.8.2 (python3).

Azure Functions Core Tools
Core Tools Version:       3.0.3160 Commit hash: 00aa7f43cc5c5f15241b5e6e5363256f19ceb990
Function Runtime Version: 3.0.14916.0


Functions:

        c: [POST,GET] http://localhost:7071/api/orchestrators/{functionName}

        ActivitySample: activityTrigger

        OrchestratorSample: orchestrationTrigger
```

Send HTTP request (GET) to HttpStarterSample Function
```sh
$ curl 'http://localhost:7071/api/orchestrators/OrchestratorSample'| jq
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  1243    0  1243    0     0   7533      0 --:--:-- --:--:-- --:--:--  7533
{
  "id": "7fd22c34e32b4365887af258beadfa24",
  "statusQueryGetUri": "http://localhost:7071/runtime/webhooks/durabletask/instances/7fd22c34e32b4365887af258beadfa24?taskHub=DurableFunctionsHub&connection=Storage&code=wXCn7DhBa/F46p/iQotPCPiDkoPTOPkqSgMDyFPb8LL70Bw78Sq4Nw==",
  "sendEventPostUri": "http://localhost:7071/runtime/webhooks/durabletask/instances/7fd22c34e32b4365887af258beadfa24/raiseEvent/{eventName}?taskHub=DurableFunctionsHub&connection=Storage&code=wXCn7DhBa/F46p/iQotPCPiDkoPTOPkqSgMDyFPb8LL70Bw78Sq4Nw==",
  "terminatePostUri": "http://localhost:7071/runtime/webhooks/durabletask/instances/7fd22c34e32b4365887af258beadfa24/terminate?reason={text}&taskHub=DurableFunctionsHub&connection=Storage&code=wXCn7DhBa/F46p/iQotPCPiDkoPTOPkqSgMDyFPb8LL70Bw78Sq4Nw==",
  "rewindPostUri": "http://localhost:7071/runtime/webhooks/durabletask/instances/7fd22c34e32b4365887af258beadfa24/rewind?reason={text}&taskHub=DurableFunctionsHub&connection=Storage&code=wXCn7DhBa/F46p/iQotPCPiDkoPTOPkqSgMDyFPb8LL70Bw78Sq4Nw==",
  "purgeHistoryDeleteUri": "http://localhost:7071/runtime/webhooks/durabletask/instances/7fd22c34e32b4365887af258beadfa24?taskHub=DurableFunctionsHub&connection=Storage&code=wXCn7DhBa/F46p/iQotPCPiDkoPTOPkqSgMDyFPb8LL70Bw78Sq4Nw=="
}
```

Check status
```sh
$ curl 'http://localhost:7071/runtime/webhooks/durabletask/instances/7fd22c34e32b4365887af258beadfa24?taskHub=DurableFunctionsHub&connection=Storage&code=wXCn7DhBa/F46p/iQotPCPiDkoPTOPkqSgMDyFPb8LL70Bw78Sq4Nw==' | jq
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   275  100   275    0     0    396      0 --:--:-- --:--:-- --:--:--   396
{
  "name": "OrchestratorSample",
  "instanceId": "7fd22c34e32b4365887af258beadfa24",
  "runtimeStatus": "Completed",
  "input": null,
  "customStatus": null,
  "output": [
    "Hello Tokyo!",
    "Hello Seattle!",
    "Hello London!"
  ],
  "createdTime": "2021-04-09T09:46:54Z",
  "lastUpdatedTime": "2021-04-09T09:46:55Z"
}
```
