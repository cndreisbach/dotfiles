function pdfmerge -a output_file -d "pdfmerge <output_file> <input_file> ..."
  set input_files $argv[2..-1]
  gs -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -q -sOutputFile=$output_file $input_files
end
