# Accidents en France de 2005 à 2023

## Présentation
Ce projet analyse les données des accidents de la route en France à l'aide de DBT (Data Build Tool) pour modéliser, tester et documenter les données. L'objectif est de fournir des tables propres et prêtes pour l'analyse et le reporting.


 ## Architecture du projet

![image](assets/system.png)
## Source des données
Les données proviennent du site officiel de la Direction Interministérielle du Numérique : https://www.data.gouv.fr/datasets/bases-de-donnees-annuelles-des-accidents-corporels-de-la-circulation-routiere-annees-de-2005-a-2023/

Les données d’entrée et de sortie sont stockées sur GCP BigQuery.

## Prérequis
- Python 3.8+
- DBT (dbt-core, dbt-utils)
- Les bibliothèques Python listées dans `requirements.txt`
- Système d'exploitation: Windows (scripts d'installation dédiés)
- Data Warehouse BigQuery(GCP)

## Installation

### 1. Créer un environnement virtuel Python
```cmd
bin\windows\install_python_venv.bat
```

### 2. Installer les bibliothèques Python
```cmd
bin\windows\install_python_libraries.bat
```

### 3. Installer DBT et les packages nécessaires
```cmd
bin\windows\install_dbt_libraries.bat
```

### 4. Configurer DBT
Utiliser le commande ` dbt init` pour initialiser le projet DBT.
Modifiez le fichier `dbt_accidents/profiles.yml` avec les informations de connexion à votre base de données.
Verifiez la configuration du projet sur GCP dans `dbt_accidents/config/`, c'est privé. 

## Utilisation

### Exécuter DBT
Dans le dossier du projet DBT :
```cmd
cd dbt_accidents
dbt debug
dbt seed
dbt run
dbt test
dbt docs generate
dbt docs serve
```

- Utiliser `dbt seed` pour charger les données de seed.  
- Utiliser `dbt debug` pour vérifier la configuration de votre projet.  
- Utiliser `dbt run` pour exécuter le projet DBT.  
- Utiliser `dbt test` pour exécuter les tests.  
- Utiliser `dbt docs generate` pour générer les documents.  
- Utiliser `dbt docs serve` pour servir les documents.  
- Utiliser `dbt build` pour faire run + test + snapshot + seed en une seule commande (workflow complet).  


### Structure du projet
- `dbt_accidents/` : Projet principal DBT
  - `models/` : Modèles de données (staging, intermediate, core)
  - `macros/` : Macros DBT personnalisées
  - `analyses/`, `seeds/`, `snapshots/` : Extensions
  - `dbt_packages/` : Packages DBT externes (ex : dbt_utils)
  - `config/` : Fichiers de configuration
  - `target/` : Résultats de compilation et d'exécution DBT
  - `test/`: Tests DBT
- `bin/windows/` : Scripts d'installation pour Windows
- `requirements.txt` : Liste des bibliothèques Python

## Tests
Le resultat de l'execution de "dbt test" est le suivant:
![image](assets/result.png)




