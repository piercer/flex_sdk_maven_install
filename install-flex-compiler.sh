#parms:
#sdk_path: local path to unzipped SDK
#sdk_version: SDK version

sdk_path=$1
sdk_version=$2
libs_path=$sdk_path/lib


#usage install-flex-compiler-artifact artifactId file packaging
function install-flex-compiler-artifact
{
	echo "---------------------------------------------------"
	echo "Installing artifact=$1 form file=$2 packaging=$3"
	echo "---------------------------------------------------"
	mvn install:install-file -DgroupId=com.adobe.flex.compiler -DartifactId=$1 -Dversion=$sdk_version -Dfile=$2 -DgeneratePom=true -Dpackaging=$3 -DcreateChecksum=true
}

#usage install-compiler-artifact artifactId fileName
function install-compiler-artifact
{
	install-flex-compiler-artifact $1 $libs_path/$2 jar
}

#usage generate-pom templateFile destFile
function generate-pom
{
	sed_cmd="sed 's/\${SDK_VERSION}/$sdk_version/g' $1 >> $2"

	echo "Executing: $sed_cmd"

	sed 's/\${SDK_VERSION}/'$sdk_version'/g' $1 >> $2
}

#1. generate compiler.pom
echo "---------------------------------"
echo "GENERATING: compiler pom"
echo "---------------------------------"

pomFile=compiler.pom
pomTemplate=$pomFile.template

generate-pom $pomTemplate $pomFile


#2. install compiler.pom
echo "---------------------------------"
echo "INSTALLING: compiler pom"
echo "---------------------------------"

mvn install:install-file -DgroupId=com.adobe.flex -DartifactId=compiler -Dversion=$sdk_version -Dfile=$pomFile -DgeneratePom=false -Dpackaging=pom -DcreateChecksum=true

#3. install artifacts

install-compiler-artifact adt adt.jar
install-compiler-artifact afe afe.jar
install-compiler-artifact aglj40 aglj40.jar
install-compiler-artifact asc asc.jar
install-compiler-artifact asdoc asdoc.jar
install-compiler-artifact batik-all-flex batik-all-flex.jar
install-compiler-artifact commons-collections commons-collections.jar
install-compiler-artifact commons-discovery commons-discovery.jar
install-compiler-artifact commons-logging commons-logging.jar
install-compiler-artifact compc compc.jar
install-compiler-artifact copylocale copylocale.jar
install-compiler-artifact digest digest.jar
install-compiler-artifact fcsh fcsh.jar
install-compiler-artifact fdb fdb.jar
install-compiler-artifact flex-compiler-oem flex-compiler-oem.jar
install-compiler-artifact flex-fontkit flex-fontkit.jar
install-compiler-artifact flex-messaging-common flex-messaging-common.jar
install-compiler-artifact fxgutils fxgutils.jar 
install-compiler-artifact license license.jar
install-compiler-artifact mxmlc mxmlc.jar
install-compiler-artifact optimizer optimizer.jar
install-compiler-artifact rideau rideau.jar
install-compiler-artifact saxon9 saxon9.jar
install-compiler-artifact swcdepends swcdepends.jar
install-compiler-artifact swfdump swfdump.jar
install-compiler-artifact swfutils swfutils.jar
install-compiler-artifact velocity-dep-1.4-flex velocity-dep-1.4-flex.jar
install-compiler-artifact xalan xalan.jar
install-compiler-artifact xercesImpl xercesImpl.jar
install-compiler-artifact xercesPatch xercesPatch.jar
install-compiler-artifact xmlParserAPIs xmlParserAPIs.jar

