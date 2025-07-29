import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from scipy.stats import norm
import math
import statistics 
from sympy import *
from scipy.integrate import odeint

def PlotHeightWeightDataSet(df):
 dataArray = df.to_numpy()
 xSeries = dataArray[:,0]
 ySeries = dataArray[:,1]
 f = plt.figure(figsize=(10,4))
 ax1 = f.add_subplot(111)
 ax1.grid(True)
 plt.xlabel("Height (cm)")
 plt.ylabel("Weight (kg)")
 plot = ax1.scatter(xSeries, ySeries) 


def LinearLeastSquares(df):

 dataArray = df.to_numpy()
 xSeries = dataArray[:,0]
 ySeries = dataArray[:,1]
 m = len(xSeries)
 
 # Define the H matrix
 H = np.array([np.ones(len(xSeries)),xSeries.flatten()]).T
 
 # define the W vector
 W = ySeries.T

 # implement the normal equation
 x = np.linalg.inv(H.T.dot(H)).dot(H.T).dot(W)
 best_x1 = x[0]
 best_x2 = x[1]
 print('Best x1 = ' + str(best_x1)) 
 print('Best x2 = ' + str(best_x2)) 
 
 # calculate the cost function
 J = 0
 for k in range(m):
  J = J + pow((best_x1 + best_x2 * xSeries[k]) - ySeries[k],2)
 print('Cost function value is:' + str(round(J/(2*m),2) ))

 # draw the data scatter plot and the analytical model we implemented 
 f = plt.figure(figsize=(10,4))
 ax1 = f.add_subplot(111)
 ax1.grid(True)
 plt.xlabel("Height (cm)")
 plt.ylabel("Weight (kg)")
 plot = ax1.scatter(xSeries, ySeries)
 x = np.linspace(60,175,2)
 y = best_x1 + best_x2 * x
 plot = plt.plot(x, y, '-r', label='Linear Model (straight line)')
 legend = plt.legend()
 

def PlotRandomWalk(nsteps, randomSeed):
 # Generate random data
 np.random.seed(randomSeed) 
 x = np.zeros(nsteps)
 y = np.zeros(nsteps)
 for i in range(1, nsteps):
    dx = np.random.choice([-1, 1])
    dy = np.random.choice([-1, 1])
    x[i] = x[i-1] + dx
    y[i] = y[i-1] + dy

 fig, axs = plt.subplots(3, 1, figsize=(12, 7)) 

 # Plot 1: x vs y 
 axs[0].plot(x, y, 'orangered')
 axs[0].set_xlabel('x')
 axs[0].set_ylabel('y')
 axs[0].set_title('x vs y')
 axs[0].set_aspect('equal') 
 axs[0].figure.set_size_inches(9, 9) 
 axs[0].grid(True) 

 # Plot 2: x vs time
 axs[1].plot(range(nsteps), x)
 axs[1].set_xlabel('Time')
 axs[1].set_ylabel('x')
 axs[1].set_title('x evolution')
 axs[1].set_xticks(np.arange(0, nsteps + 1, math.ceil(nsteps/20)))
 axs[1].grid(True) 

 # Plot 3: y vs time
 axs[2].plot(range(nsteps), y)
 axs[2].set_xlabel('Time')
 axs[2].set_ylabel('y')
 axs[2].set_title('y evolution')
 axs[2].set_xticks(np.arange(0, nsteps + 1, math.ceil(nsteps/20)))
 axs[2].grid(True)

 plt.subplots_adjust(hspace=0.5)

 plt.tight_layout()
 plt.show()


def PlotBrownianMotion(initValue, T, N):
 dt = T / N
 B = np.zeros(N + 1)
 B[0] = initValue
 #  Brownian motion simulation
 for i in range(1, N + 1):
    B[i] = B[i-1] + np.random.normal(0, np.sqrt(dt))

 # Plot
 f = plt.figure(figsize=(10,4))
 plt.plot(np.linspace(0, T, N + 1), B, 'darkgreen')
 plt.xlabel('Time')
 plt.ylabel('B(t)')
 plt.title('Brownian motion process')
 plt.grid(True)
 plt.show()


