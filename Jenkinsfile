node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        git credentialsId: 'github-credentials', url: 'https://github.com/omshanti0805/acme.git'    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("india2022/sample")
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
           app.push("$BUILD_NUMBER")
        }
    }

/*    stage('Pull image from registry'){

        agent {

            docker {
                image 'india2022/sample:$BUILD_NUMBER'
                args '-p 8888:80'
            }
        }
    }*/ //This is to pull a docker image
        //Try new method 
}