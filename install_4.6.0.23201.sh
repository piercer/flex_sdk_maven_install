#!/bin/sh
export MAVEN_OPTS=-Xmx1024m
zip flex_sdk_4.6.0.23201.zip empty.swc
zip flex_sdk_4.6.0.23201.zip frameworks/libs/player/11.1/playerglobal.swc
zip flex_sdk_4.6.0.23201.zip frameworks/flex-config.xml

mvn org.sonatype.plugins:bundle-publisher-maven-plugin:1.1:install-bundle -Dbundle=flex_sdk_4.6.0.23201.zip -Ddescriptor=flex4.6.0.23201.framework.descriptors.xml
mvn org.sonatype.plugins:bundle-publisher-maven-plugin:1.1:install-bundle -Dbundle=flex_sdk_4.6.0.23201.zip -Ddescriptor=flex4.6.0.23201.compiler.descriptors.xml
