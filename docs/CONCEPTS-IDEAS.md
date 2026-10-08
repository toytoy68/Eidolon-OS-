# EidolonOS — Concepts et idées

Statut : document de réflexion, aucune fonctionnalité implémentée ou validée.

## Vision
EidolonOS est un environnement Linux AI-first. Le Core orchestre modèles, agents, skills, outils et permissions ; Memory Engine reste une dépendance indépendante, source de vérité des souvenirs. Le système doit fonctionner localement autant que possible.

## Variantes
- **Prime** : système personnel expérimental, orienté serveur Eidolon, GPU, services et R&D.
- **Duo** : distribution publique, simple à installer et à utiliser, sans compétence Linux requise.
- **Duo Pro** : réglages avancés, ressources, réseau, modèles, conteneurs et diagnostics.
- **Duo DIY/Hardcore** : laboratoire de développement, kernel, profiling et benchmarks. Noms provisoires.

## Interface AI-first
- Bureau personnalisable (thèmes IA, technologie, industriel, mecha).
- Bandeau supérieur : état CPU, GPU, VRAM, RAM, services et raccourcis techniques.
- Bandeau inférieur : commande en langage naturel, chat et applications quotidiennes.
- Panneaux latéraux contextuels réveillables depuis une icône, extensibles (compact, large, plein écran) : console, vidéo seule, chat, monitoring, outils.
- Menu gauche escamotable ; organisation automatique des panneaux selon la mission, sous contrôle utilisateur.
- Interface commune mais profils simplifiés pour Duo, étendus pour Hardcore.

## Études graphiques à comparer
- **KDE Plasma** : base de bureau complète et personnalisable.
- **UKUI / openKylin** : ergonomie familière de type Windows, IA système intégrée à étudier.
- **Hyprland / Omarchy** : mosaïque de fenêtres, raccourcis, thèmes et expérience développeur.
- Ne pas confondre thème graphique, gestionnaire de fenêtres, distribution et noyau. Aucun choix figé.

## App Manager
Catalogue déclaratif d'applications et services (description, source, version, dépendances, permissions, installation, mise à jour, désinstallation). Étudier CasaOS, ZimaOS, Omarchy et les installateurs reproductibles. Les installations proposées par l'IA nécessitent validation et privilèges minimaux.

## Intégration Core
- Model/Task Router ; Mission Manager ; Agent Registry ; Skills/MCP ; A2A éventuel.
- Policy/Permission Engine séparé du modèle ; actions sensibles soumises à validation.
- Scheduler, gestion des ressources et surveillance des services.
- API locale protégée ; ne pas exposer directement des backends d'inférence sur toutes les interfaces réseau.

## IA locale et infrastructure
Support de différents backends (Ollama, llama.cpp et autres après qualification), des configurations GPU et des modèles spécialisés. AI Lab pour mesurer qualité, latence, contexte, VRAM, puissance, stabilité, cache et régressions. NVLink et multi-GPU ne signifient pas VRAM automatiquement unifiée.

## Contribution volontaire
Duo peut proposer une participation opt-in à des tests distribués : aucune donnée personnelle ni mémoire privée envoyée par défaut ; quotas, sandbox, transparence, retrait du consentement et validation des résultats.

## Références issues des vidéos
- Omarchy : expérience développeur et menu d'installation d'outils IA.
- openKylin : bureau familier et assistant système ; vérifier les annonces et le code avant toute adoption.
- Prototype d'OS généré par Claude Code : démonstration d'un noyau expérimental, pas preuve d'un OS quotidien fiable.

Les concepts doivent être transformés en spécifications et tests avant développement.
