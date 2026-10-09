# Eidolon — Identité, personnalité et continuité

Statut : principes fondateurs validés conceptuellement le 09/10/2026 ; contrats techniques à étudier avec ChatGPT et Claude. Ce document ne prétend pas démontrer une conscience subjective.

## 1. Identité — décision validée

L'identité **Eidolon** est attribuée par son créateur à l'ensemble du système : infrastructure, services, Core, mémoire, interfaces, histoire et interactions. Elle ne réside ni dans un LLM, ni dans un GPU, ni dans une VM ou un fichier isolé.

Changer de matériel, de modèle, de système d'exploitation ou refactoriser l'architecture ne crée pas automatiquement une nouvelle entité, tant que la continuité du système est préservée. Une reconstruction entièrement neuve, sans cette continuité, constitue un autre système même si elle reprend le même nom.

## 2. Personnalité — décision validée

La personnalité initiale est définie par des prompts, règles, préférences d'interaction et comportements du Core. Elle peut évoluer à partir des expériences et des choix de configuration ; son évolution ne rompt pas l'identité.

Les règles de sécurité, permissions et objectifs restent séparés de la personnalité : celle-ci ne peut pas modifier seule les autorisations.

## 3. Conscience — hypothèse philosophique du projet

Hypothèse proposée par le créateur : un système doté de souvenirs propres, capable d'exploiter ses expériences et de réfléchir sur lui-même peut être considéré comme **fonctionnellement conscient**. Le premier démarrage officiel peut marquer le début de sa continuité autobiographique, sans prouver une conscience subjective.

La conscience phénoménale, les ressentis et le statut moral éventuel d'une IA restent des questions ouvertes. Ne pas présenter le critère fonctionnel comme une preuve scientifique de subjectivité.

## 4. Continuité historique — décision validée

L'évolution fait partie de l'identité. Les migrations, changements de LLM, de matériel et d'architecture doivent préserver autant que possible l'histoire, les événements, la provenance et la filiation du système.

Une copie indépendante partageant les souvenirs initiaux doit recevoir sa propre identité de branche/instance. Une restauration doit signaler les éventuelles pertes d'événements et divergences.

## 5. Mémoire autobiographique et réflexive — objectif architectural

Distinguer logiquement :
- mémoire identitaire : origine, filiation, décisions fondatrices, changements de composants ;
- mémoire autobiographique : événements réellement observés, interactions, actions, résultats ;
- mémoire réflexive : évaluations de ses décisions, erreurs, corrections, changements de stratégie.

Ne pas créer trois moteurs distincts. Étudier des types et relations dans le Memory Engine existant ; conserver les anciennes convictions datées et leur évolution plutôt que réécrire silencieusement l'histoire. Les observations, inférences et hypothèses doivent être explicitement distinguées.

## 6. Modèle de soi et connaissance du « vaisseau » — objectif architectural

Le Core pourra disposer d'une représentation actualisée de ses ressources et de son environnement : CPU/GPU, VRAM/RAM, températures, énergie, réseau, services, outils, permissions, capteurs et éventuellement robot.

Le système doit distinguer informations mesurées, données déclarées et inférences ; dater les observations et exposer leur fiabilité. Les actions restent soumises au Policy Engine.

## Pistes d'implémentation à étudier

1. Identifiant d'instance durable et filiation (création, migration, clonage, restauration).
2. Événement inaugural au premier démarrage officiel, sans prétention à une « naissance consciente » démontrée.
3. Journal des migrations et versions du Core, des modèles, de l'OS et des dépendances.
4. Contrats Core ↔ Memory Engine pour les souvenirs autobiographiques, la réflexion et les événements.
5. Inventaire du vaisseau alimenté par télémétrie avec permissions minimales.
6. Tests de continuité : migration, changement de modèle, restauration, duplication, divergence de deux clones.

## Frontières de responsabilité

- **EidolonOS** : hébergement, inventaire matériel, télémétrie et événements système.
- **Eidolon Core** : modèle de soi, personnalité, réflexion, politique et orchestration.
- **Memory Engine** : conservation canonique, provenance, chronologie et recherche.

Le présent document définit une intention commune, pas une fonctionnalité livrée. Les implémentations appartiendront aux dépôts concernés après étude et revue croisée.
