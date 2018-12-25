# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    test.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jgroc-de <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/12/25 14:19:22 by jgroc-de          #+#    #+#              #
#    Updated: 2018/12/25 14:23:01 by jgroc-de         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FILES="$@"
make
if [ $# -eq 0 ]; then
	echo "Usage: sh $0 <test file 1> <test file 2> <...>"
	echo "	ex: sh $0 test*"
else
	for f in $FILES
	do
		echo "** début test de $f"
		cat $f > tmpcat
		$0 $f > tmpgnl
		diff tmpcat tmpgnl
		echo "\t*test leaks de $f"
		valgrind $0 $f | grep lost
		#valgrind --leak-check=full $0 $f | grep lost
		echo "**fin test de $f"
	done
	echo "null"
	$0 $f /dev/null
	echo "random"
	$0 $f /dev/random
fi
