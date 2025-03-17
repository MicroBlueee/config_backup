# jq is a lightweight and flexible command-line JSON processor.
# See: https://stedolan.github.io/jq

complete -c jq -l version -d 'Output jq version'
complete -c jq -l seq -d 'Use application/json-seq MIME type'
complete -c jq -l stream -d 'Parse input in streaming fashion'
complete -c jq -l slurp -s s -d 'Read input to array and filter once'
complete -c jq -l raw-input -s R -d 'Parse input as string (not JSON)'
complete -c jq -l null-input -s n -d 'Ignore input and treat it as null'
complete -c jq -l compact-output -s c -d 'Don\'t pretty-print JSON'
complete -c jq -l tab -d 'Indent w/ tabs instead of spaces'
complete -c jq -l indent -x -d 'Num of spaces per indent'
complete -c jq -l color-output -s C -d 'Color output'
complete -c jq -l monochrome-output -s M -d 'Don\'t color output'
complete -c jq -l ascii-output -s a -d 'Replace UTF-8 chars w/ escape sequences'
complete -c jq -l unbuffered -d 'Flush output after each JSON object'
complete -c jq -l sort-keys -s S -d 'Sort object keys in output'
complete -c jq -l raw-output -s r -d 'Write string output w/out quotes'
complete -c jq -l join-output -s j -d 'Raw output without newlines'
complete -c jq -l from-file -s f -r -d 'Read filter from file'
complete -c jq -s L -d 'Prepend dir to module search list'
complete -c jq -l exit-status -s e -d 'Set exit status from output'
complete -c jq -l arg -x -d 'Set variable'
complete -c jq -l argjson -x -d 'Set JSON-encoded variable'
complete -c jq -l slurpfile -x -d 'Read JSON in file and bind to given variable'
complete -c jq -l argfile -x -d 'Read JSON in file and bind to given variable [see man]'
complete -c jq -l args -d 'Remaining args are positional string args'
complete -c jq -l jsonargs -d 'Remaining args are positional JSON text args'
complete -c jq -l run-tests -d 'Run tests in given file'
