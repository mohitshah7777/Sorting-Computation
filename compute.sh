#! /bin/bash

declare -A compute
declare -a arr
compute=([1]=0 [2]=0 [3]=0 [4]=0)
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

count=0
for value in ${compute[@]}
do
        arr[$count]=$value
        count=$((count+1))
done
echo "Computations in Array = " ${arr[@]}

size=${#arr[@]}

for (( k=0; k<$size; k++ ))
do
        for (( m=k+1; m<$size; m++ ))
        do
                if [[ ${arr[k]} -lt ${arr[m]} ]]
                then
                        temp1=${arr[k]}
                        arr[k]=${arr[m]}
                        arr[m]=$temp1
                fi
        done
done

echo "Sorted Results in Descending order = " ${arr[@]}

for (( i=0; i<$size; i++ ))
do
        for (( j=0; j<$size-i-1; j++ ))
        do
                if [[ ${arr[j]} -gt ${arr[$((j+1))]} ]]
                then
                        temp=${arr[j]}
                        arr[j]=${arr[$((j+1))]}
                        arr[$((j+1))]=$temp
                fi
        done
done

echo "Sorted results in Ascending order = " ${arr[@]}

