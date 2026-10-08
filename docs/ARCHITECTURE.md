# EidolonOS — Architecture cible (proposition)

```text
Utilisateur / UI / voix / robot / clients
                 |
             Eidolon Core
   +-------------+--------------+
   |             |              |
Mission/Agents  Skills/Tools   Policy/Permissions
   |             |              |
   +------ Model/Task Router ---+
                 |
        Model Runtime / GPU
                 |
       Memory Engine (externe)

Linux + gestionnaire de services + bureau + pilotes
```

## Frontières
- **EidolonOS** : distribution, interface, services système, packaging, mises à jour et récupération.
- **Core** : planification, agents, skills, outils, permissions, orchestration.
- **Memory Engine** : données durables, provenance, événements, Threads et recherche ; pas d'exécution d'agents.
- **Kernel Linux** : conserver l'amont autant que possible ; aucun fork nécessaire par défaut.

## Contraintes transverses
Compatibilité CPU/GPU, isolation, authentification, observabilité, sauvegarde/restauration, installation reproductible, mises à jour atomiques ou rollback à étudier, sécurité des données et maintenance.

## Décisions ouvertes
Distribution de base, environnement graphique, packaging, cadence des versions, compatibilité matérielle, modalités d'intégration de Core et du Memory Engine. Aucun choix irréversible à ce stade.
