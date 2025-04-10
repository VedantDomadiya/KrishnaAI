@Library("Shared") _
//here i have used a Shared libary from my github "https://github.com/VedantDomadiya/jenkins-shared-libraries.git"
pipeline {
    agent { label "chintu" }
  
    stages {
        stage("Code") {
            steps {
                script{
                clone("https://github.com/VedantDomadiya/KrishnaAI.git","main")
                }
            }
        }

        stage("Build") {
            steps {
                sh "whoami"
                echo "This is building the code"
                sh "docker-compose build"
            }
        }

        stage("Push to DockerHub") {
            steps {
                script {
                    docker_push("krishna-ai", "latest", "vedantdomadiya")
                }
            }
        }

        stage("Deploy") {
            steps {
                echo "This is Deploying the code"
                sh "docker-compose up -d"
            }
        }
    }
}











/*
pipeline {
    agent { label "chintu" }

    stages {
        stage("Code") {
            steps {
                echo "This is Cloning the code"
                git url: "https://github.com/VedantDomadiya/KrishnaAI.git", branch: "main"
                echo "Cloning successful"
            }
        }

        stage("Build") {
            steps {
                sh "whoami"
                echo "This is building the code"
                sh "docker-compose build"
            }
        }

        stage("Push to DockerHub") {
            steps {
                script {
                    withCredentials([usernamePassword(
                        credentialsId: 'DockerHubCred', 
                        passwordVariable: 'DockerHubPass', 
                        usernameVariable: 'DockerHubUser'
                    )]) {
                        echo "Logging into Docker Hub"
                        sh "echo ${DockerHubPass} | docker login -u ${DockerHubUser} --password-stdin"

                        echo "Tagging the Docker image"
                        sh "docker tag krishnaaicicd_krishna-ai:latest ${DockerHubUser}/krishna-ai:latest"

                        echo "Pushing the Docker image to Docker Hub"
                        sh "docker push ${DockerHubUser}/krishna-ai:latest"
                    }
                }
            }
        }

        stage("Deploy") {
            steps {
                echo "This is Deploying the code"
                sh "docker-compose up -d"
            }
        }
    }
}
*/
