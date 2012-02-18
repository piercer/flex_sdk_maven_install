#!/bin/sh
export MAVEN_OPTS=-Xmx1024m
zip flex_sdk_4.6.0.23201B.zip empty.swc
zip flex_sdk_4.6.0.23201B.zip frameworks/libs/player/11.0/playerglobal.swc
zip flex_sdk_4.6.0.23201B.zip frameworks/flex-config.xml

mvn org.sonatype.plugins:bundle-publisher-maven-plugin:1.1:install-bundle -Dbundle=flex_sdk_4.6.0.23201B.zip -Ddescriptor=flex4.6.0.23201B.framework.descriptors.xml
mvn org.sonatype.plugins:bundle-publisher-maven-plugin:1.1:install-bundle -Dbundle=flex_sdk_4.6.0.23201B.zip -Ddescriptor=flex4.6.0.23201B.compiler.descriptors.xml