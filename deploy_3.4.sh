mvn org.sonatype.plugins:bundle-publisher-maven-plugin:1.1:deploy-bundle -Dbundle=flex_sdk_3.4.0.14408.zip -Ddescriptor=flex3.4.0.14408.framework.descriptors.xml -Durl=remoteRepo -DrepositoryId=nexus
mvn org.sonatype.plugins:bundle-publisher-maven-plugin:1.1:deploy-bundle -Dbundle=flex_sdk_3.4.0.14408.zip -Ddescriptor=flex3.4.0.14408.compiler.descriptors.xml -Durl=remoteRepo -DrepositoryId=nexus
