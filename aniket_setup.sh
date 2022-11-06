apt-get install virtualenv -y
virtualenv .
source bin/activate
pip install joblib
pip install -r requirements.txt
pip uninstall torch torchvision torchaudio
pip install torch torchvision torchaudio
