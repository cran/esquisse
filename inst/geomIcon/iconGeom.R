

#  ------------------------------------------------------------------------
#
# Title : Icons for geoms
#    By : VP
#  Date : vendredi 21 juillet 2017
#
#  ------------------------------------------------------------------------



# Packages ----------------------------------------------------------------

library( dplyr )
library( ggplot2 )
library( grid )
library( lubridate )





# Fun ---------------------------------------------------------------------

coord_circle <- function(centre = c(0, 0), r = 1, n = 1000) {
  tibble(
    x = seq(from = 0 - r, to = 0 + r, length.out = n %/% 2),
    y = sqrt(r^2 - x^2)
  ) %>% bind_rows(., -.) %>%
    mutate(x = x + centre[1], y = y + centre[2])
}
coord_circle(centre = c(0, 0), r = 1)




#  ------------------------------------------------------------------------








# Geom bar ----------------------------------------------------------------

png(filename = "inst/geomIcon/www/gg-bar.png", bg = "transparent")
ggplot(data = coord_circle(centre = c(0, 0), r = 1)) + geom_polygon(aes(x = x, y = y), fill = "#EF562D") + coord_fixed() + theme_void()
p <- ggplot(mpg) + geom_bar(mapping = aes(x = class), fill = "white") + theme_void()
p0 <- ggplot() +
  geom_segment(aes(x=0, xend=2, y=0, yend=0), size = 2,
               arrow = arrow(length = unit(0.5, "cm")), color = "white") +
  geom_segment(aes(x=0, xend=0, y=0, yend=2), size = 2,
               arrow = arrow(length = unit(0.5, "cm")), color = "white") +
  theme_void()
print(p, vp = viewport(width = unit(0.5, "npc"), height = unit(0.5, "npc")))
dev.off()
# print(p0, vp = viewport(width = unit(0.6, "npc"), height = unit(0.6, "npc")))
# ggsave(filename = "www/gg-bar.png")




# Geom col ----------------------------------------------------------------

png(filename = "inst/geomIcon/www/gg-col.png", bg = "transparent")
ggplot(data = coord_circle(centre = c(0, 0), r = 1)) + geom_polygon(aes(x = x, y = y), fill = "#BA472D") + coord_fixed() + theme_void()
p <- ggplot(data.frame(x = c("a", "b"), y = c(10, 20))) + geom_col(mapping = aes(x, y), fill = "white") + theme_void()
p0 <- ggplot() +
  geom_segment(aes(x=0, xend=2, y=0, yend=0), size = 2,
               arrow = arrow(length = unit(0.5, "cm")), color = "white") +
  geom_segment(aes(x=0, xend=0, y=0, yend=2), size = 2,
               arrow = arrow(length = unit(0.5, "cm")), color = "white") +
  theme_void()
print(p, vp = viewport(width = unit(0.5, "npc"), height = unit(0.5, "npc")))
dev.off()
# print(p0, vp = viewport(width = unit(0.6, "npc"), height = unit(0.6, "npc")))
# ggsave(filename = "www/gg-bar.png")




# Geom line ---------------------------------------------------------------

png(filename = "inst/geomIcon/www/gg-line.png", bg = "transparent")
ggplot(data = coord_circle(centre = c(0, 0), r = 1)) + geom_polygon(aes(x = x, y = y), fill = "#5586A4") + coord_fixed() + theme_void()
p <- ggplot(data = tail(economics, 25)) + geom_line(mapping = aes(x = date, y = psavert), color = "white", size = 2) + theme_void()
print(p, vp = viewport(width = unit(0.6, "npc"), height = unit(0.6, "npc")))
dev.off()





# Geom step ---------------------------------------------------------------

png(filename = "inst/geomIcon/www/gg-step.png", bg = "transparent")
ggplot(data = coord_circle(centre = c(0, 0), r = 1)) + geom_polygon(aes(x = x, y = y), fill = "#85b6d5") + coord_fixed() + theme_void()
p <- ggplot(data = tail(economics, 25)) + geom_step(mapping = aes(x = date, y = psavert), color = "white", size = 2) + theme_void()
print(p, vp = viewport(width = unit(0.6, "npc"), height = unit(0.6, "npc")))
dev.off()





# Geom ribbon -------------------------------------------------------------

png(filename = "inst/geomIcon/www/gg-ribbon.png", bg = "transparent")
ggplot(data = coord_circle(centre = c(0, 0), r = 1)) + geom_polygon(aes(x = x, y = y), fill = "#4b668f") + coord_fixed() + theme_void()
p <- ggplot(data.frame(year = 1875:1972, level = as.vector(LakeHuron)), aes(year, y = level))+
  geom_ribbon(aes(ymin = level - 1, ymax = level + 1), fill = "#ECEFF4") +
  theme_void()
