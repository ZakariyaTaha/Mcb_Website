# Log file path

# Set CRAN repository URL
options(repos = c(CRAN = "https://cran.r-project.org"))
install.packages('Matrix', dependencies=TRUE)


# Install specific R packages with necessary dependencies
install.packages('Rmpfr', type = 'source')
install.packages('nloptr', type = 'source')

# Install Matrix package with the required version before CVXR
# Install additional packages and handle potential issues
install_packages_with_retry <- function(pkgs) {
  for (pkg in pkgs) {
    tryCatch({
      install.packages(pkg)
      if (!requireNamespace(pkg, quietly = TRUE)) {
        stop(paste(pkg, 'not installed successfully'))
      }
    }, error = function(e) {
      message("Error installing ", pkg, ": ", e$message)
      cat("Error installing ", pkg, ": ", e$message, "\n", file = log_file, append = TRUE)
    })
  }
}

install_packages_with_retry(c('osqp', 'CVXR', 'lme4', 'lmerTest', 'gsl', 'energy'))


# Install BiocManager if not already installed
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

# Update BiocManager to the latest compatible version for R 4.4
BiocManager::install(version = "3.19")

# Ensure required Bioconductor packages are installed before ANCOMBC
BiocManager::install(c("SummarizedExperiment", "TreeSummarizedExperiment", "microbiome", "DirichletMultinomial"))

# Install remotes package and install the mia package from GitHub
install.packages('remotes', repos='http://cran.rstudio.com/', dependencies=TRUE)
if (!requireNamespace('remotes', quietly = TRUE)) stop('remotes package not found')
library(remotes)
remotes::install_github('microbiome/mia')

BiocManager::install('ANCOMBC')

# Additional R packages
install.packages('vegan')
install.packages('caret')
install.packages('TreeSummarizedExperiment')

# Verify installed packages
installed_packages <- installed.packages()
write.csv(installed_packages, file = "/app/installed_packages.csv")






# # Log file path
# log_file <- "/app/install.log"
# # Create log file and write starting message
# cat("Starting R package installation\n", file = log_file)

# # Set CRAN repository URL
# options(repos = c(CRAN = "https://cran.r-project.org"))

# # Matrix
# ########################################################################################################################
# cat("################### Marker 0 ###################\n")

# # Error log file setup
# error_log_file_matrix <- "/app/error_matrix.log"
# con_m <- file(error_log_file_matrix, open = "wt")
# sink(con_m, type = "message")

# # Install Matrix
# tryCatch({
#   install.packages('Matrix', dependencies=TRUE)
#   if (!requireNamespace('Matrix', quietly = TRUE)) {
#     stop('Matrix not installed successfully')
#   }
# }, error = function(e) {
#   message("Error installing Matrix: ", e$message)
#   cat("Error installing Matrix: ", e$message, "\n", file = log_file, append = TRUE)
# })

# # Stop redirecting error messages
# sink(type = "message")
# close(con_m)

# cat("Error messages have been saved to", error_log_file_matrix, "\n")
# log_content <- readLines(error_log_file_matrix)
# cat(log_content, sep = "\n")

# ########################################################################################################################

# cat("################### Marker 1 ###################\n")

# # Install specific R packages with necessary dependencies
# install.packages('Rmpfr', type = 'source')
# install.packages('nloptr', type = 'source')

# # Install Matrix package with the required version before CVXR
# # Install additional packages and handle potential issues
# install_packages_with_retry <- function(pkgs) {
#   for (pkg in pkgs) {
#     tryCatch({
#       install.packages(pkg)
#       if (!requireNamespace(pkg, quietly = TRUE)) {
#         stop(paste(pkg, 'not installed successfully'))
#       }
#     }, error = function(e) {
#       message("Error installing ", pkg, ": ", e$message)
#       cat("Error installing ", pkg, ": ", e$message, "\n", file = log_file, append = TRUE)
#     })
#   }
# }

# install_packages_with_retry(c('osqp', 'CVXR', 'lme4', 'lmerTest', 'gsl', 'energy'))

# cat("################### Marker 2 ###################\n")

# # Install BiocManager if not already installed
# if (!requireNamespace("BiocManager", quietly = TRUE)) {
#   install.packages("BiocManager")
# }

# # Update BiocManager to the latest compatible version for R 4.4
# BiocManager::install(version = "3.19")

# # Ensure required Bioconductor packages are installed before ANCOMBC
# BiocManager::install(c("SummarizedExperiment", "TreeSummarizedExperiment", "microbiome", "DirichletMultinomial"))

# ########################################################################################################################
# cat("################### Marker 2.5 ###################\n")

# # Install remotes package and install the mia package from GitHub
# install.packages('remotes', repos='http://cran.rstudio.com/', dependencies=TRUE)
# if (!requireNamespace('remotes', quietly = TRUE)) stop('remotes package not found')
# library(remotes)

# error_mia <- "/app/error_mia.log"
# con_mia <- file(error_mia, open = "wt")
# sink(con_mia, type = "message")

# tryCatch({
#   remotes::install_github('microbiome/mia')
#   if (!requireNamespace('mia', quietly = TRUE)) {
#     stop('mia not installed successfully')
#   }
# }, error = function(e) {
#   message("Error installing mia: ", e$message)
#   cat("Error installing mia: ", e$message, "\n", file = error_mia, append = TRUE)
# })

# # Stop redirecting error messages
# sink(type = "message")
# close(con_mia)

# cat("Error messages have been saved to", error_mia, "\n")
# log_content_mia <- readLines(error_mia)
# cat(log_content_mia, sep = "\n")
# ########################################################################################################################

# cat("################### Marker 3 ###################\n")

# # Error log file setup
# error_log_file <- "/app/error_log.log"
# con <- file(error_log_file, open = "wt")
# sink(con, type = "message")

# # Install ANCOMBC package from Bioconductor and check for successful installation
# tryCatch({
#   BiocManager::install('ANCOMBC')
#   if (!requireNamespace('ANCOMBC', quietly = TRUE)) {
#     stop('ANCOMBC not installed successfully')
#   }
# }, error = function(e) {
#   message("Error installing ANCOMBC: ", e$message)
#   cat("Error installing ANCOMBC: ", e$message, "\n", file = log_file, append = TRUE)
# })

# # Stop redirecting error messages
# sink(type = "message")
# close(con)

# cat("Error messages have been saved to", error_log_file, "\n")

# ########################################################################################################################

# cat("################### Marker 4 ###################\n")

# # Additional R packages
# install.packages('vegan')
# install.packages('caret')
# install.packages('TreeSummarizedExperiment')

# # Verify installed packages
# installed_packages <- installed.packages()
# write.csv(installed_packages, file = "/app/installed_packages.csv")
