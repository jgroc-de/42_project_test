echo " ** Norminette **"
norminette **/**.[ch] | grep Error
norminette **/**.[ch] | grep Warning
echo " ** End Norminette **"
echo "\n ** Makefile **"
grep -nr wildcard **/Makefile
echo "\n\t * make *"
make
echo "\n\t * make *"
make
echo "\n\t * make *"
touch *.c
make
echo "\n\t * make fclean *"
make fclean
echo "\n\t * make *"
make
echo "\n\t * make re *"
make re
echo " ** Fin Makefile **"
echo "\n ** Protection malloc **"
grep -nr new **/**.c
grep -nr malloc **/**.c
echo " ** Fin protection malloc **"
