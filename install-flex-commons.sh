#parms:
#sdk_path: local path to unzipped SDK
#sdk_version: SDK version

sdk_path=$1
sdk_version=$2
libs_path=$sdk_path/frameworks/libs/
locales_path=$sdk_path/frameworks/locale

#usage install-flex-framework-artifact artifactId file packaging classifier
function install-flex-framework-artifact
{
	echo "---------------------------------------------------"
	echo "Installing artifact=$1 form file=$2 packaging=$3 classifier=$4"
	echo "---------------------------------------------------"
	mvn install:install-file -DgroupId=com.adobe.flex.framework -DartifactId=$1 -Dversion=$sdk_version -Dfile=$2 -DgeneratePom=true -Dpackaging=$3 -Dclassifier=$4 -DcreateChecksum=true
}

# usage: install-swc-artifact spark spark.swc
function install-swc-artifact 
{
	install-flex-framework-artifact $1 $libs_path/$2 swc
}

# usage install-swc-rb-artifact en_US flex flex
function install-swc-rb-artifact
{
	install-flex-framework-artifact $2 $locales_path/$1/$3_rb.swc rb.swc $1
}
# installs the rb artifact, but without the locale information set as classifier
# I noticed flexmojos requesting this too
function install-swc-rb-artifact2
{
	install-flex-framework-artifact $2 $locales_path/$1/$3_rb.swc rb.swc
}

#usage generate-pom templateFile destFile
function generate-pom
{
	sed_cmd="sed 's/\${SDK_VERSION}/$sdk_version/g' $1 >> $2"

	echo "Executing: $sed_cmd"

	sed 's/\${SDK_VERSION}/'$sdk_version'/g' $1 >> $2
}

echo "---------------------------------"
echo "GENERATING: common-framework pom"
echo "---------------------------------"

pomFile=common-framework.pom
pomTemplate=$pomFile.template

generate-pom $pomTemplate $pomFile


echo "---------------------------------"
echo "INSTALLING : common-framework pom"
echo "---------------------------------"

mvn install:install-file -DgroupId=com.adobe.flex.framework -DartifactId=common-framework -Dversion=$sdk_version -Dfile=$pomFile -DgeneratePom=false -Dpackaging=pom -DcreateChecksum=true

echo "---------------------------------"


echo "---------------------------------"
echo "Creating framework-configs.zip"
echo "---------------------------------"

configs_path=$sdk_path/frameworks

current_dir=$PWD

echo "changing current path to $configs_path"
cd $configs_path

zip_cmd="zip -6 -r $current_dir/framework-configs.zip air-config.xml build.xml flash-unicode-table.xml flex-config.xml localfonts.ser macFonts.ser mx-manifest.xml mxml-2009-manifest.xml mxml-manifest.xml spark-manifest.xml winFonts.ser themes" 
echo "executing zip command: $zip_cmd"

$zip_cmd

cd $current_dir

echo "---------------------------------"
echo "Installing framework configs"
echo "---------------------------------"
mvn install:install-file -DgroupId=com.adobe.flex.framework -DartifactId=framework -Dversion=$sdk_version -Dfile=framework-configs.zip -DgeneratePom=true -Dpackaging=zip -Dclassifier=configs -DcreateChecksum=true

#--------------

install-swc-artifact text-layout textLayout.swc
install-swc-artifact osmf osmf.swc
install-swc-artifact framework framework.swc
install-swc-artifact spark spark.swc
install-swc-artifact sparkskins sparkskins.swc
install-swc-artifact rpc rpc.swc
install-swc-artifact datavisualization datavisualization.swc
install-swc-artifact flash-integration flash-integration.swc
install-swc-artifact flex flex.swc
install-swc-artifact utilities utilities.swc
install-swc-artifact broomstick broomstick.swc
install-swc-artifact flashplayer_inc_playerglobal_022711 flashplayer_inc_playerglobal_022711.swc

install-swc-rb-artifact en_US datavisualization datavisualization
install-swc-rb-artifact en_US flash-integration flash-integration
install-swc-rb-artifact en_US framework framework
install-swc-rb-artifact en_US osmf osmf
install-swc-rb-artifact en_US rpc rpc
install-swc-rb-artifact en_US spark spark
install-swc-rb-artifact en_US text-layout textLayout

install-swc-rb-artifact2 en_US datavisualization datavisualization
install-swc-rb-artifact2 en_US flash-integration flash-integration
install-swc-rb-artifact2 en_US framework framework
install-swc-rb-artifact2 en_US osmf osmf
install-swc-rb-artifact2 en_US rpc rpc
install-swc-rb-artifact2 en_US spark spark
install-swc-rb-artifact2 en_US text-layout textLayout

#automation
install-swc-artifact automation automation/automation.swc
install-swc-artifact automation_agent automation/automation_agent.swc
install-swc-artifact automation_air automation/automation_air.swc
install-swc-artifact automation_airspark automation/automation_airspark.swc
install-swc-artifact automation_dmv automation/automation_dmv.swc
install-swc-artifact automation_flashflexkit automation/automation_flashflexkit.swc
install-swc-artifact automation_spark automation/automation_spark.swc
install-swc-artifact qtp_air automation/qtp_air.swc
install-swc-artifact qtp automation/qtp.swc

#automation locales
install-swc-rb-artifact en_US automation automation
install-swc-rb-artifact en_US automation_agent automation_agent

install-swc-rb-artifact2 en_US automation automation
install-swc-rb-artifact2 en_US automation_agent automation_agent