def PlotExponentialDecay(initValue, T, N, tau, sigma):
 
 dt = T / N  # temp step
 # Inizialization
 X = np.zeros(N + 1)
 X[0] = initValue

 # Simulation
 for i in range(1, N + 1):
  X[i] = X[i-1]*math.exp(-dt/tau) + np.random.normal(0, sigma)*math.sqrt(0.5*(1 - math.exp(-2*dt/tau)))

 # Plot
 s = plt.figure(figsize=(10,4))
 plt.plot(np.linspace(0, T, N + 1), X, 'brown')
 plt.xlabel('Time')
 plt.ylabel('X(t)')
 plt.title('Exponential decay process')
 plt.grid(True)
 plt.show()
 
 
def QuadraticLeastSquares(df):

 dataArray = df.to_numpy()
 xSeries = dataArray[:,0]
 ySeries = dataArray[:,1]
 m = len(xSeries)
 
 # Define the H matrix
 H = np.array([np.ones(len(xSeries)), xSeries.flatten(), xSeries.flatten()*xSeries.flatten()]).T
 
 # define the W vector
 W = ySeries.T

 # implement the normal equation
 x = np.linalg.inv(H.T.dot(H)).dot(H.T).dot(W)
 best_x1 = x[0]
 best_x2 = x[1]
 best_x3 = x[2]
 print('Best x1 = ' + str(best_x1)) 
 print('Best x2 = ' + str(best_x2)) 
 print('Best x3 = ' + str(best_x3)) 
 
 # calculate the cost function
 J = 0
 for k in range(m):
  J = J + pow((best_x1 + best_x2 * xSeries[k] + best_x3 * xSeries[k] * xSeries[k]) - ySeries[k],2)
 print('Cost function value is:' + str(round(J/(2*m),2) ))

 # draw the data scatter plot and the analytical model we implemented 
 f = plt.figure(figsize=(10,4))
 ax1 = f.add_subplot(111)
 ax1.grid(True)
 plt.xlabel("Height (cm)")
 plt.ylabel("Height (kg)")
 plot = ax1.scatter(xSeries, ySeries)
 x = np.linspace(60,175,115)
 y = best_x1 + best_x2 * x + best_x3 * x * x
 plot = plt.plot(x, y, '-r', label='Quadratic Model (parabolic line)')
 legend = plt.legend()


def PlotLinearCostFunction(df, a, b):

 dataArray = df.to_numpy()
 xSeries = dataArray[:,0]
 ySeries = dataArray[:,1]
 m = len(xSeries)
 J = 0
 # calculate the cost function
 for k in range(m):
  J = J + pow((a + b * xSeries[k]) - ySeries[k],2)
 print('Cost function value is:' + str(round(J/(2*m),2) ))

 # draw the data scatter plot and the analytical model we implemented 
 f = plt.figure(figsize=(10,4))
 ax1 = f.add_subplot(111)
 ax1.grid(True)
 plt.xlabel("Height (cm)")
 plt.ylabel("Height (kg)")
 plot = ax1.scatter(xSeries, ySeries)
 x = np.linspace(60,175,115)
 y = a + b * x
 plot = plt.plot(x, y, '-r', label='Linear Model (straight line)')
 legend = plt.legend()
 
 
def PlotPdf(a,b):
 pr = round(b*b*b - a*a*a, 3)
 print('Probability = ' + str(pr))
 fig = plt.figure(figsize=(10,3))
 ax1 = fig.add_subplot(111)
 ax1.grid(True)
 plt.xlabel("x")
 plt.ylabel("f(x)")
 x = np.linspace(0,1,100)
 y = 3 * x * x
 plot = plt.plot(x, y, '-r', label='PDF')
 plt.fill_between(x, y,  where = (x >= a) & (x <= b), color = 'gray')
 legend = plt.legend()


def PlotNormalDistribution(mean, sigma, nSigma):
 
 fig = plt.figure(figsize=(11,5))
 # create the independent variable array
 x = np.linspace(mean - 4*sigma, mean + 4*sigma, 100)

 # calculate the probability for nSigma
 xp = Symbol('x')
 p = exp(-(xp-mean)**2/2)/sqrt(2*pi)
 prob = Integral(p, (xp, mean - nSigma, mean + nSigma)).doit().evalf()
 print('The probability to get a measure between ' + str(mean - nSigma*sigma) + ' and ' + str(mean + nSigma*sigma) + ' is ' + str(prob*100) + ' %')
 
 # plot the pdf
 plt.plot(x, norm.pdf(x, mean, sigma), label='PDF', linewidth=3, color='dimgray')
 plt.axvline(x= mean - nSigma*sigma, color='r', linestyle='--', label = str(nSigma) + ' sigma')
 plt.axvline(x= mean + nSigma*sigma, color='r', linestyle='--')
 #plt.ylim(0, 1) 
 plt.grid(True)
 plt.xlabel("Measure")
 plt.ylabel("f(x)")
 leg = plt.legend()
 plt.fill_between(x, norm.pdf(x, mean, sigma),  where = (x >= mean - nSigma*sigma) & (x <= mean + nSigma*sigma), color = 'khaki')
 plt.title('Normal Distribution')
 plt.show()


