pipeline {
    agent any
    parameters {
        string(name: 'TAG', defaultValue: 'v1', description: 'Tag del proceso de CI/CD')
    }
    stages {
        stage('CI: Build node project') {
            steps {
                echo 'ng build'
            }
        }
        stage('CI: Test node project') {
            steps {
                echo 'ng test'
            }
        }
        stage('CI: Subir al repositorio git') {
            steps {
                echo 'git push -u origin master'
            }
        }
        stage('CD: Crear la imagen docker') {
            steps {
                echo 'docker build -t ariane10/angularapp:${params.TAG}'
            }
            
        }
        stage('CD: Subir a repositorio privado') {
            steps {
                echo 'docker push ariane10/angularapp:${params.TAG}'
            }
            
        }
        stage('CD: Desplegar la aplicación') {
            steps {
                echo 'kubectl apply -f deployment.yaml'
            }
        }
        stage('CD: Exponer el deployment') {
            steps {
                echo 'kubectl apply -f service.yaml'
            }
        }
    }
}