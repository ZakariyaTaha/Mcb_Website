library(vegan)
library(caret)
library(mia)
library(ANCOMBC)
library ('TreeSummarizedExperiment')


test_r <- function(df){
  return(df$' c__Bacilli')
}

simpson <- function(df){
  return(diversity(df,index = "simpson"))
}

shannon <- function(df){
  return(diversity(df,index = "shannon"))
}

beta_dim_red <- function(df, beta_method, dim_method) {
  df$id <- NULL
  
  if (beta_method == 'bray') {
    dist <- vegdist(df, method = 'bray')
  } else if (beta_method == 'chao') {
    dist <- vegdist(df, method = 'chao')
  } else if (beta_method == 'gower') {
    dist <- vegdist(df, method = 'gower')
  } else {
    stop("Invalid beta_method. Choose 'bray', 'chao', or 'gower'.")
  }

  if (dim_method == 'NMDS') {
    projecs <- metaMDS(dist, distance = beta_method)
    stress <- projecs$stress
    projecs <- projecs$points
    return(list(a = projecs, b = stress)) 
    return(projecs)
  } else if (dim_method == 'PCoA') {
    projecs <- cmdscale(dist)
    return(projecs)
  } else {
    stop("Invalid dim_method. Choose 'NMDS' or 'PCoA'.")
  }
}

?metaMDS
cut_var <- function(df, cutoff){
  nzv <- nearZeroVar(df, freqCut = cutoff, saveMetrics= TRUE)
  return(nzv$nzv)
}

perform_ancom <- function(df, y, tab, level) {
  write.csv(df, 'dfff.csv')
  write.csv(y, 'yy.csv')
  write.csv(tab, 'tabb.csv')
  
  df <- DataFrame(df)
  rownames(df) <- df$taxonomy
  df$taxonomy <- NULL
  df <- as.matrix(df)
  assays = SimpleList(counts = df)
  
  rownames(y) <- y$id
  rownames(y)
  y$id <- NULL
  smd = y
  
  tab <- DataFrame(tab)
  rownames(tab) <- tab$taxonomy
  tab$taxonomy <- NULL
  
  tse = TreeSummarizedExperiment(assays = assays,
                                 colData = smd,
                                 rowData = tab)
  
  out = ancombc2(data = tse, assay_name = "counts",
                 tax_level = level, fix_formula ="bin_var", prv_cut = 0.0)
  
  res <- out$res
  write.csv(res, 'res.csv')
  return(res)
}

#df <- read.csv('dfff.csv')
#y <- read.csv('yy.csv')
#tab <- read.csv('tabb.csv')


