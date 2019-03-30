# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    test.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jgroc-de <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/12/25 14:19:22 by jgroc-de          #+#    #+#              #
#    Updated: 2019/03/30 17:27:12 by jgroc-de         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

FILES="$@"
if [ $# -eq 0 ]; then
	echo "norminette"
	norminette **/**.[ch] | grep "Error"
	echo "fin norminette"
	echo "make"
	make
	echo "fin make"
	echo "Usage: $0 <test file 1> <test file 2> <...>"
	echo "	ex: $0 test*"
else
	echo "test simple (ctrl+d pour finir)"
	./test_gnl
	echo "fin test simple"
	i=0
	for f in $FILES
	do
		echo "** début test de $f"
		cat $f > tmpcat
		./test_gnl $f > tmpgnl
		diff tmpcat tmpgnl
		#echo "\t*test leaks de $f"
		#valgrind ./test_gnl $f | grep lost
		#valgrind --leak-check=full $0 $f | grep lost
		echo "**fin test de $f"
		((i++))
	done
	if [ $i -gt 4 ]; then
		echo "** multi fd: début test de $3 $4"
		./test_gnl $3 $4
	fi
	echo "** début test de null"
	./test_gnl $f /dev/null
	echo "** fin test de null"
	echo "début test de random"
	./test_gnl $f /dev/random
	echo "** fin test de null"
fi
