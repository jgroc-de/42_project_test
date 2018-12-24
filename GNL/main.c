/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sjimenez <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/12/28 17:35:40 by sjimenez          #+#    #+#             */
/*   Updated: 2017/12/30 19:03:08 by jgroc-de         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line.h"
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>


int		main(int ac, char **av)
{
	int		fd;
	int		fd2;
	char	*l;

	if (ac == 1)
	{
		while (get_next_line(0, &l) == 1)
		{
			printf("%s\n", l);
			printf("free\n");
			free(l);
			printf("next!\n");
		}
	}
	if (ac == 2)
	{
		fd = open(av[1], O_RDONLY);
		while (get_next_line(fd, &l) == 1)
		{
			printf("%s\n", l);
			free(l);
		}
	}
	else if (ac == 3)
	{
		fd = open(av[1], O_RDONLY);
		fd2 = open(av[2], O_RDONLY);
		get_next_line(fd, &l);
		printf("%s\n", l);
		free(l);
		get_next_line(fd2, &l);
		printf("%s\n", l);
		free(l);
		get_next_line(fd, &l);
		printf("%s\n", l);
		free(l);
		get_next_line(fd2, &l);
		printf("%s\n", l);
		free(l);
		get_next_line(fd, &l);
		printf("%s\n", l);
		free(l);
		get_next_line(fd2, &l);
		printf("%s\n", l);
		free(l);
		get_next_line(fd, &l);
		printf("%s\n", l);
		free(l);
		get_next_line(fd2, &l);
		printf("%s\n", l);
		free(l);
	}
	//while (1)
	//	;
	return (0);
}
