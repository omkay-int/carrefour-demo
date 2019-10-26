#!/bin/sh
/google-cloud-sdk/bin/gcloud auth activate-service-account --key-file /credentials/credentials.json --project "omar-carrefour-interview" -q
$*