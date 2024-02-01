pipeline{
   agent any
   tools{
       terraform 'terraform-11'
   }
   stages{
     stage("Initializing terraform"){
       steps{
          sh 'terraform init'
       }
     }
     stage("Terraform Plan"){
       steps{
          sh 'terraform plan'
       }
     }
     stage("Terraform apply"){
       steps{
         sh 'terraform apply'
       }
     }
   }


}