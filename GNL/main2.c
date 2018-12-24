#include "get_next_line.h"
#define GNL get_next_line
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>

/*
int	main(int ac, char **av)
{
	int fd;
	char *s;
	int i;

	fd = 0;
	i = 1;
	(void)ac;
	fd = open(av[1], O_RDONLY);
	while (i != 0)
	{
		i = GNL(fd, &s);
		//ft_putnbr(i);
		if (i != -1)
		{
			ft_putstr(s);
			if (i != 0)
				ft_putstr("\n");
		}
		else
		{
			ft_putstr("error\n");
			i = 0;
		}
	}
	return (0);
}*/

int	main(int ac, char **av)
{
	int fd1;
	int fd2;
	int fd3;
	char *s;
	int i1;
	int i2;
	int i3;

	fd1 = 0;
	fd2 = 0;
	fd3 = 0;
	i1 = i2 = i3 = 1;
	(void)ac;
	fd1 = open(av[1], O_RDONLY);
	printf("%d = fd1 \n", fd1);
	fd2 = open(av[2], O_RDONLY);
	printf("%d = fd2 \n", fd2);
	fd3 = open(av[3], O_RDONLY);
	printf("%d = fd3 \n", fd3);
	while (i1 || (i2 && i3))
	{
		i1 = GNL(fd1, &s);
		if (i1 == 1)
		{
			ft_putstr("   -- fd1 --   \n");
			ft_putstr(s);
			ft_putstr("\n");
		}
		else if (i1 == - 1)
		{
			i1 = 0;
			ft_putstr("error\n");
		}
		i2 = GNL(fd2, &s);
		if (i2 == 1)
		{
			ft_putstr("   --fd2--   \n");
			ft_putstr(s);
			ft_putstr("\n");
		}
		else if (i2 == -1)
		{
			ft_putstr("error\n");
			i2 = 0;
		}
		i3 = GNL(fd3, &s);
		if (i3 == 1)
		{
			ft_putstr("   --fd3--   \n");
			ft_putstr(s);
			ft_putstr("\n");
		}
		else if (i3 == -1)
		{
			i3 = 0;
			ft_putstr("error\n");
		}
		if (i3 == 0)
		{
			i3 = 1;
			//close(fd3);
			//fd3 = open(av[3], O_RDONLY);
			//ft_putnbr(fd3);
			ft_putstr(" : i ----\n");
		}
	}
	return (0);
}
