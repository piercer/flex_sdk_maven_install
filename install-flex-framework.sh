#parms:
#sdk_path: local path to unzipped SDK
#sdk_version: SDK version

sdk_path=$1
sdk_version=$2
libs_path=$sdk_path/frameworks/libs/
locales_path=$sdk_path/frameworks/locale


# usage: install-player-swc-artifact spark spark.swc classifier
function install-player-swc-artifact 
{
	echo "Installing $1 from file: $2, classifier: $3"
	mvn install:install-file -DgroupId=com.adobe.flex.framework -DartifactId=$1 -Dversion=$sdk_version -Dfile=$libs_path/player/$3/$2 -DgeneratePom=true -Dpackaging=swc -Dclassifier=$4 -DcreateChecksum=true
}

# usage install-swc-rb-artifact en_US flex flex
function install-swc-rb-artifact
{
	echo "Installing rb $1 for artifact $2, filename $3"
	mvn install:install-file -DgroupId=com.adobe.flex.framework -DartifactId=$2 -Dversion=$sdk_version -Dclassifier=$1 -Dfile=$locales_path/$1/$3_rb.swc -DgeneratePom=true -Dpackaging=rb.swc -DcreateChecksum=true
}

#usage generate-pom templateFile destFile
function generate-pom
{
	sed_cmd="sed 's/\${SDK_VERSION}/$sdk_version/g' $1 >> $2"

	echo "Executing: $sed_cmd"

	sed 's/\${SDK_VERSION}/'$sdk_version'/g' $1 >> $2
}


echo "Installing flex commons first"
$PWD/install-flex-commons.sh $sdk_path $sdk_version

echo "Installing flex-framework"

echo "---------------------------------"
echo "GENERATING: flex-framework pom"
echo "---------------------------------"

pomFile=flex-framework.pom
pomTemplate=$pomFile.template

generate-pom $pomTemplate $pomFile

echo "---------------------------------"
echo "INSTALLING : flex-framework pom"
echo "---------------------------------"

mvn install:install-file -DgroupId=com.adobe.flex.framework -DartifactId=flex-framework -Dversion=$sdk_version -Dfile=$pomFile -DgeneratePom=false -Dpackaging=pom -DcreateChecksum=true

echo "---------------------------------"


install-player-swc-artifact playerglobal playerglobal.swc 10.1 10.1

echo "installing default playerblobal as 10.1"
mvn install:install-file -DgroupId=com.adobe.flex.framework -DartifactId=playerglobal -Dversion=$sdk_version -Dfile=$libs_path/player/10.1/playerglobal.swc -DgeneratePom=true -Dpackaging=swc -Dclassifier=10.1 -DcreateChecksum=true

install-swc-rb-artifact en_US playerglobal playerglobal


