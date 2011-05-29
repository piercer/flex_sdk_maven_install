#!/bin/sh
export MAVEN_OPTS=-Xmx1024m
zip flex_sdk_4.5.0.20967.zip empty.swc
zip flex_sdk_4.5.0.20967.zip frameworks/libs/player/11.0/playerglobal.swc
zip flex_sdk_4.5.0.20967.zip frameworks/flex-config.xml

mvn org.sonatype.plugins:bundle-publisher-maven-plugin:1.1:install-bundle -Dbundle=flex_sdk_4.5.0.20967.zip -Ddescriptor=flex4.5.0.20967_molehill.framework.descriptors.xml
mvn org.sonatype.plugins:bundle-publisher-maven-plugin:1.1:install-bundle -Dbundle=flex_sdk_4.5.0.20967.zip -Ddescriptor=flex4.5.0.20967_molehill.compiler.descriptors.xml