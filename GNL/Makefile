CC= gcc
#CC= cGlang
#CFLAGS= -Wall -Werror -Wextra -I .
#CFLAGS= -Wall -Werror -Wextra -fsanitize=address -g -I ..
CFLAGS= -Wall -Werror -Wextra -g -I ..
NAME= test_gnl
.phony: all clean fclean re

SRC=main.c
OBJ=$(subst .c,.o, $(SRC))

all: $(NAME)

$(NAME): $(OBJ)
	make -C ..
	@echo "building "$(NAME)
	$(CC) -o $(NAME) $(OBJ) $(CFLAGS) -L../ -lft

clean:
	@echo "deleting "$(OBJ)
	@rm $(OBJ)

fclean: clean
	@echo "deleting "$(NAME)
	rm $(NAME)

re: fclean all
