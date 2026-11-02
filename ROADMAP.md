# EidolonOS — Feuille de route exploratoire

La feuille de route produit reste exploratoire. Une base serveur X399 fonctionne : voir le [profil et sa recette](deployment/x399/README.md). Une édition bureau et un installateur complet restent à développer.

1. **Cadrage** : contrats Core/Memory, éditions Prime/Duo, exigences matérielles, sécurité et licences.
2. **Prototype graphique en VM** : comparer KDE Plasma, UKUI et Hyprland ; réaliser les panneaux latéraux et barre IA en maquette fonctionnelle.
3. **Prototype d'intégration** : client Eidolon Core, monitoring, authentification et App Catalog minimal.
4. **Prime expérimental** : packaging, déploiement isolé, sauvegarde/rollback, pilotes GPU et qualification.
5. **Duo** : installateur guidé, profils de permissions, catalogue d'applications, mises à jour fiables et tests multi-matériels.
6. **Pro/DIY et Kernel Lab** : diagnostics, tuning, benchmark et patches expérimentaux, seulement après validation des fondations.

## Critères généraux
Chaque jalon doit produire des tests reproductibles, des limites documentées, un plan de retour arrière et une revue croisée ChatGPT/Claude. Ne pas fusionner automatiquement un prototype vers une version stable.
