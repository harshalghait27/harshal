pipeline    {
   
             agent {

                    label {

                                label "slave3"                  
                                customWorkspace "/mnt/slave-1"
                    }

            }

            stages {

                stage ("one") {

                       steps {                   
                                       
                           sh "sudo yum install httpd -y"

                       }
                }
                
                stage ("two") {

                       steps {                   
                                       
                           sh "sudo service httpd start"
                           sh "sudo cp -R index.html /var/www/html"
                           sh "sudo chmod -R 777 /var/www/html/"

                       }
                }

           }
}
