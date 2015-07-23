#CLI deploy for AWS ElasticBeanstalk
#rodrigofernandes@outlook.com
$date=(Get-Date -format "yyyyMMd-HHmmss")
$region = type_your_region # example: us-east-1
$accesskey = type_your_access_key # example: AKIAXXXXXXXXXXXX
$secretkey = type_your_secret_key 
$appname = type_your_application_name
$envname = type_your_environment_name
$versionlabel = 'Deploy-'+$date
$s3bucket = type_your_bucket_name # example: bucket.deploy.corp
$s3key = type_your_s3_key # example: iis-application.zip

Initialize-AWSDefaults -Region $region
Set-AWSCredentials -AccessKey $accesskey -SecretKey $secretkey
New-EBApplicationVersion -ApplicationName $appname -VersionLabel $versionlabel -Description "'Deploy number' + $date" -SourceBundle_S3Bucket $s3bucket -SourceBundle_S3Key $s3key
Update-EBEnvironment -EnvironmentName $envname -VersionLabel $versionlabel