def DataFusion(mean1, sigma1, mean2, sigma2):
 var1 = sigma1*sigma1
 var2 = sigma2*sigma2
 new_mean = (var2*mean1 + var1*mean2)/(var2+var1)
 new_sigma = math.sqrt(1/(1/var2 + 1/var1))  

 x1 = np.linspace(mean1 - 4*sigma1, mean1 + 4*sigma1, 100)
 x2 = np.linspace(mean2 - 4*sigma2, mean2 + 4*sigma2, 100)
 x3 = np.linspace(new_mean - 4*new_sigma, new_mean + 4*new_sigma, 100)

 fig = plt.figure(figsize=(11,5))
 plt.plot(x1, norm.pdf(x1, mean1, sigma1), label='Distribution 1', color='dimgray')
 plt.plot(x2, norm.pdf(x2, mean2, sigma2), label='Distribution 2', color='darkgoldenrod')
 plt.plot(x3, norm.pdf(x3, new_mean, new_sigma), label = 'Resulting distribution', linewidth=4, color='darkorange')
 plt.grid(True)
 plt.xlabel("Mean")
 leg = plt.legend()
 plt.title('Data Fusion')
 plt.show()
 
 data = [["Distribution 1", mean1, sigma1], ["Distribution 2", mean2, sigma2], ["Fusion", new_mean, new_sigma]]
 df = pd.DataFrame(data,columns=["Source","Mean","Sigma"])
 print(df)


def PlotMeasurementModel(nMeasurements, sistematicError, trueDistance, oneSigma, whiteNoise):
 x = np.linspace(1, nMeasurements, nMeasurements)
 measuredDistances = trueDistance + oneSigma * np.random.randn(nMeasurements) + whiteNoise*np.random.randn(nMeasurements) + sistematicError
 mu = np.mean(measuredDistances)
 sigma = np.std(measuredDistances)
 residuals = measuredDistances - mu
 
 # plot measurements
 fig1 = plt.figure(figsize=(10,3))
 plt.scatter(x, measuredDistances, color = 'red', s=4)
 plt.title('Measured Values (meters)')
 plt.ylabel('Distance')
 plt.grid(True)
 plt.show()
 
 # plot residuals
 fig2 = plt.figure(figsize=(10,3))
 plt.scatter(x, residuals, color = 'purple', s=4)
 plt.title('Residuals')
 plt.ylabel('m')
 plt.axhline(y =  3*sigma, color='brown', linestyle='--', linewidth=2)
 plt.axhline(y = -3*sigma, color='brown', linestyle='--', linewidth=2)
 plt.grid(True)
 plt.show()

 # plot histogram  and PDF
 xMin = trueDistance - 4 * oneSigma
 xMax = trueDistance + 4 * oneSigma
 x = np.linspace(xMin, xMax, 100)
 fig3 = plt.figure(figsize=(10,5))
 n, bins, patches = plt.hist(measuredDistances, 50, density=1, facecolor='g', alpha=0.75, edgecolor='black')
 normDistr = norm.pdf(x, trueDistance, oneSigma)
 plt.plot(x, normDistr, label='Normal Distribution', linewidth=3, color='red', linestyle='--')
 
 
 plt.xlabel('Range')
 plt.ylabel('f(x)')
 plt.title('Histogram')
 plt.axis([xMin, xMax, 0, np.amax(normDistr)])
 fig = plt.gcf()
 plt.grid(True)
 leg = plt.legend()


