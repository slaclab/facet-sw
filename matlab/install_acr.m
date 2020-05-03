copyfile('run_F2app.sh','ACR','f');
copyfile('F2_solcaldata.mat','ACR','f')
copyfile('F2_LAME_standalone/for_redistribution_files_only/F2_LAME','ACR','f')
% copyfile('F2_LAME_standalone/for_redistribution_files_only/*.png','ACR','f')
!scp -r ACR whitegr@lcls-prod02.slac.stanford.edu:~/