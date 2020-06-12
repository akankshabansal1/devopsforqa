pipeline
{
agent any
tools
{
  maven 'maven'
}
stages
{
  stage('checkout')
  {
    steps
    {
        checkout scm
     }
  }
  
  
  stage('Build')
  {
    steps
    {
      bat "mvn clean install"
    }
  }
	
  stage('Sonar Analysis')
  {
    steps
    {
      echo "Sonar"
      withSonarQubeEnv("local sonar") 
				{
					bat "mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.2:sonar"
				}
    }
  }
	
    stage ('Uploading to Artifactory')
	{
		steps
		{
		rtMavenDeployer (
                    id: 'deployer',
                    serverId: '123456789@artifactory',
                    releaseRepo: 'devopsforqa',
                    snapshotRepo: 'devopsforqa'
                )
                rtMavenRun (
                    pom: 'pom.xml',
                    goals: 'clean install',
                    deployerId: 'deployer',
                )
                rtPublishBuildInfo (
                    serverId: '123456789@artifactory',
                )
			
		}
	}
}
  
  }
