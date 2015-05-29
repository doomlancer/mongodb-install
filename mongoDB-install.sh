# Update your repositorys
sudo apt-get update

# Install necessary libraries, etc.
sudo apt-get install git-core git scons build-essential scons libpcre++-dev libboost-dev libboost-program-options-dev libboost-thread-dev libboost-filesystem-dev

# Clone the Git-Repository from MongoPI
git clone git://github.com/RickP/mongopi.git

# Change to MongoPI directory
cd mongopi

# SCons will help you compile the binarys and execute in "readable" code
scons

# Install the compiled binarys
sudo scons --prefix=/opt/mongo install

# Clean temp files etc.
scons -c

# Set a system global PATH
PATH=$PATH:/opt/mongo/bin/
export PATH

# Add new user called "mongodb"
sudo useradd mongodb

# Make directory in /var/lib/ for mongodb
sudo mkdir /var/lib/mongodb

# Change owner for the directory
sudo chown mongodb:mongodb /var/lib/mongodb

# Again, make a new dir.
sudo mkdir /etc/mongodb/

# Get Admin priv. and set a pointer to your ".conf"
sudo sh -c 'echo "dbpath=/var/lib/mongodb" > /etc/mongodb/mongodb.conf'

# Change dir.
cd /etc/init.d

# Get the MongoDB.sh !
sudo wget -O mongodb https://gist.github.com/ni-c/fd4df404bda6e87fb718/raw/36d45897cd943fbd6d071c096eb4b71b37d0fcbb/mongodb.sh

# Change rights for mongodb +x
sudo chmod +x mongodb

# Update your service/runlevel.
sudo update-rc.d mongodb defaults

# Start MongoDB !!!!
sudo service mongodb start

# If everything went good, you should see something like this: "[ ok ] Starting database: mongodb."
# To check if MongoDB is still up, type: "service mongodb status".
#
#
#
# Feel free to contact me if you found mistakes or improvements.
