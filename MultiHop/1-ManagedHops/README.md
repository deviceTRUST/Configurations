# 1. Managed Hops
This configuration can be applied to deviceTRUST Agents in a Multi-Hop scenario where a licensed deviceTRUST Agent is deployed on every hop along the chain. It does, thus, cater mainly for Multi-Hop scenarios in the internal networks of deviceTRUST customers. The "managed hops" scenario can be implemented with the deviceTRUST standard components. It gives full flexibility of the multi-hop path and the data to be evaluated.

![1 - Managed Hops](../../_assets/images/multi-hop/1-ManagedHops/01_Architecture.png)

Contains the configuration as described in https://app.hubspot.com/knowledge/7075732/edit/93463466337

## Guide
The configuratiuon(s) shown here are a basic example to give an Idea of how multi-hop can be implemeted with deviceTRUST. They may or may not comply with how your environemnt is designed. They will, in any case, give you an idea of which information and settings are required in which place. If you have any questions regarding the implementation, please do no hesitate getting back to us!

| Machine            | Software                                            | Configuration                                          |
|--------------------|-----------------------------------------------------|--------------------------------------------------------|
| Client             | deviceTRUST Client Extension                        | None                                                   |
| Hop 1              | deviceTRUST Client Extension <br> deviceTRUST Agent | 1 - Evaluate Properties                                |
| Hop 2-N            | deviceTRUST Client Extension <br> deviceTRUST Agent | 2 - Push Properties forward                            |
| Final Hop / Target | deviceTRUST Agent                                   | 3 - Build Context based on Properties <br> Run Actions |

### Configuration 1 - Evaluate Properties
The first configuration is applied to the first hop in the chain. It is utilized to evaluate properties from the remote client. You can either evaluate properties by creating a context or by adding the in the "Setting\Properties" configuration menu. The configuration in this repository uses the second method.

This Configuration
- Uses the "Property" setting in the "Settings" menu to evaluate the "Name" property of the "Remote" client.

![Evaluate Remote Properties](../../_assets/images/multi-hop/1-ManagedHops/02_EvaluateRemotePropertiess.png)

### Configuration 2 - Push Properties forward
The second configuration is applied to any hop along the chain that is not the first and not the last hop / target. It is utilized to push the evaluated client properties forward.

This Configuration
- Uses the "Property\Property Options" setting in the "Settings" menu. There you'll find the "Multi-Hop" tab, where "Require connecting devices to forward their remote properties in a multi-hop scenario" needs to be checked.

![Forward Properties](../../_assets/images/multi-hop/1-ManagedHops/03_ForwardProperties.png)
### Configuration 3 - Build Context based on Properties & Run Actions

The third configuration is applied only to the last hop / target. It is utilized to build context and run actions. In the example use case, it gets the Remote Device's name from the Remote Properties and displays it as Action Center notification in the target session.

This Configuration
- Builds the Context "Remote Name", fetching the Remote Device's name from the Remote Properties
- Displays and Action Center notification in the target Windows session

<div style="width:60px ; height:60px">![Built Context](../../_assets/images/multi-hop/1-ManagedHops/04_Context.png)</div><div style="width:60px ; height:60px">![Run Actions](../../_assets/images/multi-hop/1-ManagedHops/05_Action.png)</div>

<img
  src="../../_assets/images/multi-hop/1-ManagedHops/04_Context.png"
  alt="Built Context"
  title="Built Context"
  width="300"><img
  src="../../_assets/images/multi-hop/1-ManagedHops/05_Action.png"
  alt="Run Actions"
  title="Run Actions"
  width="300">