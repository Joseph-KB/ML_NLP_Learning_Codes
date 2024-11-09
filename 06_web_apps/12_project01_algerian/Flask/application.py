# An object of Flask class is our WSGI application.
from flask import Flask,render_template,request,jsonify
import pickle
import numpy as np
import pandas as pd
from sklearn.preprocessing import StandardScaler

## import ridge regressor and standard scaler
ridge_model = pickle.load(open('pickle_files/12_proj01_algerian/ridge_regressor.pkl','rb'))
standard_scaler = pickle.load(open('pickle_files/12_proj01_algerian/standscaler.pkl','rb'))


# Flask constructor takes the name of 
# current module (__name__) as argument.
application = Flask(__name__)
app = application

# The route() function of the Flask class is a decorator, 
# which tells the application which URL should call 
# the associated function.
@app.route('/')
# ‘/’ URL is bound with hello_world() function.
def index():
    return render_template('index.html')

@app.route('/prediction',methods =['GET','POST'])
def predict_data():
    if request.method=='POST':
        Temperature = float(request.form.get('Temperature'))
        RH = float(request.form.get('RH'))
        WS = float(request.form.get('WS'))
        Rain = float(request.form.get('Rain'))
        FFMC = float(request.form.get('FFMC'))
        DMC = float(request.form.get('DMC'))
        ISI = float(request.form.get('ISI'))
        Classes = float(request.form.get('Classes'))
        Region = float(request.form.get('Region'))
        data = [[Temperature,RH,WS,Rain,FFMC,DMC,ISI,Classes,Region]]
        print(data)

        data_scaled = standard_scaler.transform(data)
        result = ridge_model.predict(data_scaled)
        print(result)

        return render_template('home.html',results = result[0])
        pass
    else:
        return render_template('home.html')
    return render_template('home.html')

# main driver function
if __name__ == '__main__':

    # run() method of Flask class runs the application 
    # on the local development server.
    app.run(host='0.0.0.0',port=5000,debug=True)
