# Installer les bibliothèques 
install.packages(c("tidyverse", "modelsummary"))

# Charger les bibliothèques 
library(tidyverse)
library(modelsummary)

# Utiliser read.csv pour charger un fichier CSV
data <- read.csv("~/Downloads/quality_governance_1.csv")

# Vérifier les premières lignes de votre dataset
head(data)

# Statistiques descriptives pour les variables principales
summary(data)

# Vérifier les noms de toutes les colonnes
colnames(data)


# Afficher les statistiques descriptives spécifiques pour les variables d'intérêt
summary(data$esperance_vie)
summary(data$renouvelable)
summary(data$co2)


# Utilisation de geom_histogram() pour afficher la distribution de l'espérance de vie
ggplot(data, aes(x = esperance_vie)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black", alpha = 0.7) +
  ggtitle("Distribution de l'espérance de vie") +
  xlab("Espérance de Vie (en années)") +
  ylab("Fréquence") +
  theme_minimal()


# Relation entre électricité renouvelable et espérance de vie
ggplot(data, aes(x = renouvelable, y = esperance_vie)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE, color = "blue") +
  ggtitle("Relation entre l'électricité renouvelable et l'espérance de vie")

# Relation entre qualité de l'air et espérance de vie
ggplot(data, aes(x = co2, y = esperance_vie)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE, color = "red") +
  ggtitle("Relation entre la qualité de l'air et l'espérance de vie")


# Régression linéaire simple
model <- lm(esperance_vie ~ renouvelable, data = data)

# Résumé des résultats de la régression
summary(model)

