if did_filetype() " filetype already set..
    finish" ..don't do these checks
  endif


  au BufRead,BufNewFile *.error.log set filetype=error_log
  au BufRead,BufNewFile *.access.log set filetype=error_log""
