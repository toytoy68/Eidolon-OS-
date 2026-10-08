# Kernel Lab — Étude, pas implémentation

Objectif : explorer le développement système assisté par ChatGPT/Claude, sans exposer l'installation principale.

## Stratégie
1. Partir d'un kernel Linux maintenu ; établir une configuration de référence.
2. Créer un laboratoire QEMU/VM isolé avec snapshots et CI.
3. Faire proposer des patches limités par un agent, relus indépendamment.
4. Compiler, exécuter des tests de non-régression, mesurer les effets et conserver les logs.
5. N'intégrer que les modifications utiles, vérifiables et maintenables.

Le prototype Rust « OS from scratch » montré en vidéo sert de démonstration pédagogique : il ne prouve ni pilotes complets, ni sécurité, ni stabilité de production. Un microkernel expérimental peut être un sous-projet de recherche séparé, jamais la base par défaut de Prime/Duo.

## Conditions d'arrêt
Régression de stabilité, maintenance disproportionnée, absence de gain mesuré, incompatibilité avec GPU/pilotes ou impossibilité de tester correctement.

Aucun agent ne reçoit un accès root permanent au système hôte.
