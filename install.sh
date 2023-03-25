#!/bin/bash

# Prompt user for directory name and installation directory
# read -p "Enter the name of the directory to install: " DIR_NAME
# read -p "Enter the installation directory (default is /usr/local): " INSTALL_DIR
DIR_NAME="src"
INSTALL_DIR

# Set default installation directory if none was provided
if [ -z "$INSTALL_DIR" ]; then
  INSTALL_DIR="/usr/local/humSoft"
fi

# Move the directory to the install directory
sudo mv "$DIR_NAME" "$INSTALL_DIR"

# Rename the directory to "hum"
# sudo mv "$INSTALL_DIR/$DIR_NAME" "$INSTALL_DIR"
sudo cp "$INSTALL_DIR/$DIR_NAME" "$INSTALL_DIR"

# Set executable permissions on the script
sudo chmod +x "$INSTALL_DIR/hum.sh"

# Add an alias for the script in the user's bashrc file
echo "alias hum='$INSTALL_DIR/hum.sh'" >> ~/.bashrc

# Reload the bashrc file
source ~/.bashrc

# Confirm installation
echo "Installation complete. Run 'hum -v ' to check."



# #!/bin/bash

# # Define variables
# INSTALL_DIR="/usr/local"
# DIR_NAME="humSoft"

# # Move the directory to the install directory
# sudo mv "$DIR_NAME" "$INSTALL_DIR"

# # Set executable permissions on the script
# sudo chmod +x "$INSTALL_DIR/$DIR_NAME/hum.sh"

# # Add an alias for the script in the user's bashrc file
# echo "alias hum='$INSTALL_DIR/$DIR_NAME/hum.sh'" >> ~/.bashrc

# # Reload the bashrc file
# source ~/.bashrc

# # Confirm installation
# echo "Installation complete. Run 'hum' to use the software."
