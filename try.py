import librosa
import pandas as pd 
import numpy as np
from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
import joblib
import matplotlib.pyplot as plt

# Read audio file
y, sr = librosa.load("Baazigar_PagalWorldl_.wav")

# Extract features
spectral_centroid = librosa.feature.spectral_centroid(y=y,sr=sr)
zero_crossing_rate= librosa.feature.zero_crossing_rate(y)
mfccs = librosa.feature.mfcc(y=y,sr=sr)

# Concatenate features
features = np.concatenate((spectral_centroid, zero_crossing_rate, mfccs))

# Load training data
df = pd.read_csv('training_data.csv')

X = df.drop(columns=['class_label']).values
y = df['class_label'].values

# Split the dataset into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Train a decision tree classifier on the training set
model = DecisionTreeClassifier()
model.fit(X_train, y_train)

# Save the model
joblib.dump(model, 'model.pkl')

# Load the saved model
model = joblib.load('model.pkl')

# Predict the class label of the audio file
class_label = model.predict(features.reshape(1, -1))[0]

# Write the result to a CSV file
data = {'audio_file': "Baazigar_PagalWorldl_.wav", 'class_label': class_label}
df = pd.DataFrame(data=data, columns=['audio_file', 'class_label']) 
df.to_csv('classification_results.csv', index=False)

# Plot the audio waveform
fig, ax = plt.subplots()
t = np.arange(0, len(y)) /sr
ax.plot(t, y)
ax.set(xlabel='Time (s)', ylabel='Amplitude', title='Audio Waveform')
plt.show()

# Evaluate the accuracy of the model
y_pred = model.predict(X_test)
accuracy = accuracy_score(y_test, y_pred)
print("Accuracy:", accuracy)



''' In this example, we first load the audio file and extract the features using librosa. We then load the training data from a CSV file, split it into training and testing sets, and train a decision tree classifier on the training set. We save the trained model to a file using joblib. We then load the saved model and use it to predict the class label of the audio file. We write the result to a CSV file and plot the audio waveform. Finally, we evaluate the accuracy of the model on the testing set. '''
#hello
