# Push_swap

Parce que Swap_push c'est moins naturel.

## extrait du sujet

Ce projet demande de trier des données sur une pile, avec un set s'instructions limité, en moins de coups possibles. Pour le réussir, vous devrez manipuler différents algorithmes de tri et choisir la (ou les?) solution la plus appropriée pour un classement optimisé des données.

le sujet complet est disponible dans le fichier push_swap.fr.pdf

## le programme

Ce programme est divisé en deux partie:
  - la partie push_swap qui prends en entrée une liste de nombres et qui donne en sortie les instructions pour trier la liste, avec le moins de coup possible
  - la partie checker qui prends en entrée la même liste d'entrée de push_swap et la sortie de push_swap et qui teste si cette solution est bien correct (elle trie bien la liste en entrée de push_swap).

## la solution

Push_swap tente ces 3 algorithmes là:
-bublesort pour les petites listes
-mergesort
-quicksort avec une recherche de la mediane sur chaque sous-liste afin de déterminer le pivot optimal. Ce tri (oui c'est con, pour trier de manière optimale, il faut trier) est fait avec le merge sort du dessus.
Dans les trois cas, un post-traitement est éffectué afin de supprimer les mouvements idiots/redondant. Par exemple, mettre un item sur la liste B et le faire revenir tout de suite sur la liste A revient à ne rien faire. On peut donc supprimer les deux coups.

## résultat

Pour une liste de 500 items, le programme propose une solution composée en moyenne en 5600 coups. La note maximale pour ce sujet est donnée à partir de 5500 coups (too bad --_____--).

## utilisation

Pour compiler le programme (avec gcc, dans un terminal)

```bash
git clone https://github.com/jgroc-de/push_swap.git && cd push_swap && make
```

creer une liste de 10 items:
```bash
arg=`ruby -e "puts (0..9).to_a.shuffle.join(' ')"`
```

demander à push swap de trier cette liste:
```bash
./push_swap $arg
```

compter le nombre de coups dans la solution de push swap:
```bash
./push_swap $arg | wc -l
```

vérifier avec ckecker que la sortie est correct:
```bash
./push_swap $arg | ./checker $arg
```

script de test (en testant 10 fois chaque liste de 1 à 15):
```bash
./test.sh 10
```
