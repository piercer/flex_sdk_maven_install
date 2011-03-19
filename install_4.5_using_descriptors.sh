#!/bin/sh
zip flex_sdk_4.5.0.19786.zip empty.swc
mvn org.sonatype.plugins:bundle-publisher-maven-plugin:1.1:install-bundle -Dbundle=flex_sdk_4.5.0.19786.zip -Ddescriptor=flex4.5.0.19786.framework.descriptors.xml
mvn org.sonatype.plugins:bundle-publisher-maven-plugin:1.1:install-bundle -Dbundle=flex_sdk_4.5.0.19786.zip -Ddescriptor=flex4.5.0.19786.compiler.descriptors.xml