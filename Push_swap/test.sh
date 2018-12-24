#!/bin/bash
echo "----- fichir auteur -----"
cat -e auteur
echo "----- test checker -----"
echo "--- doublon"
arg="2 4 1 5 2"
tes=`./checker $arg`
echo $tes
echo "--- over max"
arg="2 4 10000000000000000000 5 1"
tes=`./checker $arg`
echo $tes
echo "--- sans parametre"
arg=""
tes=`./checker $arg`
echo $tes
echo "--- mauvais parametre"
arg="3 2 4 5 1"
tes=`echo "po" | ./checker $arg`
echo $tes
echo "--- espaces"
arg="3 2 4 5 1"
tes=`echo "    pb" | ./checker $arg`
echo $tes
tes=`echo "po    " | ./checker $arg`
echo $tes
echo "--- ne trie pas"
echo "--- à faire à la main"
arg="9 1 8 2 7 3 6 4 5"
tes=`./checker $arg "sa\npb\nrrr\n\n"`
echo $tes
echo "----- test push swap -----"
echo "--- <3 coups"
arg="2 1 0"
tmp=`./push_swap $arg | wc -l`
echo $tmp
tes=`./push_swap $arg | ./checker $arg`
echo $tes
echo "--- <12 coups"
arg="1 5 2 4 3"
tmp=`./push_swap $arg | wc -l`
echo $tmp
tes=`./push_swap $arg | ./checker $arg`
echo $tes
j=0
echo "----- test de 0 à 15 -----"
while [ $j -lt 15 ]
do
    total=0
    max=0
    min=1000000000
    i=0
    while [ $i -lt $1 ]
    do
        arg=`ruby -e "puts (0..$j).to_a.shuffle.join(' ')"`
        tmp=`./push_swap $arg | wc -l`
        tes=`./push_swap $arg | ./checker $arg`
        if [ "$tes" != "OK" ]
        then
            echo $tes
            echo $arg
            break
        fi
        if [ $max -lt $tmp ]
        then
            max=$tmp
        elif [ $min -gt $tmp ]
        then
            min=$tmp
        fi
        let "total += tmp"
        let i++
    done
    echo "----- j= $j -----"
    echo "max= $max"
    echo "min= $min"
    echo "total= $total"
    echo "moyenne:"
    echo "$total/$1" | bc -l
    let j++
done
echo "----- test avec 100 valeurs -----"
total=0
max=0
min=1000000000
i=0
while [ $i -lt 100 ]
do
    arg=`ruby -e "puts (0..99).to_a.shuffle.join(' ')"`
    tmp=`./push_swap $arg | wc -l`
    tes=`./push_swap $arg | ./checker $arg`
    if [ "$tes" != "OK" ]
    then
        echo $tes
        echo $arg
        break
    fi
    if [ $max -lt $tmp ]
    then
        max=$tmp
    elif [ $min -gt $tmp ]
    then
        min=$tmp
    fi
    let "total += tmp"
    let i++
done
echo "j= 100"
echo "max= $max"
echo "min= $min"
echo "total= $total"
echo "moyenne:"
echo "$total/100" | bc -l
echo "----- test avec 500 valeurs -----"
total=0
max=0
min=1000000000
i=0
while [ $i -lt 100 ]
do
    arg=`ruby -e "puts (0..499).to_a.shuffle.join(' ')"`
    tmp=`./push_swap $arg | wc -l`
    tes=`./push_swap $arg | ./checker $arg`
    if [ "$tes" != "OK" ]
    then
        echo $tes
        echo $arg
        break
    fi
    if [ $max -lt $tmp ]
    then
        max=$tmp
    elif [ $min -gt $tmp ]
    then
        min=$tmp
    fi
    let "total += tmp"
    let i++
done
echo "j= 500"
echo "max= $max"
echo "min= $min"
echo "total= $total"
echo "moyenne:"
echo "$total/300" | bc -l
