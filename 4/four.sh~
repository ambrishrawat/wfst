#!/bin/bash


HIFST=/home/wjb31/src/hifst.mlsalt-cpu1.5Nov15/ucam-smt/
export PATH=$PATH:$HIFST/bin/
export PATH=$PATH:$HIFST/externals/openfst-1.5.0/INSTALL_DIR/bin/

TABLEPATH=/home/wjb31/MLSALT/MLSALT8/practicals/practical-2/files
DIR=/home/wjb31/MLSALT/MLSALT8/practicals/practical-2/files
python four.py


#####four_a rot13 cipher
fstcompile --isymbols=$TABLEPATH/table4.txt --osymbols=$TABLEPATH/table4.txt rot13.txt rot13.fst
fstdraw --isymbols=$TABLEPATH/table4.txt  --osymbols=$TABLEPATH/table4.txt  rot13.fst rot13.dot
dot -Tps rot13.dot > rot13.ps


#####four_b rot13 cipher
echo 'my secret message' > msg.txt
./msg2map < msg.txt 
fstcompile --isymbols=$TABLEPATH/table4.txt --osymbols=$TABLEPATH/table4.txt msgmap.txt msg.fst
fstdraw --isymbols=$TABLEPATH/table4.txt  --osymbols=$TABLEPATH/table4.txt  msg.fst msg.dot
dot -Tps msg.dot > msg.ps

fstarcsort --sort_type=ilabel rot13.fst | fstcompose msg.fst - | fstproject --project_output - enc_msg.fst
fstdraw --isymbols=$TABLEPATH/table4.txt  --osymbols=$TABLEPATH/table4.txt  enc_msg.fst enc_msg.dot
dot -Tps enc_msg.dot > enc_msg.ps
printstrings.O2 --label-map=$TABLEPATH/table4.txt --print-output-labels --input=enc_msg.fst --output=enc_msg.txt
cat enc_msg.txt | ./correct_space --ofile enc_msg.txt

fstinvert rot13.fst | fstarcsort --sort_type=ilabel - | fstcompose enc_msg.fst - | fstproject --project_output - dec_msg.fst
fstdraw --isymbols=$TABLEPATH/table4.txt  --osymbols=$TABLEPATH/table4.txt  dec_msg.fst dec_msg.dot
dot -Tps dec_msg.dot > dec_msg.ps
printstrings.O2 --label-map=$TABLEPATH/table4.txt --print-output-labels --input=dec_msg.fst --output=dec_msg.txt
cat dec_msg.txt | ./correct_space --ofile dec_msg.txt

#####four_c 

fstcompile --isymbols=$TABLEPATH/table4.txt --osymbols=$TABLEPATH/table4.txt rot16.txt rot16.fst
fstdraw --isymbols=$TABLEPATH/table4.txt  --osymbols=$TABLEPATH/table4.txt  rot16.fst rot16.dot
dot -Tps rot16.dot > rot16.ps


fstunion rot13.fst rot16.fst | fstclosure - | fstcompose $DIR/4.encoded1.fst - four_c.fst
fstinfo four_c.fst

fstproject --project_output four_c.fst four_c_proj.fst
printstrings.O2 --label-map=$TABLEPATH/table4.txt --print-output-labels -n 100 --input=four_c_proj.fst --output=four_c.txt
fstrmepsilon four_c_proj.fst | fstdeterminize - | fstminimize - four_c.fst 
fstinfo four_c.fst 
cat four_c.txt | ./correct_space --ofile four_c.txt
#####four_d
fstcompose four_c.fst $DIR/4.lm.fst four_d.fst
printstrings.O2 --label-map=$TABLEPATH/table4.txt --print-output-labels --input=four_d.fst --output=four_d.txt
cat four_d.txt | ./correct_space --ofile four_d.txt


#####four_e
fstcompile --isymbols=$TABLEPATH/table4.txt --osymbols=$TABLEPATH/table4.txt swap.txt swap.fst
fstdraw --isymbols=$TABLEPATH/table4.txt  --osymbols=$TABLEPATH/table4.txt  swap.fst swap.dot
dot -Tps swap.dot > swap.ps


fstarcsort --sort_type=ilabel rot13.fst | fstcompose $DIR/4.encoded2.fst - | fstcompose - swap.fst | fstproject --project_output - four_e.fst
fstrmepsilon four_e.fst | fstdeterminize - | fstminimize - four_e.fst  
#printstrings.O2 --label-map=$TABLEPATH/table4.txt --print-output-labels --input=four_e.fst --output=four_e_i.txt
fstcompose four_e.fst $DIR/4.lm.fst four_e.fst
printstrings.O2 --label-map=$TABLEPATH/table4.txt --print-output-labels --input=four_e.fst --output=four_e.txt
cat four_e.txt | ./correct_space --ofile four_e2.txt