print(p, vp = viewport(width = unit(0.6, "npc"), height = unit(0.6, "npc")))
dev.off()





# Geom path ---------------------------------------------------------------

png(filename = "inst/geomIcon/www/gg-path.png", bg = "transparent")
ggplot(data = coord_circle(centre = c(0, 0), r = 1)) + geom_polygon(aes(x = x, y = y), fill = "#7390BC") + coord_fixed() + theme_void()
p <- ggplot(tail(economics, 100), aes(unemploy/pop, psavert)) + geom_path(color = "white", size = 2) + theme_void()
print(p, vp = viewport(width = unit(0.6, "npc"), height = unit(0.6, "npc")))
dev.off()




# Geom density ------------------------------------------------------------

ggplot(data.frame(x = rnorm(1000))) +
  aes(x) + theme_void() +
  geom_density(fill = "#5587A2", color = "white")


png(filename = "inst/geomIcon/www/gg-density.png", bg = "transparent")
ggplot(data = coord_circle(centre = c(0, 0), r = 1)) + geom_polygon(aes(x = x, y = y), fill = "#05668D") + coord_fixed() + theme_void()
p <- ggplot(data = data.frame(x = rnorm(10000, sd = 20))) + geom_density(mapping = aes(x = x), color = "white", fill = "white") + theme_void()
print(p, vp = viewport(width = unit(0.6, "npc"), height = unit(0.6, "npc")))
dev.off()




# Geom histogram ----------------------------------------------------------

png(filename = "inst/geomIcon/www/gg-histo.png", bg = "transparent")
ggplot(data = coord_circle(centre = c(0, 0), r = 1)) + geom_polygon(aes(x = x, y = y), fill = "#0C4C8A") + coord_fixed() + theme_void()
# p <- ggplot(data = diamonds) + geom_histogram(mapping = aes(x = carat), fill = "white") + theme_void()
# p <- ggplot(data = iris) + geom_histogram(mapping = aes(x = Sepal.Length), fill = "white", bins = 20) + theme_void()
p <- ggplot(data = data.frame(x = rnorm(10000, sd = 20))) + geom_histogram(mapping = aes(x = x), fill = "white", bins = 20) + theme_void()
print(p, vp = viewport(width = unit(0.6, "npc"), height = unit(0.6, "npc")))
dev.off()

ggplot(data = iris) + geom_histogram(mapping = aes(x = Sepal.Length), bins = 20)






# Geom point --------------------------------------------------------------

png(filename = "inst/geomIcon/www/gg-point.png", bg = "transparent")
ggplot(data = coord_circle(centre = c(0, 0), r = 1)) + geom_polygon(aes(x = x, y = y), fill = "#02C39A") + coord_fixed() + theme_void()
# p <- ggplot(data = mtcars) + geom_point(mapping = aes(wt, mpg), size = 10, color = "white") + theme_void()
# p <- ggplot() + geom_point(aes(x = 1:10, y = 1:10), size = 10, color = "white") + theme_void()
p <- ggplot(mtcars, aes(wt, mpg)) + geom_point(size = 10, color = "white") + theme_void()
print(p, vp = viewport(width = unit(0.5, "npc"), height = unit(0.5, "npc")))
dev.off()



# Geom jitter --------------------------------------------------------------

png(filename = "inst/geomIcon/www/gg-jitter.png", bg = "transparent")
ggplot(data = coord_circle(centre = c(0, 0), r = 1)) + geom_polygon(aes(x = x, y = y), fill = "#36D2A9") + coord_fixed() + theme_void()
# p <- ggplot(data = mtcars) + geom_point(mapping = aes(wt, mpg), size = 10, color = "white") + theme_void()
p <- ggplot() + geom_jitter(aes(x = 1:10, y = 1:10), size = 10, color = "white", width = 1, height = 1) + theme_void()
print(p, vp = viewport(width = unit(0.6, "npc"), height = unit(0.6, "npc")))
dev.off()



# Geom smooth -------------------------------------------------------------

png(filename = "inst/geomIcon/www/gg-smooth.png", bg = "transparent")
ggplot(data = coord_circle(centre = c(0, 0), r = 1)) + geom_polygon(aes(x = x, y = y), fill = "#04a8a8") + coord_fixed() + theme_void()
p <- ggplot(data = mpg) +
  aes(displ, hwy) +
  geom_point(color = "#FFFFFF", size = 2) +
  geom_smooth(color = "#FFFFFF", fill = "#FBFAFB", linewidth = 1.4, span = 0.75, level = 0.9999, fullrange = TRUE) +
  theme_void()
