# 2. Unmanaged Hops
This configuration can only be applied to deviceTRUST from version 21.1.xxx. It utilizes a on-to-one connection from the user's client to a target session by hopping over multiple deviceTRUST Client Extensions. It does only require a configured deviceTRUST Agend on the last top / target. This makes the configuration rather simple. It is intended to cater for scenarios in which one ore more hops are not in the customer's hands and thus might not be licensed and configurable to run a deviceTRUST Agent.

![2 - Unmanaged Hops](../../_assets/images/multi-hop/2-UnmanagedHops/01_Architecture.png)

Contains the configuration as described in https://app.hubspot.com/knowledge/7075732/edit/93463466337

## Guide


| Machine            | Software                     | Configuration                                                        |
|--------------------|------------------------------|----------------------------------------------------------------------|
| Client             | deviceTRUST Client Extension | None                                                                 |
| Hop 1-N            | deviceTRUST Client Extension | 1 - Connect to nex deviceTRUST Client Extension until Agent is found |
| Final Hop / Target | deviceTRUST Agent            | 2 - Build Context based on Properties <br> Run Actions               |

### Configuration 1 - Connect to nex deviceTRUST Client Extension until Agent is found (dT_C_MH_1-UnmanagedHops_1_Hop1.dtpol)

### Configuration 2 - Build Context based on Properties & Run Actions (dT_C_MH_1-UnmanagedHops_2_Target.dtpol)
