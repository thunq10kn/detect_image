
echo deploy start ...

echo  Build Flutter Web
flutter build web --web-renderer html --dart-define=FLAVOR=stg --dart-define=WEB_RENDERER=html

echo '================================================='
echo push S3 ...

aws s3 cp --recursive build/web s3://web-smoooz-stg

echo 'Clear cache'
aws cloudfront create-invalidation --distribution-id E1XN6H44R40TGH --paths "/*"
echo 'Clear cache success'

echo '================================================='
echo deploy finish ...