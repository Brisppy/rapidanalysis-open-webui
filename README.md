# Open WebUI for RapidAnalysis

A customized implementation of [Open WebUI](https://github.com/open-webui/open-webui) and [llama.cpp](https://github.com/ggerganov/llama.cpp) for RapidAnalysis devices.

This implementation replaces the original [Ollama](https://github.com/ollama/ollama) backend with [llama.cpp](https://github.com/ggerganov/llama.cpp), and is optimized for our specific use.

## Installation
### RapidAnalysis Darius Device
If you have purchased the RapidAnalysis Darius hardware device, little to no setup is required, simply plug the device into the network, and it will receive an IP address which you can then access it from. From here the network setup can be modified following the Debian distribution wiki which the device is based on.
### Manual Installation
If you are looking to deploy the Web application on your own device, or wish to reinstall the software on the RapidAnalysis Darius device this section contains relevant instructions.

The below software must be installed before you can run the installation script.
* Git
* Docker

This assumes you have downloaded the previously mentioned requirements on a fresh Debian Linux installation.

1. Clone the RapidAnalysis Github repository.

       git clone https://github.com/Brisppy/rapidanalysis-open-webui

2. Enter the repository directory.

       cd open-webui-rapidanalysis

3. Add the ‘execute’ permission to the installation script.

       chmod +x startup.sh

4. Run the installation script.

       ./startup.sh

## Configuration
### Changing the Language Model
The Large-Language model used can be modified by editing the `docker-compose.yml` file located inside of the application directory. Currently, only models uploaded to Hugging Face are supported, and an alternate model can be configured by replacing the `HUGGINGFACE_MODEL` environment variable for the llama.cpp container.

### Ongoing Maintenance
No ongoing maintenance is required for the application. Notifications regarding important updates will be sent to purchasers of the RapidAnalysis Darius device.

### Updating
The Web application will rarely need to be updated, only in cases of security issues or required features being added in later releases.

The Web Application can be updated by entering the repository directory and running the following commands:

Enter the folder containing the downloaded Github repository.
1. Add the ‘execute’ permission to the application updater.

       chmod +x update.sh

2. Run the application update script.

       ./update.sh

After this, the application can be started as normal with the docker compose up command.
