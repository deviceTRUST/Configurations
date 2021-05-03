![dt-logo-full-aot-space-w1280](https://user-images.githubusercontent.com/83282694/116271495-5219b100-a780-11eb-9e1a-f929d2e3cbdc.png)
# Configurations for remoting scenarios
This section contains a collection of deviceTRUST configurations for remoting scenarios. Desriptions and explanations for each configuration can be found below.

# dT_C_R_BrowserContentRedirection.dtpol
Enables user based Browser Content Redirection control in Citrix RDSH scenarios, based on the client's installed software. The example uses Cisco WebEx Teams and Meetings on Windows devices. It can nbe easily extended to other products. Also, IGEL OS can be integrated by using environment variables.
![image](https://user-images.githubusercontent.com/83282694/116854923-c200bf00-abf8-11eb-8e08-62c41a063f1c.png)

The action will sent and unsed BCR registry entries for the user in her Citrix remote session.
![image](https://user-images.githubusercontent.com/83282694/116855086-0e4bff00-abf9-11eb-8876-2434edb4961c.png)


# dT_C_R_CitrixPolicies.dtpol
The Citrix Policies configuration checks accessing devices for external or internal access. Additionally, devices will be checked for being a company device.
![image](https://user-images.githubusercontent.com/83282694/116855501-c4afe400-abf9-11eb-9e40-3c9377c41428.png)

The action enables or disabled certain redirection options (USB, drive, clipboard).
![image](https://user-images.githubusercontent.com/83282694/116855566-e4dfa300-abf9-11eb-95d2-b5ba6c6d73c1.png)


# dT_C_R_DPI-Scaling.dtpol
Especially in scenarios with multi monitor usage, it can be help ful to set the remote scaling factor based on the local screen resolution. This configuration recognizes the local screen configuration. 
![image](https://user-images.githubusercontent.com/83282694/116855948-8a931200-abfa-11eb-84d8-f79600e13bf8.png)

Additionally, different client types can be recognized.
![image](https://user-images.githubusercontent.com/83282694/116855971-95e63d80-abfa-11eb-90ad-8b431cb2b5e9.png)

The action does either set the DPI scaling to standard or to the individual, client based values. It uses "LogPixels" and "Win8DpiScaling" under "HKCU\Control Panel\Desktop".
![image](https://user-images.githubusercontent.com/83282694/116856064-bf06ce00-abfa-11eb-9a11-aa306052902b.png)


# dT_C_R_HomeOffice_dCTA.dtpol

# dT_C_R_Printermapping_AD-Groups.dtpol
