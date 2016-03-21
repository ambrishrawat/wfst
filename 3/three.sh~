#!/bin/bash


HIFST=/home/wjb31/src/hifst.mlsalt-cpu1.5Nov15/ucam-smt/
export PATH=$PATH:$HIFST/bin/
export PATH=$PATH:$HIFST/externals/openfst-1.5.0/INSTALL_DIR/bin/

TABLEPATH=/home/wjb31/MLSALT/MLSALT8/practicals/practical-2/files

python three.py


#####building blocks

#####100     - hun.fst
fstcompile --isymbols=$TABLEPATH/table3.txt --osymbols=$TABLEPATH/table3.txt hun.txt hun.fst
fstdraw --isymbols=$TABLEPATH/table3.txt  --osymbols=$TABLEPATH/table3.txt  hun.fst hun.dot
dot -Tps hun.dot > hun.ps

#####1000    - tho.fst
fstcompile --isymbols=$TABLEPATH/table3.txt --osymbols=$TABLEPATH/table3.txt tho.txt tho.fst
fstdraw --isymbols=$TABLEPATH/table3.txt  --osymbols=$TABLEPATH/table3.txt  tho.fst tho.dot
dot -Tps tho.dot > tho.ps

#####zero_eps- zeps.fst
fstcompile --isymbols=$TABLEPATH/table3.txt --osymbols=$TABLEPATH/table3.txt zeps.txt zeps.fst
fstdraw --isymbols=$TABLEPATH/table3.txt  --osymbols=$TABLEPATH/table3.txt  zeps.fst zeps.dot
dot -Tps zeps.dot > zeps.ps

#####zero    - zero.fst
fstcompile --isymbols=$TABLEPATH/table3.txt --osymbols=$TABLEPATH/table3.txt zero.txt zero.fst
fstdraw --isymbols=$TABLEPATH/table3.txt  --osymbols=$TABLEPATH/table3.txt  zero.fst zero.dot
dot -Tps zero.dot > zero.ps

#####digits  - dgt.fst
fstcompile --isymbols=$TABLEPATH/table3.txt --osymbols=$TABLEPATH/table3.txt dgt.txt dgt.fst
fstdraw --isymbols=$TABLEPATH/table3.txt  --osymbols=$TABLEPATH/table3.txt  dgt.fst dgt.dot
dot -Tps dgt.dot > dgt.ps


#####tens    - tens.fst
fstcompile --isymbols=$TABLEPATH/table3.txt --osymbols=$TABLEPATH/table3.txt tens.txt ten1.fst
fstunion dgt.fst zeps.fst | fstconcat ten1.fst - tens.fst
fstdraw --isymbols=$TABLEPATH/table3.txt  --osymbols=$TABLEPATH/table3.txt tens.fst tens.dot
dot -Tps tens.dot > tens.ps


#####2-digits- dgt_teen.fst
fstcompile --isymbols=$TABLEPATH/table3.txt --osymbols=$TABLEPATH/table3.txt dgt_teen.txt dgt_teen.fst
fstdraw --isymbols=$TABLEPATH/table3.txt  --osymbols=$TABLEPATH/table3.txt  dgt_teen.fst dgt_teen.dot
dot -Tps dgt_teen.dot > dgt_teen.ps





######################
#1-digit transducer

#d5
fstunion dgt.fst zero.fst d5.fst

fstdraw --isymbols=$TABLEPATH/table3.txt  --osymbols=$TABLEPATH/table3.txt  d5.fst d5.dot
dot -Tps d5.dot > d5.ps

fstarcsort --sort_type=olabel d5.fst d5.sorted.fst
printstrings.O2 --label-map=$TABLEPATH/table3.txt --input=d5.sorted.fst -n 100000 --output=listd5.txt
printstrings.O2 --label-map=$TABLEPATH/table3.txt --print-output-labels --input=d5.sorted.fst -n 100000 --output=listd5o.txt
./sort --ifile listd5.txt --ifile2 listd5o.txt --ofile listd5m.txt

######################
#2-digit transducer

#d45
fstconcat zeps.fst zero.fst zero2.fst
fstconcat zeps.fst dgt.fst | fstunion tens.fst - | fstunion dgt_teen.fst - | fstunion zero2.fst - d45.fst

fstdraw --isymbols=$TABLEPATH/table3.txt  --osymbols=$TABLEPATH/table3.txt  d45.fst d45.dot
dot -Tps d45.dot > d45.ps

