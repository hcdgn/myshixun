#!/bin/bash
cd overflow1
touch answer.txt
touch bomb-raw.txt
touch tmp.txt
chmod 777 hex2raw
chmod 777 bufbomb
chmod 777 makecookie
user_id=`hostname`
cookie_id=`./makecookie -u $user_id | sed -n '2p'` 
echo "Userid: ${user_id}" > answer.txt
echo "Cookie: ${cookie_id}" >> answer.txt
echo "Type string:Smoke!: You called smoke()" >> answer.txt
echo "VALID" >> answer.txt
echo "NICE JOB!" >> answer.txt
./hex2raw < input1.txt > bomb-raw.txt
./bufbomb -u $user_id < bomb-raw.txt > tmp.txt
diff tmp.txt answer.txt > /dev/null
if [ $? == 0 ];
  then printf "yes"
else
  printf "no"
fi
