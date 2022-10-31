# Projet Circuit Numériques Programmables

Projet réalisé dans le cadre de mes études en école d'ingénieur Polytech Lille pour le cours de Circuits Numériques Programmables avancés entre mars et avril 2022

Réalisé en binôme avec Florian Derlique

## Sujet 

  Dans les circuits numériques, le calcul est une fonction primordiale. Cependant, les calculs intermédiaires doivent rester confidentiels afin de ne pas exposer les algorithmes. De plus, les circuits étant complexes, il est difficile de tester complètement l’intégrité des fonctions réalisées. Afin de détourner ce problème, il est possible de créer une porte dérobée. 
  
  Durant ces séances de TP, nous avons tout d’abord réalisé une unité de calcul FPGA avec une addition de deux vecteurs sur N bit, et la multiplication de deux vecteurs complexes sur N bit. Ils ont tous les deux été implémentés dans une version naïve pour commencer, puis dans une deuxième version optimisée et pipelinée. Ceci afin de pouvoir comparer leurs performances. 
  
  Nous avons par la suite réalisé une RAM “sécurisée” car elle possède une zone accessible sans limitation, et deux zones qui sans entrées particulières ne sont respectivement pas du tout accessibles, ou juste en lecture. 
  Pour finir nous avons réalisé une porte dérobée dans la mémoire “sécurisée”, qui permet d’accéder aux données normalement protégées en lecture/écriture dans la RAM.

Le sujet donné est disponible dans le fichier "Sujet CNPa.pdf".

Il a été réalisé en VHDL avec le logiciel Vivado.

Le rapport final est disponible en pdf dans le git "Compte-Rendu TP CNPA.pdf".

## Précisions 


Uniquement les fichiers sources en VHDL sont transmis dans le dépot.

Les fichiers sont mals nommé dès le début, voici le contenu de chaque fichier : 

- AddNbit = Additionneur version non-pipelinée
- Addnbit_v3 = Additionneur version pipelinée
- MulComplexv1 = Multiplicateur version non-pipelinée
- MulComplexv2 = Multiplicateur version pipelinée
- RAM = La ram sans la backdoor
- OOK = Emmeteur OOK
- FSM = Automate de détection de séquence
- RAM_with_Backdoor = RAM avec la backdoor

Tout les fichiers de sources comporte le nom "testbench" ou "tb"