def GetProbabilityFromPdf(trueDistance, sistematicError, oneSigma, xMin, xMax):

 # plot PDF
 fig = plt.figure(figsize=(11,5))
 mean = trueDistance + sistematicError
 xPlotMin = mean - 4 * oneSigma
 xPlotMax = mean + 4 * oneSigma
 x = np.linspace(xPlotMin, xPlotMax, 100)
 plt.plot(x, norm.pdf(x, mean, oneSigma), label='Normal Distribution', linewidth=3, color='green', linestyle='--')
 plt.fill_between(x, norm.pdf(x, mean, oneSigma),  where = (x >= xMin) & (x <= xMax), color = 'khaki')
 plt.xlabel('Measure')
 plt.ylabel('f(x)')
 plt.title('Histogram')
 #fig = plt.gcf()
 fig.set_size_inches(11,5)
 plt.grid(True)
 leg = plt.legend()
 
 # calculate the probability between xMin and xMax
 xp = Symbol('x')
 p = exp(-(xp-mean)**2/2)/sqrt(2*pi)
 prob = Integral(p, (xp, xMin, xMax)).doit().evalf()
 print('The probability to get a measure between ' + str(xMin) + ' and ' + str(xMax) + ' is ' + str(prob*100) + ' %')
 
 
def PlotAutocorrelation(dataset1, dataset2, nPopulation, lag):
 # Mean
 mean1 = np.mean(dataset1)
 mean2 = np.mean(dataset2)
 # Variance
 var1 = np.var(dataset1)
 var2 = np.var(dataset2)
 # Normalized data
 ndata1 = dataset1 - mean1
 ndata2 = dataset2 - mean2

 acorr1 = np.correlate(ndata1, ndata1, 'full')[lag-1:] / var1 / lag
 acorr2 = np.correlate(ndata2, ndata2, 'full')[lag-1:] / var2 / lag

 f = plt.figure(figsize=(11,4))
 ax1 = f.add_subplot(111)
 ax1.grid(True)
 plt.xlabel("Data")

 plot = plt.plot(dataset1, 'lightgray', label='Random variables')
 plot = plt.plot(acorr1, 'darkgray', label='Autocorrelation of random variables')
 plot = plt.plot(dataset2, 'lightsalmon', label='Sin(x)')
 plot = plt.plot(acorr2, 'orangered', label='Autocorrelation of Sin(x)')

 legend = plt.legend()
 
 
def GetCovariance(df):
 dataArray = df.to_numpy()
 y1 = dataArray[:,0]
 y2 = dataArray[:,1]

 # calculate mean and standard deviation
 y1_mean = statistics.mean(y1)  #np.mean(y1)
 y2_mean = statistics.mean(y2)  #np.mean(y2)
 y1_std  = statistics.stdev(y1) #np.std(y1)
 y2_std  = statistics.stdev(y2) #np.std(y2)

 # calculate covariance 
 sum = 0
 for m in range(0, len(y1)):
  sum += ((y1[m] - y1_mean) * (y2[m] - y2_mean))
 cov = sum/(len(y1)-1)

 # calculate correlation
 corr = cov/(y1_std*y2_std)
 print('Covariance is:               ' + str(cov))
 print('Correlation coefficient is: ' + str(corr)) 


def PlotXYscatter(xMean, xSigma, yMean, ySigma, nPopolation):
 # Normal distributed measurements
 x = np.random.normal(xMean, xSigma, nPopolation)
 y = np.random.normal(yMean, ySigma, nPopolation)
 
 # get statistics
 cov = np.cov(x,y)
 rho = np.corrcoef(x,y)
 xSigmaPost = math.sqrt(cov[0][0])
 ySigmaPost = math.sqrt(cov[1][1])
 
 fig = plt.figure(figsize=(10,5))
 ax = plt.subplot(111,aspect = 'equal')
 plt.scatter(x, y, color = 'darkorange')
 # Creates an array of angles from 0 to 2pi
 angles = np.linspace(0, 2*np.pi, 100)
 # Get the covariance ellipse coordinates
 ex = xMean + 3*xSigmaPost*np.cos(angles)
 ey = yMean + 3*ySigmaPost*np.sin(angles)
 plt.plot(ex, ey, color = 'green', linewidth=3, linestyle='--', label='3-σ confidence level')
 plt.grid(True)
 plt.xlabel('m')
 plt.ylabel('m')
 legend = plt.legend(loc='upper left')

 print('X standard deviation (m) = ' + str(xSigmaPost))
 print('Y standard deviation (m) = ' + str(ySigmaPost))
 print('Correlation coefficient  = ' + str(rho[0][1])) 
