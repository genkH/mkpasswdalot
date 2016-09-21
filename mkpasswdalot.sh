
#!/bin/bash

cmd="mkpasswd"

for OPT in $*
do
    case $OPT in
        '-l' )
            cmd="${cmd} -l $2"
            shift 2
            ;;
        '-d' )
            cmd="${cmd} -d $2"
            shift 2
            ;;
        '-c' )
            cmd="${cmd} -c $2"
            shift 2
            ;;
        '-C' )
            cmd="${cmd} -C $2"
            shift 2
            ;;
        '-s' )
            cmd="${cmd} -s $2"
            shift 2
            ;;
        '-p' )
            cmd="${cmd} -p $2"
            shift 2
            ;;
        '-2' )
            cmd="${cmd} -2"
            shift 1
            ;;
        '-v' )
            cmd="${cmd} -v"
            shift 1
            ;;
        -*)
            echo "illlegal option -- "
            exit 1
            ;;
        *)
            #$1 is non-zero and -で始まらない.
            if [[ ! -z "$1" ]] && [[ ! "$1" =~ ^-+ ]]; then
                param+=( "$1" )
                shift 1
            fi
            ;;
    esac
done

#引数が指定された場合はその数だけ出力.
#引数が指定されていない場合は10個出力.
if [ -z $param ]; then
    len=10
else
    len=$param
fi

cnt=0
while [ $cnt -ne $len ]
do
    cnt=`expr $cnt + 1`
    echo `$cmd`
done
~

