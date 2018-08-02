httpget_doc <- function(requri){
  #check if API has been enabled
  check.enabled("api.doc");

  #set cache value as for libraries
  res$setcache("lib");

  #find doc dir
  docdir <- Sys.getenv("R_DOC_DIR", "/usr/share/R/doc")
  path <- file.path(docdir, paste(requri, collapse="/"))
  assert_subdir(path, docdir)
  httpget_file(path)
}
