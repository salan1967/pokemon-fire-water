#Mam Salan Njie
#lab 04
install.packages("ggplot2")
library(ggplot2)
poke <- read.csv("/Users/msalan/Downloads/pokemon.csv")
head(poke)
graph1.no.na <- subset(poke, Height.in != "NA" & Special.Attack != "NA")
graph1 <- ggplot(graph1.no.na, aes(x = log(Height.in), y = log(Special.Attack),  color = as.factor(Evolutionary.stage.code))) +
  geom_point() +
  labs(title = "Pokémon Attack By Height", x = "Log Height (in inches)", y = "Log Attack", color = "Evolutionary Stage") +
  theme_minimal()
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00")
colored <-graph1 + scale_color_manual(values = cbPalette)
colored
png("pokemon_attack_by_height.png", units = "px", width = 2000, height = 1500, res = 300)
print(colored)
dev.off()

install.packages("ggplot2")
library(ggplot2)
poke <- read.csv("/Users/msalan/Downloads/pokemon.csv")
head(poke)
graph2_no_na <- subset(poke, Total.evolutionary.stages != "NA" & (Types == "Water" | Types == "Fire"))
graph2 <- ggplot(graph2_no_na, aes(x = Types)) + geom_bar() +facet_wrap(~ Total.evolutionary.stages)+
  labs(title = "Total Evolutionary Stages in Water and Fire Pokémon", x = "Pokémon Type", y = "Number of Pokémon")
bar_plot <- graph2 + theme_bw()
bar_plot
png("tot_evolutionary_stages_type.png", units = "px", width = 2000, height = 1500, res = 300)
print(bar_plot)
dev.off()



