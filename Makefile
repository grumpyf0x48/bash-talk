talk:
	marp --title "Bash: Mieux connaître les possibilités de la ligne de commande" Bash.md

slides:
	grep "^## " Bash.md

slides-count:
	grep "^## " Bash.md | wc -l
