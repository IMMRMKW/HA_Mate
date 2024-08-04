---
title: Using Python and VSCode
pagenum: 3
---

### Manually, using, e.g., VSCode
* Create a project folder in VSCode to which you clone this github project.
* Next, using the terminal, create a virtual environment in this folder:
```bash
python -m venv .venv
```
* Activate your virtual environment using:
``` bash
 .\.venv\Scripts\activate
```
* First, install wheel:
``` bash
pip install wheel 
```
* Next, install esphome:
``` bash
pip install esphome 
```
* You can upload the code using:
``` bash
esphome run config.yml --device COM1
```
Where the '1' behind 'COM' should be replaced by the actual COM port number of your device.
