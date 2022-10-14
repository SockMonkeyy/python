from cv2 import resize
from flask import Flask, render_template, redirect, request, send_from_directory
from werkzeug.exceptions import RequestEntityTooLarge
from werkzeug.utils import secure_filename
import os


app = Flask(__name__)
app.config['UPLOAD_DIRECTORY'] = '/home/sockmonkeyyy/mysite/templates/uploads'
app.config['MAX_CONTENT_LENGTH'] = 16 * 1024 * 1024 # 16MB
app.config['ALLOWED_EXTENSIONS'] = ['.jpg', '.jpeg', '.png', '.gif']

@app.route('/')
def index():
  files = os.listdir(app.config['UPLOAD_DIRECTORY'])
  images = []

  for file in files:
    if os.path.splitext(file)[1].lower() in app.config['ALLOWED_EXTENSIONS']:
        images.append(file)
  return render_template('home.html', images=images)

@app.route('/upload', methods=['POST'])
def upload():
  try:
    file = request.files['file']

    if file:
      extension = os.path.splitext(file.filename)[1].lower()

      if extension not in app.config['ALLOWED_EXTENSIONS']:
        return 'File is not an image.'

      file.save(os.path.join(
        app.config['UPLOAD_DIRECTORY'],
        secure_filename(file.filename)
      ))

  except RequestEntityTooLarge:
    return 'File is larger than the 16MB limit.'

  return redirect('/')

@app.route('/serve-image/<filename>', methods=['GET'])
def serve_image(filename):
  return send_from_directory(app.config['UPLOAD_DIRECTORY'], filename)

@app.route('/port')
def port():
  return render_template('Portfolio.html')


if __name__ == '__main__':
    app.run(debug=False)