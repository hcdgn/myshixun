#!/bin/bash
cd overflow3
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
echo "Type string:Bang!: You set global_value to 0x3d91b195" >> answer.txt
echo "VALID" >> answer.txt
echo "NICE JOB!" >> answer.txt

./hex2raw < input3.txt > bomb-raw.txt
./bufbomb -u 2016010305 < bomb-raw.txt > tmp.txt
diff tmp.txt answer3.txt > /dev/null
if [ $? == 0 ];
  then printf "yes"
else
  printf "no"
fi
