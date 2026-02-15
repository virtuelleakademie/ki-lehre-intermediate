# Shared visualization setup for all workshop .qmd files
# Source this file in every setup chunk that produces figures.
#
# Brand palette defined in _brand.yml:
#   dark-grey: #222222, lightgrey: #F5F5F5, accent: #9A4665
# Slide SCSS mirrors these in styles/custom-reveal.scss.

library(tidyverse)

# Brand colors (from _brand.yml)
brand_dark <- "#222222"
brand_light <- "#F5F5F5"
brand_accent <- "#9A4665"

# Colorblind-safe palette (Okabe-Ito) for data encoding
color_positive <- "#0072B2"    # Blue
color_negative <- "#D55E00"    # Vermillion
color_neutral <- "#64748b"     # Slate grey
color_attention <- "#E69F00"   # Amber
color_sky <- "#56B4E9"         # Sky blue

# Common theme
theme_workshop <- function(base_size = 13) {
  theme_minimal(base_size = base_size) +
    theme(
      plot.title = element_text(face = "bold", size = 16, color = brand_dark),
      plot.subtitle = element_text(size = 11, color = color_neutral, margin = margin(b = 15)),
      plot.caption = element_text(size = 9, color = color_neutral, hjust = 0, margin = margin(t = 10)),
      axis.title = element_text(face = "bold", size = 11),
      axis.text = element_text(size = 10, color = brand_dark),
      panel.grid.minor = element_blank(),
      panel.grid.major = element_line(color = "#e5e7eb", linewidth = 0.3),
      plot.background = element_rect(fill = "white", color = NA)
    )
}
