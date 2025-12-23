pipeline {
    agent any
    
    // Schedule: Run daily at 10 PM (22:00)
    // Cron format: minute hour day-of-month month day-of-week
    triggers {
        cron('0 22 * * *')
    }
    
    tools {
        maven 'Maven3' // Make sure this matches your Jenkins Maven configuration
        jdk 'JDK17'    // Make sure this matches your Jenkins JDK configuration
    }
    
    parameters {
        choice(name: 'TEST_SUITE', choices: ['smoke', 'regression', 'all'], description: 'Select test suite to run')
        string(name: 'BROWSER', defaultValue: 'chrome', description: 'Browser to run tests on')
    }
    
    environment {
        // Add any environment variables here
        MAVEN_OPTS = '-Xmx1024m'
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code from repository...'
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                echo 'Cleaning and compiling the project...'
                sh 'mvn clean compile'
            }
        }
        
        stage('Run Smoke Tests') {
            when {
                expression { params.TEST_SUITE == 'smoke' || params.TEST_SUITE == 'all' }
            }
            steps {
                echo 'Running Smoke Tests...'
                sh 'mvn test -Dcucumber.filter.tags="@smoke" -Dbrowser=chrome-headless'
            }
        }
        
        stage('Run Regression Tests') {
            when {
                expression { params.TEST_SUITE == 'regression' || params.TEST_SUITE == 'all' }
            }
            steps {
                echo 'Running Regression Tests...'
                sh 'mvn test -Dcucumber.filter.tags="@regression" -Dbrowser=chrome-headless'
            }
        }
        
        stage('Run All Tests') {
            when {
                expression { params.TEST_SUITE == 'all' }
            }
            steps {
                echo 'Running All Tests...'
                sh 'mvn test -Dbrowser=chrome-headless'
            }
        }
    }
    
    post {
        always {
            echo 'Publishing test reports...'
            
            // Publish HTML reports
            publishHTML([
                allowMissing: true,
                alwaysLinkToLastBuild: true,
                keepAll: true,
                reportDir: 'target',
                reportFiles: 'cucumber-reports.html',
                reportName: 'CRM Automation Test Report',
                reportTitles: 'Cucumber Test Report'
            ])
            
            // Publish JUnit test results
            junit allowEmptyResults: true, testResults: '**/target/surefire-reports/*.xml'
            
            // Archive artifacts
            archiveArtifacts artifacts: '**/target/cucumber-reports.html, **/target/cucumber.json', 
                            allowEmptyArchive: true
            
            // Clean workspace
            cleanWs()
        }
        
        success {
            echo 'Tests passed successfully!'
            // Add email notification or Slack notification here
            // emailext subject: "SUCCESS: CRM Tests - ${env.JOB_NAME} #${env.BUILD_NUMBER}",
            //          body: "All tests passed successfully.",
            //          to: "your-email@example.com"
        }
        
        failure {
            echo 'Tests failed!'
            // Add email notification or Slack notification here
            // emailext subject: "FAILURE: CRM Tests - ${env.JOB_NAME} #${env.BUILD_NUMBER}",
            //          body: "Tests failed. Check Jenkins for details.",
            //          to: "your-email@example.com"
        }
    }
}
