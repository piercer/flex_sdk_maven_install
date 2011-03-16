#!/bin/sh
export MAVEN_OPTS=-Xmx1024m
zip flex_sdk_4.5.0.19786.zip empty.swc
zip flex_sdk_4.5.0.19786.zip frameworks/libs/flashplayer_inc_playerglobal_022711.swc
zip flex_sdk_4.5.0.19786.zip frameworks/libs/flex.swc
zip flex_sdk_4.5.0.19786.zip frameworks/libs/utilities.swc
zip flex_sdk_4.5.0.19786.zip frameworks/libs/datavisualization.swc
zip flex_sdk_4.5.0.19786.zip frameworks/locale/en_US/datavisualization_rb.swc
zip flex_sdk_4.5.0.19786.zip frameworks/flex-config.xml

mvn org.sonatype.plugins:bundle-publisher-maven-plugin:1.1:deploy-bundle -Dbundle=flex_sdk_4.5.0.19786.zip -Ddescriptor=flex4.5.0.19786_molehill_flex.framework.descriptors.xml -Durl=http://www.flashnexus.org/nexus/content/repositories/snapshots -DrepositoryId=flashnexus
mvn org.sonatype.plugins:bundle-publisher-maven-plugin:1.1:deploy-bundle -Dbundle=flex_sdk_4.5.0.19786.zip -Ddescriptor=flex4.5.0.19786_molehill.compiler.descriptors.xml -Durl=http://www.flashnexus.org/nexus/content/repositories/snapshots -DrepositoryId=flashnexus