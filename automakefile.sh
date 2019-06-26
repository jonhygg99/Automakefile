#!/bin/bash

COUNT="0"
SRC=""
shopt -s globstar
for file in **/*; do
    if [[ $file =~ ".c" ]]; then SRC+=" "$file; fi
done
echo "##" > "Makefile"
echo "## EPITECH PROJECT, 2019" >> "Makefile"
echo "## "$(basename $PWD) >> "Makefile"
echo "## File description:" >> "Makefile"
echo "## Makefile" >> "Makefile"
echo -e "##\n" >> "Makefile"
echo -e "SRC\t=\c" >> "Makefile"
for each in ${SRC[@]}
do
    if [[ $COUNT =~ "0" ]];
    then echo -e "\t$each\t\\" >> "Makefile"; COUNT="1";
    else echo -e "\t\t$each\t\\" >> "Makefile"; fi
done
echo -e "\nCFLAGS\t=\t-g3\n" >> "Makefile"
echo -e "NAME\t=\t\c" >> "Makefile"
if [ $1 ]; then echo -e $1"\n" >> "Makefile"; else echo -e "a.out\n" >> "Makefile"; fi
if [ "$2" == "csfml" ]; then CSFML="1"; echo -e "CSFML\t=\t-lcsfml-graphics -lcsfml-window -lcsfml-audio -lcsfml-system\n" >> "Makefile"; fi
echo -e "OBJ =\t\$(SRC:.c=.o)\n" >> "Makefile"
echo -e "all:\t\$(NAME)\n" >> "Makefile"
echo -e "\$(NAME):\t\$(OBJ)" >> "Makefile"
echo -e "\tgcc -o \$(NAME) \$(OBJ)\c" >> "Makefile"
if [[ $CSFML ]]; then echo -e " \$(CSFML)\c" >> "Makefile"; else echo -e "\c" >> "Makefile"; fi
echo -e " \$(CFLAGS)\n" >> "Makefile"
echo -e "clean:" >> "Makefile"
echo -e "\trm -fr \$(OBJ)\n" >> "Makefile"
echo -e "fclean: clean" >> "Makefile"
echo -e "\trm -fr \$(NAME)\n" >> "Makefile"
echo -e "re: fclean all\c" >> "Makefile"
TEST=$(make -C . re)
TEST=$(echo $?)
if [ TEST != 0 ]; then rm "Makefile"; echo "Makefile can't be compiled, check your arguments."; exit 84; fi
TEST=$(make -C . fclean)
