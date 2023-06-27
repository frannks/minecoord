#!/usr/bin/env bash

# Franklin Souza
# FranklinTech

# ============================================================
# Script para criação aleatoria de coordenadas no minecraft.
# E de gerenciamento de coordenadas salvas.
# ============================================================

# //////////////////////////////////////////////////////////////////////////////////////////

# Main
main() {
  clear
  printf "Coordinates\n\n"
  read -p 'PRESSIONE ENTER PARA CONTINUAR...'
  while true ; do
    clear
      printf "AVISO: O código pode spwanar VOCÊ em QUALQUER LUGAR do minecraft, são números aleatorios imprimidos na tela, ou seja... ninguém sabe onde você sera dropado! RECOMENDADO: Se você for usar esse programa, NÃO leve itens importantes, leve o basico você CORRE O RISCO de ser dropado direto a morte 
OBJETIVO DO PROGRAMA: O objetivo do programa é para você que quer viajar no MEGA MUNDO DO MINECRAFT aleatoriamente para pode farmar!!!
VOCÊ PODE...: Cair dentro de uma pedra e ficar bugado, nesse caso você pode teleportar para um local seguro que você conheca, ou quebrar a pedra com a picareta! 
VOCÊ PODE...: Cair de uma altura muito alta e morrer, você pode levar um balde de aguá e tentar no TIME (TEMPO) certo soltar a água para amortecer sua queda! 
VOCÊ PODE...: Cair em algum lugar bugado e não ter como quebrar o bloco e nem se teleportar, ou seja você pode morrer (RECOMENDADO: Levar itens necessários)!\n\n"

  printf "[01] - Coordenada aleatoria\n"
  printf "[02] - Gerenciar coordenadas\n"
  printf "[03] - Sair\n\n"
  read OPTION

  if [ $OPTION == '1' ] || [ $OPTION == '01' ] ; then
    mineCoord

  elif [ $OPTION == '2' ] || [ $OPTION == '02' ] ; then
    managerSave

  elif [ $OPTION == '3' ] || [ $OPTION == '03' ] ; then
    clear && exit 0
  fi
  done
}

# ==================
#    FUCTIONS
# ==================
mineCoord(){
  # Definindo as variáveis VAR1 e VAR2
  VAR1='-'
  VAR2=''

  # Concatenando VAR1 e VAR2 em result
  result=$VAR1,$VAR2

  # Selecionando um elemento aleatório da string result usando o comando 'awk'
  result1=$(echo $result | awk '{ split($0,array,","); r = rand() * (length(array)); print array[int(r)+1]; }')

  # Definindo as variáveis X, Y e Z
  X=''
  Y=''
  Z=''

  # Atribuindo valores aleatórios às coordenadas COORD1, COORD2 e COORD3
  COORD1=$((RANDOM%9999+1))
  COORD2=$((RANDOM%99+1))
  COORD3=$((RANDOM%999999+1))

  # Limpando a tela do terminal
  clear

  # Imprimindo as coordenadas e o elemento selecionado aleatoriamente
  echo -e "X $result1$COORD1 / Y: $COORD2 / Z: $COORD3"

  # Imprimindo o comando '/tp' com as coordenadas
  echo -e "\n/tp $result1$COORD1 $COORD2 $COORD3"
  printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main
}

managerSave(){
  while true; do
    DIR="$HOME/.coords_mine"
    if [ ! -d "$DIR" ] ; then
      clear
      mkdir $HOME/.coords_mine
    else
      clear
    fi
    printf "O que você deseja fazer?:\n\n"
    printf "[01] - Criar um novo arquivo de texto\n"
    printf "[02] - Remover um arquivo de texto\n"
    printf "[03] - Salvar coordenadas\n"
    printf "[04] - Gerenciar minhas coordenadas\n"
    printf "[05] - Limpar tela\n"
    printf "[06] - Voltar\n\n"
    read OPTION1

    # Conditions
    if [ $OPTION1 == '1' ] || [ $OPTION1 == '01' ] ; then
      clear
      printf "Digite o nome do Arquivo (Evite espaços e acentuações):\n\n"
      read FILE_NAME
      touch $HOME/.coords_mine/"$FILE_NAME"

    elif [ $OPTION1 == '2' ] || [ $OPTION1 == '02' ] ; then
      clear
      cd $HOME/.coords_mine && ls
      printf "\nDigite o nome do arquivo que de deseja remover:\n\n"
      read REMOVE_FILE
      rm -rf $REMOVE_FILE

    elif [ $OPTION1 == '3' ] || [ $OPTION1 == '03' ] ; then
      printf "\n\nCole a coordenada aqui e coloque o nome dela: (Ex: X Y Z - Minha casa)\n\n"
      read COORD
      cd $HOME/.coords_mine/ && ls && printf "\n\n Agora digite o nome do arquivo que queira salvar:\n\n"
      read FILE_NAME1
      echo '/tp' "$COORD" >> $HOME/.coords_mine/"$FILE_NAME1"

    elif [ $OPTION1 == '4' ] || [ $OPTION1 == '04' ] ; then
      cd $HOME/.coords_mine && clear && ls && printf "\nEscolha qual arquivo de texto você quer gerenciar:\n\n"
      read FILE_NAME2
      cd $HOME/.coords_mine && $EDITOR $FILE_NAME2

    elif [ $OPTION1 == '5' ] || [ $OPTION1 == '05' ] ; then
      clear

    elif [ $OPTION1 == '6' ] || [ $OPTION1 == '06' ] ; then
      main
    fi
done
}
main
