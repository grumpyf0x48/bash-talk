---
theme: gaia
---

<!-- paginate: true -->
<!-- footer: Bash: Mieux connaître les possibilités de la ligne de commande -->

## Bash

Mieux connaître les possibilités de la ligne de commande.

Pierre-Yves Fourmond ([@grumpyf0x48](https://twitter.com/grumpyf0x48))

---
## Historique de Bash

- Bourne Again Shell
- Successeur open source du **Bourne Shell**
- Existe depuis 1989
- Le Shell du Projet GNU
- Shell par défaut de nombreuses distributions Linux
- Emprunte des fonctionnalités du **Korn Shell** et du **C Shell**
- Utilise la librairie **readline** pour l'édition et l'historique des commandes

---
## Raccourcis claviers courants

- **Ctrl + r**, **Ctrl + g**: chercher dans l'historique, arrêter la recherche
- **Ctrl + a**, **Ctrl + e**: aller au début, à la fin de la ligne
- **Alt + f**, **Alt + b**: avancer, reculer d'un mot
- **Ctrl + w**, **Alt + d**: supprimer le début, la fin du mot
- **Ctrl + u**, **Ctrl + k**: supprimer tout à gauche, à droite du curseur
- **Ctrl + y**: copier ce qui vient d'être supprimé
- **Ctrl + Shift + c**,  **Ctrl + Shift + v**: copier le texte, coller
- **Ctrl + l**: effacer l'écran

---
## Expansion de la ligne de commande

    $ ls $HOME
    
Appui sur **Ctrl + Alt + e** :

    $ ls --color=auto /home/user

Puisque `ls` est un alias vers la commande correspondante et `$HOME` est égal à `/home/user`.

A tester avec `rm`: alias ou built-in ?

---
## Complétion de la ligne de commande

### Les fichiers

    $ cp /Vidéos/IT/clean_coders/CleanCode-E

Un appui sur **TAB** affiche les fichiers correspondants :

    $ cp /Vidéos/IT/clean_coders/CleanCode-E
    CleanCode-E1.mp4 CleanCode-E2.mp4 CleanCode-E3.mp4

On peut aussi utiliser: **Alt + /** (**Alt + Shift + /**)

---
## Complétion ... les commandes

    $  ls

Un appui sur **TAB** affiche les commandes qui commencent par `ls` :

    $ ls
    ls lsblk lscpu lsh lslocks lsof lspgpot lsattr lsb_release lsdiff lsinitramfs lsmod lspci lsusb

Cela fonctionne aussi avec le raccourci clavier: **Alt + !**

---
## Complétion ... les hostnames, usernames et variables

    $ ping freebox-

Puis **Alt + @** (**Alt + Alt Gr + @**) :

    $ ping freebox-
    freebox-player.local freebox-server.local

Également possible de compléter les usernames **Alt + \~** et les variables **Alt + $**.

---
## Complétion ... automatique

    $ cp /Vidéos/IT/clean_coders/CleanCode-E

Un appui sur **Alt + \*** complète la ligne de commande avec les fichiers qu'un appui sur **TAB** aurait affiché :

    $ cp /Vidéos/IT/clean_coders/CleanCode-E1.mp4 /Vidéos/IT/clean_coders/CleanCode-E2.mp4
    /Vidéos/IT/clean_coders/CleanCode-E3.mp4

Je peux maintenant continuer ma commande par exemple avec `/backup`.

---
## Utilisation de la dernière commande

    $ apt-get update
    E: Impossible d'ouvrir le fichier verrou /var/lib/apt/lists/lock - open (13: Permission non accordée)

On relance avec les droits `root` :

    $ sudo !!
    sudo apt-get update

La dernière commande est maintenant `sudo apt-get update`.

---
## Utilisation des paramètres de la commande

    $ ls Video1.mp4  Video2.mp4
    Video1.mp4  Video2.mp4

On accède aux paramètres de la dernière commande avec **!\*** :

    $ rm !*
    rm Video1.mp4 Video2.mp4

Et si seulement le dernier paramètre m'intéresse ?

---
## Utilisation du dernier paramètre

    $ curl -L https://github.com/rupa/z/blob/master/z.sh -o ~/.z
    $ chmod +x

Un appui sur **Alt + .** change la ligne de commande en :

    $ chmod +x ~/.z
    
On peut aussi utiliser:

    $ chmod +x !$

---
## Utilisation de chaque paramètre

On peut modifier l'exemple précédent comme suit :

    $ curl -L https://github.com/rupa/z/blob/master/z.sh -o ~/.z && chmod +x !#:4

Car le nom du fichier est le quatrième paramètre de la commande précédente.

Dans l'historique, la syntaxe `!#:4` sera bien remplacée par `~/.z`.

Syntaxe un peu pénible **:cry:** quand même.

---
## Edition de la dernière commande

Avec une commande complexe :angry: comme :

    $ find /usr/include/linux/ -name *.h -exec grep time_t {} \; -print

Vous pouvez:

- éditer la commande avec l'éditeur par défaut de Linux avec le raccourci **Ctrl + x + e**
- l'enregistrer dans l'historique, en commentaire - avec **Alt + #** (**Alt + Alt Gr + #**)

---
## La librairie readline

Elle est documentée ici :

    $ man readline

et se configure dans le fichier `~/.inputrc` :

```
# Never rings the bell.
set bell-style none

# Performs filename matching and completion in a case-insensitive fashion.
set completion-ignore-case on
...
```

---
## Obtenir des infos sur une commande

    $ command -V python
    python is /usr/bin/python

    $ command -V ls
    ls is aliased to `ls --color=auto'

    $ command -V canonical_which
    canonical_which is a function
    canonical_which () {
    ...

    $ command -V command
    command is a shell builtin

---
## Conclusion

Bash est un outil du quotidien très puissant, parfois complexe, pas toujours bien documenté :angry: mais il y a toujours des choses à découvrir :smile:.

Restez curieux !

    $ env | grep TALK
    SLIDES_TALK=https://github.com/grumpyf0x48/bash-talk
    CONTACT_TALK=https://twitter.com/grumpyf0x48

**Merci** !!!
