FILES="$@"
make re
if [ $# -eq 0 ]; then
	echo "Usage: sh $0 <test file 1> <test file 2> <...>"
	echo "	ex: sh $0 test*"
else
	for f in $FILES
	do
		echo "début test de $f"
		cat $f > tmpcat
		./test_gnl $f > tmpgnl
		diff tmpcat tmpgnl
		echo "test leaks de $f"
		valgrind --leak-check=full ./test_gnl $f
		echo "fin test de $f"
	done
fi
