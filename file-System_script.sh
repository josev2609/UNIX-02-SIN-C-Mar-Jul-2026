cd /dev
#change directory to dev directory 
ls
#list archives and directory 
cd /proc 
#change directory to proc directory 
ls 
#list proc directory 
cat cpuinfo 
#shows cpu information 
cd /workspaces/UNIX-02-SIN-C-Mar-Jul-2026/
#change directory 
sudo mv saludo.c /bin 
#move that files to bin 
 ls | grep "saludo"
 #found the files 
 pwd
 #Show the directory that we are working 
 ls -F
 #Shows the types of files
 echo "hola mundo" > tests.txt 
#creates a new file named tests.txt and writes "hola mundo" into it, demonstrating how to create and write to a file in the terminal
cat tests.txt
#displays the contents of tests.txt, confirming that the text "hola mundo" was successfully written to the file
stat test.txt 
#displays detailed information about the file test.txt, including its size, permissions, and timestamps, which can be useful for understanding file properties and managing files effectively