print(p, vp = viewport(width = unit(0.8, "npc"), height = unit(0.8, "npc")))
dev.off()


# library(sf)
# png(filename = "inst/geomIcon/www/gg-smooth.png", bg = "transparent")
# ggplot(data = coord_circle(centre = c(0, 0), r = 1)) + geom_polygon(aes(x = x, y = y), fill = "#04a8a8") + coord_fixed() + theme_void()
# p <- ggplot(data = mpg) +
#   aes(displ, hwy) +
#   geom_point(color = "#FFFFFF", size = 2) +
#   geom_smooth(color = "#FFFFFF", fill = "#FBFAFB", linewidth = 1.4, span = 0.75, level = 0.9999, fullrange = TRUE) +
#   theme_void()
# print(p, vp = viewport(width = unit(0.8, "npc"), height = unit(0.8, "npc")))
# p2 <- ggplot(
#   st_difference(
#     st_as_sfc(st_bbox(st_polygon(list(as.matrix(coord_circle(centre = c(0, 0), r = 1)))))),
#     st_polygon(list(as.matrix(coord_circle(centre = c(0, 0), r = 1))))
#   ), col = "#FFFFFF"
# ) + geom_sf(fill = "#FFFFFF", color = "#FFFFFF") + theme_void()
# print(p2, vp = viewport(width = unit(1, "npc"), height = unit(1, "npc")))
# dev.off()




# Geom boxplot ------------------------------------------------------------

png(filename = "inst/geomIcon/www/gg-boxplot.png", bg = "transparent")
ggplot(data = coord_circle(centre = c(0, 0), r = 1)) + geom_polygon(aes(x = x, y = y), fill = "#97D5E0") + coord_fixed() + theme_void()
p <- ggplot(data = iris) + geom_boxplot(mapping = aes(x = Species, y = Sepal.Width), color = "black", fill = "white", size = 2) + theme_void()
print(p, vp = viewport(width = unit(0.6, "npc"), height = unit(0.6, "npc")))
dev.off()




# Geom violin -------------------------------------------------------------

png(filename = "inst/geomIcon/www/gg-violin.png", bg = "transparent")
ggplot(data = coord_circle(centre = c(0, 0), r = 1)) + geom_polygon(aes(x = x, y = y), fill = "#A9BCF5") + coord_fixed() + theme_void()
p <- ggplot(data = iris) +
  geom_violin(mapping = aes(x = Species, y = Sepal.Width), adjust = .5, color = "black", fill = "white", size = 2) +
  theme_void()
print(p, vp = viewport(width = unit(0.6, "npc"), height = unit(0.6, "npc")))
dev.off()




# Geom auto ---------------------------------------------------------------

png(filename = "inst/geomIcon/www/gg-auto.png", bg = "transparent")
ggplot(data = coord_circle(centre = c(0, 0), r = 1)) + geom_polygon(aes(x = x, y = y), fill = "#F6D258") + coord_fixed() + theme_void()
p <- ggplot() + geom_text(mapping = aes(x = 0, y = 0, label = "auto"), color = "white", size = 50) + theme_void()
print(p, vp = viewport(width = unit(0.6, "npc"), height = unit(0.6, "npc")))
dev.off()





# Geom blank --------------------------------------------------------------

png(filename = "inst/geomIcon/www/gg-blank.png", bg = "transparent")
ggplot() +
  geom_polygon(data = coord_circle(centre = c(0, 0), r = 1), aes(x = x, y = y), fill = "#FFFFFF", color = "#000000") +
  coord_fixed() +
  geom_text(mapping = aes(x = 0, y = 0, label = "blank"), color = "#000000", size = 50) +
  theme_void()
# p <- ggplot() + geom_text(mapping = aes(x = 0, y = 0, label = "blank"), color = "#000000", size = 50) + theme_void()
# print(p, vp = viewport(width = unit(0.6, "npc"), height = unit(0.6, "npc")))
dev.off()



# Geom select --------------------------------------------------------------

png(filename = "inst/geomIcon/www/gg-select.png", bg = "transparent")
ggplot() +
  geom_polygon(data = coord_circle(centre = c(0, 0), r = 1), aes(x = x, y = y), fill = "#FFFFFF", color = "#FFFFFF") +
  coord_fixed() +
  geom_text(mapping = aes(x = 0, y = 0, label = "select\ngeom"), color = "#000000", size = 46) +
  theme_void()
