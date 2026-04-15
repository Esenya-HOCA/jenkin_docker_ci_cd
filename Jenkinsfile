pipeline {
    agent any

    stages {
        stage('Derleme (Build)') {
            steps {
                // Maven ile JAR paketleme (Testleri atlamak istersen -DskipTests ekleyebilirsin)
                sh './mvnw clean package'
            }
        }
        
        stage('Docker Imaj Olusturma') {
            steps {
                script {
                    sh "docker build -t ogrenci-sistemi:latest ."
                }
            }
        }

        stage('Yayına Alma (Deploy)') {
            steps {
                script {
                    // Eğer varsa eski konteyneri temizle
                    sh "docker stop obs-container || true"
                    sh "docker rm obs-container || true"
                    // Yeni konteyneri başlat
                    sh "docker run -d --name obs-container -p 8081:8080 ogrenci-sistemi:latest"
                }
            }
        }
    }
}