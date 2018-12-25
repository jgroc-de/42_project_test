# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    test_norminette+malloc.sh                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jgroc-de <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/12/25 14:18:04 by jgroc-de          #+#    #+#              #
#    Updated: 2018/12/25 14:19:12 by jgroc-de         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

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
