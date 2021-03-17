#! /bin/bash

declare -A compute
read -p "Enter 1st Number = " a
read -p "Enter 2nd Number = " b
read -p "Enter 3rd Number = " c

result1=$((a+b*c))
result2=$((a*b+c))
result3=$((c+a/b))
result4=$((a%b+c))

echo "Result 1 = " $result1
echo "Result 2 = " $result2
echo "Result 3 = " $result3
echo "Result 4 = " $result4

compute["1"]=$result1
compute["2"]=$result2
compute["3"]=$result3
compute["4"]=$result4

echo "Results in Dictionary"
for key in ${!compute[@]}
do
        echo $key "=" ${compute[$key]}
done
