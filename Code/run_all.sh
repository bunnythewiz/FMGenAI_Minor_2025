#!/bin/bash

# This script installs the required dependencies and runs the four Python
# scripts in the specified order: A3, A4, B1, B2.

# Exit immediately if a command exits with a non-zero status.
set -e

echo "✅ Starting the execution process..."

# 1. Install dependencies from requirements.txt
echo "----------------------------------------"
echo "STEP 1: Installing Python packages..."
echo "----------------------------------------"
pip install -r requirements.txt
echo "✅ Dependencies installed successfully."
echo

# 2. Run fm&gai_minor_a_3.py
echo "----------------------------------------"
echo "STEP 2: Running fm&gai_minor_a_3.py"
echo "----------------------------------------"
# This script has a special requirement to be run inside the 'EvoGen' repository.
# The shell script handles the cloning and directory navigation.
# NOTE: Ensure you have commented out the '!pip', '!git clone', and '%cd' lines in the Python file.

if [ ! -d "EvoGen" ]; then
    echo "Cloning EvoGen repository from GitHub..."
    git clone https://github.com/evansh666/EvoGen.git
else
    echo "EvoGen directory already exists. Skipping clone."
fi

# Use a subshell to change directory, run the script, and return to the original directory.
# This ensures files are created inside 'EvoGen' as intended by the script.
(cd EvoGen && python3 ../fm&gai_minor_a_3.py)
echo "✅ Script fm&gai_minor_a_3.py finished."
echo

# 3. Run fm&gai_minor_a_4.py
echo "----------------------------------------"
echo "STEP 3: Running fm&gai_minor_a_4.py"
echo "----------------------------------------"
python3 fm&gai_minor_a_4.py
echo "✅ Script fm&gai_minor_a_4.py finished."
echo

# 4. Run fm&gai_b_1.py
echo "----------------------------------------"
echo "STEP 4: Running fm&gai_b_1.py"
echo "----------------------------------------"
python3 fm&gai_b_1.py
echo "✅ Script fm&gai_b_1.py finished."
echo

# 5. Run fm&gai_b_2.py
echo "----------------------------------------"
echo "STEP 5: Running fm&gai_b_2.py"
echo "----------------------------------------"
python3 fm&gai_b_2.py
echo "✅ Script fm&gai_b_2.py finished."
echo

echo "🎉 All scripts executed successfully!"