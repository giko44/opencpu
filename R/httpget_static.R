httpget_testapp <- function(requri){
  #check if API has been enabled
  check.enabled("api.testapp");

  #only GET
  res$checkmethod()

  #set cache value
  res$setcache("static")

  # Prevent path traversal attack via ..%2F..%2F..%2F
  testapp <- system.file('test', package = 'opencpu')
  path <- do.call(file.path, as.list(c(testapp, requri)))
  assert_subdir(path, testapp)
  res$sendfile(path)
}
