outfilename="find-large-files-$(date +%Y%m%d%s).txt"
echo "Saving to $outfilename"
touch $outfilename
sudo find / -type f -size +200000k -exec ls -lh {} \; | awk '{ print $9 ": " $5 }' >> $outfilename

