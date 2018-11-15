docker run -d -p 222:22 -v $(echo ~)/Desktop/workdir:/home/FStar/workdir:Z lfranceschino/fstar-with-kremlin
sshpass -p hello ssh-copy-id FStar@localhost -p 222
