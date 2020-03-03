:: Since the $PATH is not the same between windows and linux shell
:: We need to start an interactive shell to force bash to read the .bashrc file
:: so that user $PATH can be set properly
ubuntu run bash -c -i ./start.sh