fstrmepsilon d45.fst | fstdeterminize - d45.det.fst
fstdraw --isymbols=$TABLEPATH/table3.txt  --osymbols=$TABLEPATH/table3.txt  d45.det.fst d45.det.dot
dot -Tps d45.det.dot > d45.det.ps

fstarcsort --sort_type=olabel d45.det.fst d45.sorted.fst
printstrings.O2 --label-map=$TABLEPATH/table3.txt --input=d45.sorted.fst -n 100000 --output=listd45.txt
printstrings.O2 --label-map=$TABLEPATH/table3.txt --print-output-labels --input=d45.sorted.fst -n 100000 --output=listd45o.txt
./sort --ifile listd45.txt --ifile2 listd45o.txt --ofile listd45m.txt

######################
#3-digit transducer

#d45_no0
fstconcat zeps.fst zeps.fst zeps2.fst
fstconcat zeps.fst dgt.fst | fstunion tens.fst - | fstunion dgt_teen.fst - | fstunion zeps2.fst - d45no0.fst
##d345
fstconcat zeps.fst d45.fst d3_45.fst
fstconcat dgt.fst hun.fst | fstconcat - d45no0.fst | fstunion d3_45.fst - d345.fst

fstdraw --isymbols=$TABLEPATH/table3.txt  --osymbols=$TABLEPATH/table3.txt  d345.fst d345.dot
dot -Tps d345.dot > d345.ps

fstrmepsilon d345.fst | fstdeterminize - d345.det.fst
fstdraw --isymbols=$TABLEPATH/table3.txt  --osymbols=$TABLEPATH/table3.txt  d345.det.fst d345.det.dot
dot -Tps d345.det.dot > d345.det.ps

fstarcsort --sort_type=olabel d345.det.fst d345.sorted.fst
printstrings.O2 --label-map=$TABLEPATH/table3.txt --input=d345.sorted.fst -n 100000 --output=listd345.txt
printstrings.O2 --label-map=$TABLEPATH/table3.txt --print-output-labels --input=d345.sorted.fst -n 100000 --output=listd345o.txt
./sort --ifile listd345.txt --ifile2 listd345o.txt --ofile listd345m.txt

######################
#4-digit transducer

#d345no0
fstconcat zeps.fst d45no0.fst d3_45no0.fst
fstconcat dgt.fst hun.fst | fstconcat - d45no0.fst | fstunion d3_45no0.fst - d345no0.fst
##d2345
fstconcat zeps.fst d345.fst d2_345.fst
fstconcat dgt.fst tho.fst | fstconcat - d345no0.fst | fstunion d2_345.fst - d2345.fst

fstrmepsilon d2345.fst | fstdeterminize - d2345.det.fst
fstdraw --isymbols=$TABLEPATH/table3.txt  --osymbols=$TABLEPATH/table3.txt  d2345.det.fst d2345.det.dot
dot -Tps d2345.det.dot > d2345.det.ps

fstarcsort --sort_type=olabel d2345.det.fst d2345.sorted.fst
printstrings.O2 --label-map=$TABLEPATH/table3.txt --input=d2345.sorted.fst -n 100000 --output=listd2345.txt
printstrings.O2 --label-map=$TABLEPATH/table3.txt --print-output-labels --input=d2345.sorted.fst -n 100000 --output=listd2345o.txt
./sort --ifile listd2345.txt --ifile2 listd2345o.txt --ofile listd2345m.txt

######################
#5-digit transducer

#d12345
fstconcat zeps2.fst d345.fst d12_345.fst
fstconcat zeps.fst dgt.fst | fstunion tens.fst - | fstunion dgt_teen.fst - | fstconcat - tho.fst | fstconcat - d345no0.fst | fstunion - d12_345.fst d12345.fst
fstdraw --isymbols=$TABLEPATH/table3.txt  --osymbols=$TABLEPATH/table3.txt  d12345.fst d12345.dot
dot -Tps d12345.dot > d12345.ps

fstrmepsilon d12345.fst | fstdeterminize - three.fst
fstdraw --isymbols=$TABLEPATH/table3.txt  --osymbols=$TABLEPATH/table3.txt  three.fst three.dot
dot -Tps three.dot > three.ps

fstarcsort --sort_type=olabel three.fst d12345.sorted.fst
printstrings.O2 --label-map=$TABLEPATH/table3.txt --input=d12345.sorted.fst -n 100000 --output=listd12345.txt
printstrings.O2 --label-map=$TABLEPATH/table3.txt --print-output-labels --input=d12345.sorted.fst -n 100000 --output=listd12345o.txt
./sort --ifile listd12345.txt --ifile2 listd12345o.txt --ofile listd12345m.txt
 

 






