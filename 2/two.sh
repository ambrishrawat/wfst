#!/bin/bash


HIFST=/home/wjb31/src/hifst.mlsalt-cpu1.5Nov15/ucam-smt/
export PATH=$PATH:$HIFST/bin/
export PATH=$PATH:$HIFST/externals/openfst-1.5.0/INSTALL_DIR/bin/

TABLEPATH=/home/wjb31/MLSALT/MLSALT8/practicals/practical-2/files

cp ./../1/one_*.fst ./
python two.py


#####two_a

FST=two_a
fstconcat one_c.fst one_b.fst | fstclosure - $FST'.fst'

echo '\n'$FST'\n'>>results.txt
echo '\nBefore\n'>>results.txt
fstinfo $FST'.fst' | head -5 | tail -1 >>results.txt
fstinfo $FST'.fst' | head -6 | tail -1 >>results.txt
fstrmepsilon $FST'.fst' | fstdeterminize - | fstminimize - $FST'.fst' 
fstdraw --isymbols=$TABLEPATH/table1.txt  --osymbols=$TABLEPATH/table1.txt  $FST'.fst' $FST.dot
dot -Tpdf $FST.dot > $FST.pdf
echo '\nAfter\n'>>results.txt
fstinfo $FST'.fst' | head -5 | tail -1 >>results.txt
fstinfo $FST'.fst' | head -6 | tail -1 >>results.txt

#####two_b
fstreverse one_c.fst | fstunion - one_c.fst two_b.fst
FST=two_b
echo '\n'$FST'\n'>>results.txt
echo '\nBefore\n'>>results.txt
fstinfo $FST'.fst' | head -5 | tail -1 >>results.txt
fstinfo $FST'.fst' | head -6 | tail -1 >>results.txt
fstrmepsilon $FST'.fst' | fstdeterminize - | fstminimize - $FST'.fst' 
fstdraw --isymbols=$TABLEPATH/table1.txt  --osymbols=$TABLEPATH/table1.txt  $FST'.fst' $FST.dot
dot -Tpdf $FST.dot > $FST.pdf
echo '\nAfter\n'>>results.txt
fstinfo $FST'.fst' | head -5 | tail -1 >>results.txt
fstinfo $FST'.fst' | head -6 | tail -1 >>results.txt

#####two_c
fstintersect one_c.fst one_d.fst two_c.fst
FST=two_c
echo '\n'$FST'\n'>>results.txt
echo '\nBefore\n'>>results.txt
fstinfo $FST'.fst' | head -5 | tail -1 >>results.txt
fstinfo $FST'.fst' | head -6 | tail -1 >>results.txt
fstrmepsilon $FST'.fst' | fstdeterminize - | fstminimize - $FST'.fst' 
fstdraw --isymbols=$TABLEPATH/table1.txt  --osymbols=$TABLEPATH/table1.txt  $FST'.fst' $FST.dot
dot -Tpdf $FST.dot > $FST.pdf
echo '\nAfter\n'>>results.txt
fstinfo $FST'.fst' | head -5 | tail -1 >>results.txt
fstinfo $FST'.fst' | head -6 | tail -1 >>results.txt

#####two_d
fstdifference one_a.fst one_b.fst | fstclosure - | fstrmepsilon - | fstdeterminize - word_d.fst
fstrmepsilon one_d.fst | fstdeterminize - | fstdifference word_d.fst - | fstunion - one_c.fst two_d.fst
FST=two_d
echo '\n'$FST'\n'>>results.txt
echo '\nBefore\n'>>results.txt
fstinfo $FST'.fst' | head -5 | tail -1 >>results.txt
fstinfo $FST'.fst' | head -6 | tail -1 >>results.txt
fstrmepsilon $FST'.fst' | fstdeterminize - | fstminimize - $FST'.fst' 
fstdraw --isymbols=$TABLEPATH/table1.txt  --osymbols=$TABLEPATH/table1.txt  $FST'.fst' $FST.dot
dot -Tpdf $FST.dot > $FST.pdf
echo '\nAfter\n'>>results.txt
fstinfo $FST'.fst' | head -5 | tail -1 >>results.txt
fstinfo $FST'.fst' | head -6 | tail -1 >>results.txt

fstrmepsilon two_d.fst | fstdeterminize - two_d_rmdeter.fst
fstdraw --isymbols=$TABLEPATH/table1.txt  --osymbols=$TABLEPATH/table1.txt two_d_rmdeter.fst two_d_rmdeter.dot
dot -Tps two_d_rmdeter.dot > two_d_rmdeter.ps

#####two_e
fstrmepsilon one_d.fst | fstdeterminize - | fstdifference word_d.fst - word_no_a.fst 
fstclosure one_a.fst | fstrmepsilon - | fstdeterminize - | fstdifference - one_c.fst not_one_c.fst
fstclosure one_a.fst | fstrmepsilon - | fstdeterminize - | fstdifference - word_no_a.fst not_word_no_a.fst
fstintersect not_one_c.fst not_word_no_a.fst temp.fst
fstclosure one_a.fst | fstrmepsilon - | fstdeterminize - | fstdifference - temp.fst two_e.fst
FST=two_e
echo '\n'$FST'\n'>>results.txt
echo '\nBefore\n'>>results.txt
fstinfo $FST'.fst' | head -5 | tail -1 >>results.txt
fstinfo $FST'.fst' | head -6 | tail -1 >>results.txt
fstrmepsilon $FST'.fst' | fstdeterminize - | fstminimize - $FST'.fst' 
fstdraw --isymbols=$TABLEPATH/table1.txt  --osymbols=$TABLEPATH/table1.txt  $FST'.fst' $FST.dot
dot -Tpdf $FST.dot > $FST.pdf
echo '\nAfter\n'>>results.txt
fstinfo $FST'.fst' | head -5 | tail -1 >>results.txt
fstinfo $FST'.fst' | head -6 | tail -1 >>results.txt





 

 






