#!/bin/bash

counter=0

while [ $counter -lt 50 ]; do
	
	let counter=counter+1
	
	name=$(nl people.txt | grep -w $counter | awk '{print $2}' | awk -F ',' '{print $1}')
	lastName=$(nl people.txt | grep -w $counter | awk '{print $2}' | awk -F ',' '{print $2}')
	age=$(shuf -i 20-25 -n 1)
	
	mysql -u root -p123456 people -e "INSERT INTO register values ($counter, '$name', '$lastName', $age)"
	echo "$counter, $name, $lastName, $age se importaron correctamente"
	
	sleep 7
	
done
	
