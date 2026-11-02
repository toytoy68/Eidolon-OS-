# Profil X399 — 2 novembre 2026

Eidolon Core Technologies (ECT) — Local AI • Modular • Reliable • Reproducible.
Configuration observée et testée ; pas encore un installateur complet.

## Base matérielle et stockage

Debian 13, noyau 6.12.113+deb13-amd64 ; Threadripper 1950X, 16C/32T,
environ 110 GiB de RAM visibles. WD 2 To : vg_eidolon, volumes root 120 GiB,
apps 200, state 250, data 400, work 300. SK Hynix SATA 512 Go : ext4 sur
/srv/eidolon/ssd. Identifier les disques par leurs identifiants durables, jamais
par leur seul ordre /dev/sdX. Secrets, seeds et UUID privés restent hors Git.

| VM | vCPU | RAM GiB | Disque GiB | IP du laboratoire | Autostart |
| --- | ---: | ---: | ---: | --- | --- |
| Memory-engine | 8 | 16 | 100 | 192.168.122.70 | oui |
| Memory-engine-tests | 8 | 16 | 80 | 192.168.122.71 | non |
| Memory-tests | 8 | 24 | 100 | 192.168.122.72 | non |
| nomifactory-test | 4 | 12 | 120 | 192.168.122.73 | non |

Les XML proviennent de dumpxml --inactive : UUID et labels dynamiques retirés.
BIOS, pc-i440fx-10.0, CPU host-model, VGA, VirtIO disque/réseau, VNC loopback.
Trois images sur data/vm-images/roles ; Nomifactory sur ssd/vm-images.
Les QCOW2 sont autonomes. Les anciens domaines/pools historiques ne doivent pas
être réactivés ou reformatés simplement parce que leurs disques manquent.

## Réseau : correction appliquée

Le NAT/DHCP/DNS libvirt utilise default/virbr0. Le pare-feu doit accepter DHCP
udp 68 vers 67 et DNS udp/tcp 53 des invités vers leur passerelle 192.168.122.1.
L'ancien flush ruleset supprimait aussi le NAT libvirt lors d'un reload.
network/eidolon-filter.nft ne remplace désormais que inet eidolon_filter ; le
drop-in systemd/nftables-libvirt.conf limite aussi ExecStop à cette table.
Prérequis testé : nftables 1.1.3, commande destroy.

Avant application : sauvegarde, nft --check, vérification de la règle SSH adaptée
au réseau administrateur. Ne pas recopier aveuglément les adresses du laboratoire.
Deux chargements en namespace isolé ont conservé une table sentinelle ; après
application réelle, la table NAT libvirt est identique avant/après, DNS/SSH passent.
Sauvegarde locale : /var/backups/eidolon-audit-20261102/nftables.conf.before.
Le profil autorise le port hôte 8079 depuis les invités ; il ne prétend pas isoler
les VM entre elles ni réaliser le confinement sortant DARME.

## Reconstruction et limites

Voir RECONSTRUCTION.md. Les cinq XML passent virt-xml-validate.
Une VM jetable neuve utilisant ce profil démarre : cloud-init done sans erreur,
SSH, bail DHCP et résolution DNS fonctionnels. Les recettes matérielles et
applicatives sont distinctes. Aucun redémarrage hôte réalisé dans ce lot.
