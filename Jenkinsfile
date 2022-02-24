
pipeline {

    parameters {
        // string(name: 'environment', defaultValue: 'terraform', description: 'Workspace/environment file to use for deployment')
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')

    }


     environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

   agent  any
        options {
                timestamps ()
                ansiColor('xterm')
            }
    stages {
        stage('Plan') {
            steps {
                sh  '"cd Terraform-project && terraform init -input=false"'
                sh '"cd Terraform-project && terraform plan -input=false -out tfplan"'
                sh '"pwd && Terraform-project && show -no-color tfplan > tfplan.txt"'
            }
        }
        stage('Approval') {
           when {
               not {
                   equals expected: true, actual: params.autoApprove
               }
           }

           steps {
               script {
                    def plan = readFile 'Terraform-project/tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
               }
           }
       }

        // stage('Apply') {
        //     steps {
        //         sh '"pwd && cd Terraform-project && terraform apply -input=false tfplan"
        //     }
        // }
    }

  }
