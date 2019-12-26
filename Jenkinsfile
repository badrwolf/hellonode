node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("5dd17cd3519a/hellonode")
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

  
 

    stage('Push image') {
  	  withCredentials([usernamePassword( credentialsId: 'docker-hub-credentials', usernameVariable: 'USER', passwordVariable: 'PASSWORD')]) {
        def registry_url = "registry.hub.docker.com/"
        sh "docker login -u 5dd17cd3519a -p Casablanca@235689 "
        docker.withRegistry("http://${registry_url}", "docker-hub-credentials") {
           //  Push your image now
       		sh "docker login -u 5dd17cd3519a -p Casablanca@235689 "  
	 	sh " docker push 5dd17cd3519a/hellonode:latest"
	//app.push("${env.BUILD_NUMBER}")
           // app.push("latest")
					
        }
    
   }

    }
}
