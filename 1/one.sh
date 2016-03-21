#!/bin/bash


HIFST=/home/wjb31/src/hifst.mlsalt-cpu1.5Nov15/ucam-smt/
export PATH=$PATH:$HIFST/bin/
export PATH=$PATH:$HIFST/externals/openfst-1.5.0/INSTALL_DIR/bin/

TABLEPATH=/home/wjb31/MLSALT/MLSALT8/practicals/practical-2/files

python one.py


#####one_a
fstcompile --isymbols=$TABLEPATH/table1.txt --osymbols=$TABLEPATH/table1.txt one_a.txt one_a.fst
#fstprint --isymbols=isyms.txt --osymbols=osyms.txt eg1.fst
fstdraw --isymbols=$TABLEPATH/table1.txt  --osymbols=$TABLEPATH/table1.txt  one_a.fst one_a.dot
dot -Tps one_a.dot > one_a.ps


#####one_b
fstcompile --isymbols=$TABLEPATH/table1.txt --osymbols=$TABLEPATH/table1.txt one_b.txt one_b.fst
#fstprint --isymbols=isyms.txt --osymbols=osyms.txt eg1.fst
fstdraw --isymbols=$TABLEPATH/table1.txt  --osymbols=$TABLEPATH/table1.txt  one_b.fst one_b.dot
dot -Tps one_b.dot > one_b.ps


#####one_c
fstcompile --isymbols=$TABLEPATH/table1.txt --osymbols=$TABLEPATH/table1.txt one_c.txt one_c.fst
#fstprint --isymbols=isyms.txt --osymbols=osyms.txt eg1.fst
fstdraw --isymbols=$TABLEPATH/table1.txt  --osymbols=$TABLEPATH/table1.txt  one_c.fst one_c.dot
dot -Tps one_c.dot > one_c.ps


#####one_d
fstcompile --isymbols=$TABLEPATH/table1.txt --osymbols=$TABLEPATH/table1.txt one_d.txt one_d.fst
#fstprint --isymbols=isyms.txt --osymbols=osyms.txt eg1.fst
fstdraw --isymbols=$TABLEPATH/table1.txt  --osymbols=$TABLEPATH/table1.txt  one_d.fst one_d.dot
dot -Tps one_d.dot > one_d.ps
