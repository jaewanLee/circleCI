# use curl to download a keystore from $KEYSTORE_URI, if set,
# to the path/filename set in $KEYSTORE.
if [[ $KEYSTORE && ${KEYSTORE} && $KEYSTORE_URI && ${KEYSTORE_URI} ]]
then
    echo "Keystore detected - downloading..."
    echo "$KEYSTORE"
    echo "${KEYSTORE}"
    echo "$KEYSTORE_URI"
    echo "${KEYSTORE_URI}"
    # we're using curl instead of wget because it will not
    # expose the sensitive uri in the build logs:
    curl -L -o ${KEYSTORE} ${KEYSTORE_URI}
    ls $KEYSTORE
    ls ${HOME}/${CIRCLE_PROJECT_REPONAME}/test_key
else
    echo "Keystore uri not set.  .APK artifact will not be signed."
fi
