pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
	            sh 'make deps'
	            sh 'make test_cov || true'
              step([$class: 'XunitBuilder',
                  thresholds: [
                      [$class: 'SkippedThreshold', failureThreshold: '0'],
                      [$class: 'FailedThreshold', failureThreshold: '1']],
                  tools: [[$class: 'JUnitType', pattern: 'test_results.xml']]])
        	}
        }
    }
}
