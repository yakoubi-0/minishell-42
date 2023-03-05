NAME		:=	minishell
SRC		:=	minishell
$(OBJDIR)	:=	obj
$(SRCDIR)	:=	src
OBJ		:=	$(addprefix $(OBJDIR)/, $(addsuffix .o, $(SRC)))
SRC		:=	$(addprefix $(SRCDIR)/, $(addsuffix .c, $(SRC)))

############## compilation ###############

CC		=	gcc
CFLAGS		=	-Wall -Wextra -Werror

C_LIBFT		=	make -C libft
AR_LIBFT	=	libft/libft.a

$(OBJDIR)/%.o:	$(SRCDIR)/%.c
	@echo "compile >>>>> $^"
	@mkdir -p $(OBJDIR)
	@$(CC) $(CFLAGS) $< -c -I $(INC) -o $@

all:	$(NAME)

$(NAME):	$(OBJ)
	@$(C_LIBFT)
	@$(CC) $(CFLAGS) $^ $(AR_LIBFT) -o $@

clean:
	@$(C_LIBFT) clean
	rm -rf *.o
fclean:
	@$(C_LIBFT) fclean
	rm -rf $(NAME)

re:	fclean all

.PHONY:	all clean fclean re

