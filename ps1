export PS1="\[\e[1;33m\][\t]\[\e[m\] \[\e[0;96m\]\u@\h\[\e[m\]:\[\e[0;94m\]\w\[\e[m\]\n\$(if [[ \$? == 0 ]]; then echo \"\[\e[0;32m\]\"; else echo \"\[\e[0;31m\]\$?|\"; fi)\\$ \[\e[m\]"
#           | Time in yellow        | User@host in cyan       | Full path in blue | Newline | if $? == 0 then {green $} else {red $?|$}