# p <- ggplot() + geom_text(mapping = aes(x = 0, y = 0, label = "blank"), color = "#000000", size = 50) + theme_void()
# print(p, vp = viewport(width = unit(0.6, "npc"), height = unit(0.6, "npc")))
dev.off()




# Geom tile ---------------------------------------------------------------

png(filename = "inst/geomIcon/www/gg-tile.png", bg = "transparent")
df <- expand.grid(x = 0:3, y = 0:3)
df$z <- runif(nrow(df))
ggplot(data = coord_circle(centre = c(0, 0), r = 1)) + geom_polygon(aes(x = x, y = y), fill = "#238B45") + coord_fixed() + theme_void()
p <- ggplot(data = df) + geom_tile(aes(x, y, fill = z)) + scale_fill_distiller(palette = "Greens", guide = FALSE) + theme_void()
print(p, vp = viewport(width = unit(0.6, "npc"), height = unit(0.6, "npc")))
dev.off()





# Geom sf -----------------------------------------------------------------

library(sf)
library(rnaturalearth)
library(dplyr)
png(filename = "inst/geomIcon/www/gg-sf.png", bg = "transparent")
world <- rnaturalearth::ne_countries(returnclass = "sf")
ggplot(data = coord_circle(centre = c(0, 0), r = 1)) + geom_polygon(aes(x = x, y = y), fill = "#FAAC58") + coord_fixed() + theme_void()
p <- ggplot(data = st_transform(world, 54032)) +
  geom_sf(fill = "transparent", color = "white", size = 1.2) + coord_sf(datum = NA) + theme_void()
print(p, vp = viewport(width = unit(0.9, "npc"), height = unit(0.9, "npc")))
dev.off()


# ggplot(data = filter(world, !continent %in% c("Antarctica", "Seven seas (open ocean)"))) +
#   geom_sf() + coord_sf(crs = 102016) + theme_void()
# ggplot(data = filter(world, !continent %in% c("Antarctica", "Seven seas (open ocean)"))) +
#   geom_sf() + coord_sf(crs = 54032, ndiscr = 0) + theme_void()
#
# ggplot(data = st_transform(world, 54030)) +
#   geom_sf(fill = "transparent", color = "steelblue") + coord_sf(datum = NA) + theme_void()
#





# Geom area ---------------------------------------------------------------

series <- data.frame(
  time = c(rep(1, 4),rep(2, 4), rep(3, 4), rep(4, 4)),
  type = rep(c('a', 'b', 'c', 'd'), 4),
  value = rpois(16, 10)
)
series$type2 <- factor(series$type, levels = c('c', 'b', 'd', 'a'))

png(filename = "inst/geomIcon/www/gg-area.png", bg = "transparent")
ggplot(data = coord_circle(centre = c(0, 0), r = 1)) + geom_polygon(aes(x = x, y = y), fill = "#97cbc2") + coord_fixed() + theme_void()
p <- ggplot(series, aes(time, value)) +
  geom_area(aes(fill = type2)) +
  # scale_fill_brewer(palette = "Greens", guide = FALSE) +
  scale_fill_manual(values = rev(c("#4b668f", "#5586a4", "#6ba4b1", "#80bebe")), guide = FALSE) +
  theme_void()
print(p, vp = viewport(width = unit(0.6, "npc"), height = unit(0.6, "npc")))
dev.off()







# Geom text ---------------------------------------------------------------

png(filename = "inst/geomIcon/www/gg-text.png", bg = "transparent")
ggplot(data = coord_circle(centre = c(0, 0), r = 1)) + geom_polygon(aes(x = x, y = y), fill = "#CD2EFB") + coord_fixed() + theme_void()
p <- ggplot(mtcars, aes(wt, mpg, label = rownames(mtcars))) +
  geom_text(color = "white", size = 9) +
  xlim(0, 8) +
  ylim(7, 40) +
  theme_void()
print(p, vp = viewport(width = unit(0.8, "npc"), height = unit(0.8, "npc")))
dev.off()



# Geom label --------------------------------------------------------------

png(filename = "inst/geomIcon/www/gg-label.png", bg = "transparent")
ggplot(data = coord_circle(centre = c(0, 0), r = 1)) + geom_polygon(aes(x = x, y = y), fill = "#AC59FB") + coord_fixed() + theme_void()
p <- ggplot(mtcars, aes(wt, mpg, label = rownames(mtcars))) +
  geom_label(color = "black", size = 9) +
  xlim(0, 8) +
  ylim(7, 40) +
  theme_void()
print(p, vp = viewport(width = unit(0.8, "npc"), height = unit(0.8, "npc")))
dev.off()
