library(magrittr)

# Generate random data
set.seed(123)
data <- data.frame(
    Subject1 = runif(5, 0, 1),
    Subject2 = runif(5, 0, 1),
    Subject3 = runif(5, 0, 1)
)
data <- data / rowSums(data)

# Calculate means and standard errors
means <- colMeans(data)
se <- apply(data, 2, sd) / sqrt(nrow(data))

# Create barplot with error bars
barplot(means, ylim = c(0, 1), ylab = "Proportion", names.arg = names(means))
arrows(x0 = 1:length(means), y0 = means - se, y1 = means + se, angle = 90, code = 3, length = 0.1)

# Capture plot to clipboard and display in VS Code plot viewer
devAskNewPage(FALSE)
plot_data <- dev.capture()
png::readPNG(plot_data) %>% grid::grid.raster()