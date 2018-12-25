FILES="$@"
make
if [ $# -eq 0 ]; then
	echo "Usage: sh $0 <test file 1> <test file 2> <...>"
	echo "	ex: sh $0 test*"
else
	for f in $FILES
	do
		echo "début test de $f"
		cat $f > tmpcat
		$0 $f > tmpgnl
		diff tmpcat tmpgnl
		echo "test leaks de $f"
		valgrind --leak-check=full $0 $f | grep lost
		echo "fin test de $f"
	done
fi
