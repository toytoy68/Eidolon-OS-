# Reconstruction, recette et retour arrière

## Préparer une VM sans données personnelles

1. Vérifier l'image Debian genericcloud avec sa somme publiée. Archiver nom,
   version et empreinte. Le laboratoire utilise une copie locale contrôlée.
2. Faire qemu-img convert vers un nouveau fichier QCOW2 autonome puis resize à
   la taille du rôle. Refuser un chemin déjà existant ; ne pas copier un disque
   de production ouvert par QEMU.
3. Préparer un seed NoCloud propre : instance-id, hostname, clé SSH publique,
   compte administrateur, ssh_pwauth=false, disable_root=true. Installer le
   paquet qemu-guest-agent. Aucun secret ni seed personnel dans Git.
4. Adapter une copie du XML : nom/MAC uniques, chemins du disque et du seed,
   RAM et vCPU. Vérifier les montages et permissions libvirt-qemu.
5. Vérifier XML et disponibilité du type pc-i440fx-10.0, puis virsh define/start.
   Les exemples utilisent le réseau default existant : comparer les réservations
   avant toute modification, sans écraser celles d'autres invités.
6. Relever le bail, établir la confiance initiale de la nouvelle clé d'hôte dans
   un known_hosts dédié et utiliser ensuite StrictHostKeyChecking=yes.
7. Vérifier cloud-init done sans erreur, SSH, route DHCP, DNS ; redémarrer la
   VM et vérifier de nouveau ; arrêt/démarrage propre. L'autostart est un choix
   par rôle, pas une propriété à activer sur tous les tests.

Recette du lot : VM eidolon-audit-smoke-20261102, créée depuis le cloud image
avec une copie du XML, 2 vCPU / 2 GiB / 20 GiB. Démarrage, DHCP, SSH, DNS et
cloud-init sans erreur exécutés. Cela ne qualifie pas une charge Memory/Nomifactory.

## Préserver la continuité avant bascule

L'ancienne Memory reste la référence jusqu'à la copie finale. Préparer sauvegarde
et test de restauration sur une cible isolée ; figer brièvement les écritures,
transférer le delta, comparer canon/historique/journal et empreintes, reconstruire
ou vérifier l'index, tester une nouvelle écriture et son rappel, puis seulement
changer la destination des consommateurs. Ne pas créer deux écrivains divergents.

Donner aux clones de tests une identité et des jetons distincts. Journaliser
migration/restauration et éventuelles pertes d'événements. Mesurer RPO/RTO.
La copie SK conservée sur WD protège l'ancien contenu, mais n'est pas une
sauvegarde indépendante du WD/hôte. Prévoir un autre support avant bascule finale.
Les modèles Core inventoriés dépassent le volume apps de 200 GiB : prévoir leur
placement et capacité explicitement.

## Pare-feu

Sauvegarder /etc/nftables.conf et les éventuels drop-ins ; tester nft --check.
La correction du lot ne détruit que la table inet eidolon_filter et conserve
les tables libvirt. Le fichier network/eidolon-filter.nft et le drop-in systemd
sont un ensemble cohérent ; un ExecStop global flush ruleset réintroduirait le défaut.
En cas de retour à l'ancien fichier : retirer seulement le drop-in ajouté par
ce lot et restaurer la sauvegarde identifiée ; éviter de charger un ancien
flush ruleset sur des VM actives sans rétablir explicitement leur réseau libvirt.

Le redémarrage hôte à froid, la reprise après panne secteur et la supervision
applicative complète restent à qualifier avec accès de récupération disponible.
