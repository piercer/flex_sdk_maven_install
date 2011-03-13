#/bin/sh

#mvn org.sonatype.plugins:bundle-publisher-maven-plugin:1.0:install-bundle -Dbundle=flex_sdk_4.1.0.16076.zip -Ddescriptor=flex4.1.0.16076.descriptors.xml

#zip flex_sdk_4.1.0.16076.zip empty.swc
mvn org.sonatype.plugins:bundle-publisher-maven-plugin:1.1:install-bundle -Dbundle=flex_sdk_4.1.0.16076.zip -Ddescriptor=flex4.1.0.16076.framework.descriptors.xml
mvn org.sonatype.plugins:bundle-publisher-maven-plugin:1.1:install-bundle -Dbundle=flex_sdk_4.1.0.16076.zip -Ddescriptor=flex4.1.0.16076.compiler.descriptors.xml