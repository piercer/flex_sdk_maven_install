#!/bin/sh
export MAVEN_OPTS=-Xmx1024m

zip flex_sdk_4.5.0.17689_air_2.6.zip empty.swc
mvn org.sonatype.plugins:bundle-publisher-maven-plugin:1.1:install-bundle -Dbundle=flex_sdk_4.5.0.17689_air_2.6.zip -Ddescriptor=flex4.5.0.17689_air_2.6.framework.descriptors.xml
mvn org.sonatype.plugins:bundle-publisher-maven-plugin:1.1:install-bundle -Dbundle=flex_sdk_4.5.0.17689_air_2.6.zip -Ddescriptor=flex4.5.0.17689_air_2.6.compiler.descriptors.xml