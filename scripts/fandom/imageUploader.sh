# Create a subdirectory called images
cd images

for FILE in *;
do echo -e "$FILE";
    curl -X POST --header 'Content-Type: multipart/form-data' \
         --header 'Accept: application/json' \
          --header 'X-Wikia-AccessToken: NzhmMTdhM2ItNTA2Yi00YjMxLWIzNGItN2EwNTFiNjI3NTE0' \
           -F "file=@$FILE" \
            'http://prod.sjc.k8s.wikia.net/static-assets/image';
     echo -e "\n\n\n\n"
 done

