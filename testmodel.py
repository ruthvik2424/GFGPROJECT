import librosa
import numpy as np
from keras.models import Sequential, model_from_json

# define the function to extract features from an audio file
def extract_features(audio_path):
    signal, sr = librosa.load(audio_path, sr=44100)
    mfcc_features = librosa.feature.mfcc(y=signal, sr=sr, n_mfcc=20)
    features = np.mean(mfcc_features, axis=1) # calculate the mean of each MFCC coefficient
    return features

# load the model architecture from a file
json_file = open('stutter_detection_model.json', 'r')
loaded_model_json = json_file.read()
json_file.close()

# create the model from the loaded architecture
loaded_model = model_from_json(loaded_model_json)

# load the saved model weights into the model
loaded_model.load_weights("stutter_detection_model.h5")

# extract features from the audio file to be predicted
audio_file = 'stutter1.mp3'
features = extract_features(audio_file)

# predict the class probability of the audio file
probabilities = loaded_model.predict(np.array([features]))
predicted_class = round(probabilities[0][0])

# print the predicted class and probability
if predicted_class == 0:
    print("The audio file is normal with probability:", 1 - probabilities[0][0])
else:
    print("The audio file contains stuttering with probability:", probabilities[0][0])

# calculate the accuracy of the prediction
test_X = np.array([features])
test_y = np.array([1])  # provide the true label of the audio file
loss, accuracy = loaded_model.evaluate(test_X, test_y)
print("Accuracy:", accuracy)
