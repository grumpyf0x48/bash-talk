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

- **Ctrl + a**, **Ctrl + e**: aller au début, à la fin de la ligne
- **Alt + f**, **Alt + b**: avancer, reculer d'un mot
- **Ctrl + w**, **Alt + d**: supprimer le début, la fin du mot
- **Ctrl + u**, **Ctrl + k**: effacer tout à gauche, à droite du curseur
- **Ctrl + Shift + c**,  **Ctrl + Shift + v**: copier le texte, coller
- **Ctrl + s**, **Ctrl + q**: mettre en pause la sortie du terminal, continuer
- **Ctrl + r**: chercher dans l'historique

Ces raccourcis sont définis par la librairie **readline**.

---
## Expansion de la ligne de commande

    $ ls $HOME
    
Appui sur **Ctrl + Alt + e**:

    $ ls --color=auto /home/user

Puisque `ls` est un alias vers la commande correspondante et `$HOME` est égal à `/home/user`.

A tester avec `rm`: alias ou built-in ?

---
## Complétion de la ligne de commande

### Les fichiers

    $ cp /Vidéos/IT/clean_coders/CleanCode-E

Un appui sur **TAB** affiche les fichiers correspondants:

    $ cp /Vidéos/IT/clean_coders/CleanCode-E
    CleanCode-E1.mp4 CleanCode-E2.mp4 CleanCode-E3.mp4

On peut aussi utiliser: **Alt + /** (En pratique: **Alt + Shift + /**)

---
## Complétion ... les commandes

    $  ls

Un appui sur **TAB** affiche les commandes qui commencent par `ls`:

    $ ls
    ls lsblk lscpu lsh lslocks lsof lspgpot lsattr lsb_release lsdiff lsinitramfs lsmod lspci lsusb

Cela fonctionne aussi avec le raccourci clavier: **Alt + !**

---
## Complétion ... les hostnames, usernames et variables

    $ ping freebox-

Puis **Alt + @** (**Alt + Alt Gr + @**):

    $ ping freebox-
    freebox-player.local freebox-server.local

Également possible de compléter les usernames **Alt + \~** et les variables **Alt + $**.

---
## Complétion ... automatique

    $ cp /Vidéos/IT/clean_coders/CleanCode-E

Un appui sur **Alt + \*** complète la ligne de commande avec les fichiers qu'un appui sur **TAB** aurait affiché:

    $ cp /Vidéos/IT/clean_coders/CleanCode-E1.mp4 /Vidéos/IT/clean_coders/CleanCode-E2.mp4
    /Vidéos/IT/clean_coders/CleanCode-E3.mp4

Je peux maintenant continuer ma commande par exemple avec `/backup`.

---
## Vérification de la ligne de commande

Essayez:

    $ rm -fr

Puis **ESPACE** puis **Alt + \***

    $ rm -fr
    rm -fr .asciinema .bash_aliases .bash_functions .bash_git_prompt .bash_history .bash_logout ...

:disappointed_relieved: A vous de voir si vous appuierez sur **ENTER** ensuite !

---
## Utilisation de la dernière commande

    $ apt-get update
    E: Impossible d'ouvrir le fichier verrou /var/lib/apt/lists/lock - open (13: Permission non accordée)

On relance avec les droits `root`:

    $ sudo !!
    sudo apt-get update

La dernière commande est maintenant `sudo apt-get update`.

---
## Utilisation des paramètres de la commande

    $ ls Video1.mp4  Video2.mp4
    Video1.mp4  Video2.mp4

On accède aux paramètres de la dernière commande avec **!\***:

    $ rm !*
    rm Video1.mp4 Video2.mp4

Et si seulement le dernier paramètre m'intéresse ?

---
## Utilisation du dernier paramètre

    $ curl -L https://git.framasoft.org/grumpyf0x48/liar/raw/master/liar -o ~/bin/liar
    $ chmod +x

Un appui sur **Alt + .** change la ligne de commande en:

    $ chmod +x ~/bin/liar
    
On peut aussi utiliser:

    $ chmod +x !$

---
## Utilisation de chaque paramètre

On peut modifier l'exemple précédent comme suit:

    $ curl -L https://git.framasoft.org/grumpyf0x48/liar/raw/master/liar -o ~/bin/liar && chmod +x !#:4

Car le nom du fichier est le quatrième paramètre de la commande précédente.

Dans l'historique, la syntaxe `!#:4` sera bien remplacée par `~/bin/liar`.

Syntaxe un peu pénible **:cry:** quand même.

---
## Edition de la dernière commande

Avec une commande complexe :angry: comme:

    $ find /usr/include/linux/ -name *.h -exec grep time_t {} \; -print

Vous pouvez:

- éditer la commande avec l'éditeur par défaut de Linux avec le raccourci **Ctrl + x + e**
- l'enregistrer dans l'historique, en commentaire - avec **Alt + #** (En pratique: **Alt + Alt Gr + #**)

---
## Configuration de readline

Dans le fichier `.inputrc`:

```
# Never rings the bell.
set bell-style none

# Performs filename matching and completion in a case-insensitive fashion.
set completion-ignore-case on

# Displays possible completions using different colors to indicate their file type.
set colored-stats on

# Default completion mode: Attempt to perform completion on the text before point.
TAB: complete

# Similar to complete, but replaces the word to be completed with a single match from the list of possible completions.
# Repeated execution of menu-complete steps through the list of possible completions, inserting each match in turn.
#TAB: menu-complete
```

---
## Dernières astuces

### Obtenir des infos sur une commande

    $ command -V python3
    python3 est /usr/bin/python3

    $ command -V command
    command est une primitive du shell

    $ command -V rm
    rm est un alias vers « zrm_rm »

---
## Conclusion

Bash est un outil du quotidien très puissant, parfois complexe, pas toujours bien documenté :angry: mais il y a toujours des choses à découvrir :smile:.

Restez curieux !

    $ env | grep TALK
    SLIDES_TALK=https://github.com/grumpyf0x48/bash-talk
    CONTACT_TALK=https://twitter.com/grumpyf0x48

**Merci** !!!
