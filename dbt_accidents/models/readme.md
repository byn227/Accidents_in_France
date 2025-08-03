# README - Modèles DBT

Ce dossier contient les modèles DBT utilisés pour transformer et organiser les données des accidents de la route en France.

## Organisation des modèles

- **staging/** : Modèles de préparation des données brutes (nettoyage, typage, renommage des colonnes).
- **intermediate/** : Modèles intermédiaires pour la transformation et l'enrichissement des données.
- **core/** : Modèles finaux prêts pour l'analyse (dimensions, faits).

## Utilisation

Les modèles sont organisés pour faciliter la maintenance et la réutilisation. Chaque sous-dossier correspond à une étape du pipeline de transformation :

1. Les modèles de staging importent et préparent les données sources.
2. Les modèles intermédiaires réalisent des jointures, agrégations ou enrichissements.
3. Les modèles core exposent les tables finales pour l'analyse et le reporting.

## Bonnes pratiques

- Documenter chaque modèle avec des commentaires et des fichiers YAML.
- Utiliser des noms explicites pour les modèles et les colonnes.
- Tester les modèles avec `dbt test` pour garantir la qualité des données.


