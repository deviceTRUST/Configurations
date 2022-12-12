![dt-logo-full-aot-space-w1280](https://user-images.githubusercontent.com/83282694/116271495-5219b100-a780-11eb-9e1a-f929d2e3cbdc.png)
# 1. Managed Hops
Contains the configuration as described in https://app.hubspot.com/knowledge/7075732/edit/93463466337

## Guide
This configuration can be applied to deviceTRUST Agents in a Multi-Hop scenario where a licensed deviceTRUST Agent is deployed on every hop along the chain. It does, thus, cater mainly for Multi-Hop scenarios in the internal networks of deviceTRUST customers. The "managed hops" scenario can be implemented with the deviceTRUST standard components. It gives full flexibility of the multi-hop path and the data to be evaluated.

| Machine            | Software                                            | Configuration                                      |
|--------------------|-----------------------------------------------------|----------------------------------------------------|
| Client             | deviceTRUST Client Extension                        | None                                               |
| Hop 1              | deviceTRUST Client Extension <br> deviceTRUST Agent | Evaluate Properties                                |
| Hop 2-N            | deviceTRUST Client Extension <br> deviceTRUST Agent | Push Properties forward                            |
| Final Hop / Target | deviceTRUST Agent                                   | Build Context based on Properties <br> Run Actions |

