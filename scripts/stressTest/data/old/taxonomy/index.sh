printf "\033c"
printf "\033[0;94m>>>>>>> Running Taxonomy Affiliate Stress Test\033[0m\n\n"
set -x

# Example: ./stress-test-siege.sh jrogan
WIKIA_USER=${1:-jrogan}

################## AB Commands ##################

# Copy list of urls to each node (run initially then only when you change urls.txt)
pscp -h hosts -l ${WIKIA_USER} -Av urls-tax.txt "/home/${WIKIA_USER}/"
#pssh -h hosts -t 0 -l ${WIKIA_USER} -A -i "siege -c10 -t 5m -f urls-tax.txt"
