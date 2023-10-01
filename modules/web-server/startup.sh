    #!/bin/bash
    # Update and install necessary packages
    apt-get update -y
    apt-get install -y nginx
    systemctl start nginx