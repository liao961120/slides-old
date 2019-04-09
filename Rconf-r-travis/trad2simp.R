library(ropencc)
cc <- converter(TW2SP)

trad <- readLines('index.Rmd')
simp <- run_convert(cc, trad)

writeLines(simp, 'index_simp.Rmd')


## Copy to slide folder

source_files <- list.files(full.names = TRUE)
trad_source_idx <- which(grepl('(Rmd)|(html)|(_files)|(md)$', source_files))
source_files <- source_files[-trad_source_idx]

file.copy(from = source_files, to = '~/slides/Rconf-r-travis', 
          recursive = TRUE)

file.copy(from = './index_simp.Rmd', 
          to = '~/slides/Rconf-r-travis/index.Rmd', overwrite = TRUE)