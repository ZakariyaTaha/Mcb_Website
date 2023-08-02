install.packages('Rmpfr', type = 'source')
install.packages('nloptr', type = 'source')
install.packages('CVXR', type = 'source')
install.packages('lme4', type = 'source')
install.packages('lmerTest', type = 'source')

if (!requireNamespace("BiocManager", quietly = TRUE))
   install.packages("BiocManager")

BiocManager::install('ANCOMBC')

#install.packages("remotes")
#remotes::install_github("microbiome/mia")

install.packages('vegan')
install.packages('caret')

install.packages('TreeSummarizedExperiment')