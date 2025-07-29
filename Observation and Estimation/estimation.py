import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from scipy.stats import norm
import math
import statistics 
from sympy import *
from scipy.integrate import odeint

def SolveOScillator(x1_0, x2_0, m, nu, k):

 def dXdx(X, t):
  x1, x2 = X
  return [x2, 
           -(k/m)*x1 - (nu/m)*x2]

 # Vector of indipendent variable
 t = np.linspace(0, 2, 100)
 # Solution
 sol = odeint(dXdx, (x1_0, x2_0), t)

 # Unpack variables
 x1 = sol[:,0]
 x2 = sol[:,1]

 # Plot
 fig = plt.figure(figsize=(11,3))
 ax1 = fig.add_subplot(111)
 ax2 = ax1.twinx()
 ax1.plot(t, x1, label='position')
 ax2.plot(t, x2, color = 'orange', label='velocity')
 ax1.set_xlabel('Time (sec)')
 ax1.set_ylabel('Position (m)')
 ax2.set_ylabel('Velocity (m/sec)')
 plt.tight_layout()
 ax1.grid(True)
 ax1.legend(loc='upper right')
 ax2.legend(loc='lower right')
 plt.show()


def SolvePendulum(theta_0, omega_0, rodLenght):

 # initial conditions
 theta_0 = math.radians(theta_0) 
 omega_0 = math.radians(omega_0)
 # parameters 
 g = 9.81 # m/sec^2

 def dXdt(X, t):
  theta, omega = X
  return [omega, 
           -(g/rodLenght)*math.sin(theta)]

 # Vector of indipendent variable
 t = np.linspace(0, 3, 100)
 # Solution
 sol = odeint(dXdt, (theta_0, omega_0), t)

 # Unpack variables
 theta_t = (180/math.pi)*(sol[:,0])
 omega_t = (180/math.pi)*(sol[:,1])

 # Plot
 fig = plt.figure(figsize=(11,3))
 ax1 = fig.add_subplot(111)
 ax2 = ax1.twinx()
 ax1.plot(t, theta_t, color = 'darkviolet', label='theta')
 ax2.plot(t, omega_t, color = 'seagreen', label='omega')
 ax1.set_xlabel('Time (sec)')
 ax1.set_ylabel('Angle (deg)')
 ax2.set_ylabel('Angular Speed (deg/sec)')
 plt.tight_layout()
 ax1.grid(True)
 ax1.legend(loc='upper right')
 ax2.legend(loc='lower right')
 plt.show()
 
 
def TrainTracking(x0, v0, interval, nMeasurements_A, sigma_A, nMeasurements_B, sigma_B):
 times_A = np.arange(0,interval, interval/nMeasurements_A)
 times_B = np.arange(0,interval, interval/nMeasurements_B)

 # simulate measurements
 y_A = x0 + v0*times_A + sigma_A * np.random.randn(nMeasurements_A)
 y_B = x0 + v0*times_B + sigma_B * np.random.randn(nMeasurements_B)

 # Define the H matrix
 H_A = np.array([np.ones(len(times_A)),times_A]).T
 H_B = np.array([np.ones(len(times_B)),times_B]).T

 # define the W matrix
 W_A = np.zeros([len(times_A), len(times_A)])
 for i in range(0, len(times_A)-1):
  W_A[i,i] = 1/(sigma_A*sigma_A)
 W_B = np.zeros([len(times_B), len(times_B)])
 for i in range(0, len(times_B)-1):
  W_B[i,i] = 1/(sigma_B*sigma_B)

 # transpose the y vectors
 y_A = y_A.T
 y_B = y_B.T

 # implement the normal equation
 P_A = np.linalg.inv(H_A.T.dot(W_A).dot(H_A))
 P_B = np.linalg.inv(H_B.T.dot(W_B).dot(H_B))
 F_A = P_A.dot(H_A.T).dot(W_A).dot(y_A)
 F_B = P_B.dot(H_B.T).dot(W_B).dot(y_B)

 # get the estimates
 x0_A = F_A[0]
 x0_B = F_B[0]
 v0_A = F_A[1]
 v0_B = F_B[1]

 # get the state uncertainties
 sigmaX_A = math.sqrt(P_A[0,0])
 sigmaX_B = math.sqrt(P_B[0,0])
 sigmaV_A = math.sqrt(P_A[1,1])
 sigmaV_B = math.sqrt(P_B[1,1])

 # calculate the residual
 res_A = y_A - (F_A[0] + F_A[1]*times_A)
 res_B = y_B - (F_B[0] + F_B[1]*times_B)

 ### sensor fusion ###
 x0 = (sigmaX_B*sigmaX_B*F_A[0] + sigmaX_A*sigmaX_A*F_B[0])/(sigmaX_B*sigmaX_B+sigmaX_A*sigmaX_A)
 sigmaX = math.sqrt(1/(1/(sigmaX_B*sigmaX_B) + 1/(sigmaX_A*sigmaX_A)))  
 v0 = (sigmaV_B*sigmaV_B*F_A[1] + sigmaV_A*sigmaV_A*F_B[1])/(sigmaV_B*sigmaV_B+sigmaV_A*sigmaV_A)
 sigmaV = math.sqrt(1/(1/(sigmaV_B*sigmaV_B) + 1/(sigmaV_A*sigmaV_A)))  

 f1 = plt.figure(figsize=(11, 4))
 plt.grid(True)
 plt.xlabel("Time (sec)")
 plt.title('Residuals (m)')
 plt.scatter(times_A, res_A, color = 'blue', label = 'Tracker A')
 plt.scatter(times_B, res_B, color = 'red',  label = 'Tracker B')
 plt.legend()
 plt.show()

 print('--------------------- State estimation from Tracker A ---------------------------')
 print('Estimated x0 = ' + str(F_A[0]) + ' - ' +str(math.sqrt(P_A[0][0])) + ' m 1-sigma')
 print('Estimated v0 = ' + str(F_A[1]) + ' - ' +str(math.sqrt(P_A[1][1])) + ' m/sec 1-sigma')
 print(' ')
 print('--------------------- State estimation from Tracker B ---------------------------')
 print('Estimated x0 = ' + str(F_B[0]) + ' - ' +str(math.sqrt(P_B[0][0])) + ' m 1-sigma')
 print('Estimated v0 = ' + str(F_B[1]) + ' - ' +str(math.sqrt(P_B[1][1])) + ' m/sec 1-sigma')
 print(' ')
 print('------------------ State estimation from sensor fusion  -------------------------')
 print('Estimated x0 = ' + str(x0) + ' - ' +str(sigmaX) + ' m 1-sigma')
 print('Estimated v0 = ' + str(v0) + ' - ' +str(sigmaV) + ' m/sec 1-sigma')


def StaticEstimator(trueTemp, oneSigma, nMeasurements, initialGuess):
 
 def update(prevEstimate, gain, measure):
    nextEstimate = prevEstimate + gain * (measure - prevEstimate)
    return nextEstimate
 
 measuredTemp = trueTemp + oneSigma * np.random.randn(nMeasurements)
 x = np.full(nMeasurements, trueTemp)

 estimates = np.empty(nMeasurements +1)
 estimate = initialGuess
 estimates[0] = initialGuess
 for m in range (1, nMeasurements + 1):
    estimate = update(estimate, 1/(m+1), measuredTemp[m - 1])
    estimates[m] = estimate
       
 plt.plot(np.arange(1, nMeasurements+1, 1.0), measuredTemp, 'ro')
 plt.plot(estimates, color='blue', linewidth=3, label='Estimated value', linestyle='--')
 plt.plot(np.arange(1, nMeasurements+1, 1.0), x, color='green', label='True value')
 plt.xlabel('N measurements')
 plt.ylabel('Temperature (deg)')
 plt.xticks(np.arange(1, nMeasurements, 1.0))
 plt.grid(True)
 leg = plt.legend()
 fig = plt.gcf()
 fig.set_size_inches(15,5)
 
 
def OneDimensionalKalman(trueTemp, oneSigma, nMeasurements, initialGuess, initialUncertainty):

 ####### initialization
 estimates = np.empty(nMeasurements + 1)
 estimates[0] = initialGuess

 uncertainties = np.empty(nMeasurements + 1)
 uncertainties[0] = initialUncertainty

 kalmanGains = np.empty(nMeasurements)
 nIndex = 1;

 measurements = trueTemp + oneSigma * np.random.randn(nMeasurements)  # measurements
 p = initialUncertainty * initialUncertainty  # initial variance for the state
 r = oneSigma * oneSigma  # variance of the measuring device
 state = initialGuess

 for y in measurements:
  ### update ###
  kalmanGain = p / (p + r)
  state = state + kalmanGain * (y - state)
  p = (1 - kalmanGain) * p

  ### predict ###
  state = state  # the object isn't moving, so there is no update
  p = p  # same for the variance

  estimates[nIndex] = state
  kalmanGains[nIndex - 1] = kalmanGain
  uncertainties[nIndex] = math.sqrt(p)
  nIndex = nIndex + 1


 fig = plt.figure(figsize=(13,10))
 ax1 = fig.add_subplot(3, 1, 1)
 ax2 = fig.add_subplot(3, 1, 2)
 ax3 = fig.add_subplot(3, 1, 3)

 ax1.plot(np.arange(1, nMeasurements + 1, 1.0), measurements, 'ro', label='Measured value')
 ax1.plot(np.arange(1, nMeasurements + 1, 1.0), np.full(nMeasurements, trueTemp), color='green', label='True value')
 ax1.plot(np.arange(0, nMeasurements + 1, 1.0), estimates, color='blue', linewidth=3, label='Estimated value', linestyle='--', marker='o', markersize=7)
 ax1.legend()
 ax1.set_xticks(np.arange(0, nMeasurements +1, 1))
 ax1.grid(True)

 ax2.plot(np.arange(0, nMeasurements + 1, 1.0), uncertainties, color = 'black', linestyle='--', label='1-sigma uncertainty', linewidth=2.0)
 ax2.legend()
 ax2.set_xticks(np.arange(0, nMeasurements +1, 1))
 ax2.grid(True)

 ax3.plot(np.arange(0, nMeasurements, 1.0), kalmanGains, color = 'blueviolet', linestyle='--', label='Kalman gain', linewidth=2.0)
 ax3.legend()
 ax3.set_xticks(np.arange(0, nMeasurements, 1))
 ax3.grid(True)
 plt.xlabel('N measurements')
 plt.show()
 
 
def KalmanProcessNoise(initTemp, gradientTemp, oneSigma, nMeasurements, timeStep, initialGuess, initialUncertainty, w, q):
 # arrays definition
 estimates = np.empty(nMeasurements)
 uncertainties = np.empty(nMeasurements)
 kalmanGains = np.empty(nMeasurements)
 highConfidenceEnd = np.empty(nMeasurements)
 lowConfidenceEnd = np.empty(nMeasurements)

 # measurement set generation
 measTimes = np.arange(0, nMeasurements*timeStep, timeStep)
 trueValues = initTemp + measTimes*gradientTemp
 measurements = trueValues + oneSigma * np.random.randn(nMeasurements)  # measurements

 ####### initialization
 p = initialUncertainty * initialUncertainty  # initial variance for the state
 r = oneSigma * oneSigma  # variance of the measuring device
 state = initialGuess

 nIndex = 0
 for y in measurements:
  ### update ###
  kalmanGain = p / (p + r)

  estimates[nIndex] = state
  uncertainties[nIndex] = math.sqrt(p)
  kalmanGains[nIndex] = kalmanGain
  highConfidenceEnd[nIndex] = state + 3 * math.sqrt(p)
  lowConfidenceEnd[nIndex]  = state - 3 * math.sqrt(p)


  state = state + kalmanGain * (y - state)
  p = (1 - kalmanGain) * p


  ### predict ###
  state = state + w*np.random.rand(1)
  p = p  + q

  nIndex = nIndex + 1

 fig = plt.figure(figsize=(11,9))
 ax1 = fig.add_subplot(2, 1, 1)
 ax2 = fig.add_subplot(2, 1, 2)

 ax1.plot(np.arange(1, nMeasurements + 1, 1.0), measurements, color='red', marker='x', label='Measured value')
 ax1.plot(np.arange(1, nMeasurements + 1, 1.0), lowConfidenceEnd, color='orange', linewidth=1, label='3-sigma confidence')
 ax1.plot(np.arange(1, nMeasurements + 1, 1.0), highConfidenceEnd, color='orange', linewidth=1)
 ax1.plot(np.arange(1, nMeasurements + 1, 1.0), np.full(nMeasurements, trueValues), color='green', label='True value')
 ax1.plot(np.arange(1, nMeasurements + 1, 1.0), estimates, color='blue', linewidth=2, label='Estimated value', linestyle='--', marker='o', markersize=4)
 ax1.fill_between(np.arange(1, nMeasurements + 1, 1.0), lowConfidenceEnd, highConfidenceEnd, color = 'khaki')
 ax1.legend()
 ax1.set_xticks(np.arange(1, nMeasurements +1, 1))
 ax1.grid(True)


 ax2.plot(np.arange(1, nMeasurements + 1, 1), kalmanGains, color = 'blueviolet', linestyle='--', label='Kalman gain', linewidth=2.0)
 ax2.plot(np.arange(1, nMeasurements + 1, 1), uncertainties, color = 'black', linestyle='--', label='1-sigma uncertainty', linewidth=2.0)
 ax2.legend()
 ax2.set_xticks(np.arange(1, nMeasurements, 1))
 ax2.grid(True)
 ax2.set_xlabel('N measurements')
 plt.xlabel('N measurements')
 plt.show()


def ekfilter(z, updateNumber, dT, xUnc, yUnc, vxUnc, vyUnc): # z = [r, b]
 j = updateNumber
 # Initialize State
 if updateNumber == 0: # First Update
    # compute position values from measurements
    temp_x = z[0][j]*np.sin(z[1][j]*np.pi/180) # x = r*sin(b)
    temp_y = z[0][j]*np.cos(z[1][j]*np.pi/180) # y = r*cos(b)
    # State vector - initialize position values
    ekfilter.x = np.array([[temp_x],
                        [temp_y],
                        [0],
                        [0]])
    # State covariance matrix - initialized to zero for first update
    ekfilter.P = np.array([[xUnc*xUnc, 0, 0, 0],
                           [0, yUnc*yUnc, 0, 0],
                           [0, 0, vxUnc*vxUnc, 0],
                           [0, 0, 0, vyUnc*vyUnc]])
    # State transition matrix - linear extrapolation assuming constant velocity
    ekfilter.A = np.array([[1, 0, dT, 0],
                         [0, 1, 0, dT],
                         [0, 0, 1, 0],
                         [0, 0, 0, 1]])
    # Measurement covariance matrix
    ekfilter.R = z[2][j]
    # System error matrix - initialized to zero matrix for first update
    ekfilter.Q = np.array([[0, 0, 0, 0],
                           [0, 0, 0, 0],
                           [0, 0, 0, 0],
                           [0, 0, 0, 0]])
    # Residual and kalman gain
    # not computed for first update but initialized so it could be output
    residual = np.array([[0, 0],
                         [0, 0]])
    K = np.array([[0, 0],
                  [0, 0],
                  [0, 0],
                  [0, 0]])

 # Reinitialize State
 if updateNumber == 1: # Second Update
    # Get previous state vector values
    prev_x = ekfilter.x[0][0]
    prev_y = ekfilter.x[1][0]
    temp_x = z[0][j]*np.sin(z[1][j]*np.pi/180) # x = r*sin(b)
    temp_y = z[0][j]*np.cos(z[1][j]*np.pi/180) # y = r*cos(b)
    #  Compute velocity - vel = (pos2 - pos1)/deltaTime
    temp_xv = (temp_x - prev_x)/dT
    temp_yv = (temp_y - prev_y)/dT
    # State vector - reinitialized with new position and computed velocity
    ekfilter.x = np.array([[temp_x],
                           [temp_y],
                           [temp_xv],
                           [temp_yv]])
    # state covariance matrix
    ekfilter.P = np.array([[xUnc*xUnc, 0, 0, 0],
                           [0, yUnc*yUnc, 0, 0],
                           [0, 0, vxUnc*vxUnc, 0],
                           [0, 0, 0, vyUnc*vyUnc]])
    # State transition matrix - linear extrapolation assuming constant velocity
    ekfilter.A = np.array([[1, 0, dT, 0],
                         [0, 1, 0, dT],
                         [0, 0, 1, 0],
                         [0, 0, 0, 1]])
    # Measurement covariance matrix - provided by the measurement source
    ekfilter.R = z[2][j]
    # System error matrix
    sd = 1 # spectral density
    ekfilter.Q = np.array([[(sd*dT**3)/3, 0, (sd*dT**2)/2, 0],
                           [0, (sd*dT**3)/3, 0, (sd*dT**2)/2],
                           [(sd*dT**2)/2, 0, sd*dT, 0],
                           [0, (sd*dT**2)/2, 0, sd*dT]])
    # Residual and kalman gain-  initialized so it could be output
    residual = np.array([[0, 0],
                         [0, 0]])
    K = np.array([[0, 0],
                  [0, 0],
                  [0, 0],
                  [0, 0]])

 if updateNumber > 1: # Third Update and Subsequent Updates
  # Predict state and state covariance forward
  x_prime = ekfilter.A.dot(ekfilter.x)
  P_prime = ekfilter.A.dot(ekfilter.P).dot(ekfilter.A.T) + ekfilter.Q
  # Form state to measurement transition matrix
  x1 = x_prime[0][0]
  y1 = x_prime[1][0]
  x_sq = x1*x1
  y_sq = y1*y1
  den = x_sq+y_sq
  den1 = np.sqrt(den)
  ekfilter.H = np.array([[x1/den1, y1/den1, 0, 0],
                         [y1/den, -x1/den,  0, 0]])
  # Measurement covariance matrix
  ekfilter.R = z[2][j]
  # Compute Kalman Gain
  S = ekfilter.H.dot(P_prime).dot(np.transpose(ekfilter.H)) + ekfilter.R
  K = P_prime.dot(np.transpose(ekfilter.H)).dot(np.linalg.inv(S))
  # Estimate State
  temp_z = np.array([[z[0][j]],
                     [z[1][j]]])
  # Convert the predicted cartesian state to polar range and azimuth
  pred_x = x_prime[0][0]
  pred_y = x_prime[1][0]
  sumSquares = pred_x*pred_x + pred_y*pred_y
  pred_r = np.sqrt(sumSquares)
  pred_b = np.arctan2(pred_x, pred_y) * 180/np.pi
  h_small = np.array([[pred_r],
                   [pred_b]])
  # Compute residual difference between state and measurement for data time
  residual = temp_z - h_small
  # Compute new estimate for state vector using the Kalman Gain
  ekfilter.x = x_prime + K.dot(residual)
  # Compute new estimate for state covariance using the Kalman Gain
  ekfilter.P = P_prime - K.dot(ekfilter.H).dot(P_prime)
 return [ekfilter.x[0], ekfilter.x[1], ekfilter.P, ekfilter.x[2], ekfilter.x[3], K, residual]


'''
def KalmanFreeFall(initialPos, initialVel, sigmaMeas, nMeasurements, timeStep, estimatedPos, estimatedVel, posUncertainty, velUncertainty, sp):

	def filter():

		# state transition matrix
		filter.A = np.array([[1, timeStep],
							 [0, 1]])
		# input vector
		filter.U = -9.81 * np.array([[0],
									 [timeStep]])
		# state
		filter.x = np.array([[estimatedPos],
							 [estimatedVel]])
		# state covariance matrix
		filter.P = np.array([[posUncertainty * posUncertainty, 0],
							 [0, velUncertainty * velUncertainty]])
		# state to measurement matrix
		filter.H = np.array([[1, 0]])
		# measure covariance matrix
		filter.R = sigmaMeas * sigmaMeas
		# process noise covariance matrix

		filter.Q = sp * np.array([[math.pow(timeStep,3)/3, 0.0],
								  [0.0, timeStep]])
		return filter

	def estimate(y, filter):
		####### Predict ########
		# State
		x_p = filter.A.dot(filter.x) + filter.U
		# Covariance
		P_p = filter.A.dot(filter.P).dot(filter.A.T) + filter.Q

		####### Update ########
		# Compute Kalman Gain
		S = filter.H.dot(P_p).dot(np.transpose(filter.H)) + filter.R
		K = P_p.dot(np.transpose(filter.H))*(1/S)
		# Estimate State
		residual = y - filter.H.dot(x_p)
		filter.x = x_p + K*residual
		# Estimate Covariance
		filter.P = P_p - K.dot(filter.H).dot(P_p)
		return [filter.x, filter.P, residual]


	# measurement set generation
	measTimes = np.linspace(timeStep, nMeasurements*timeStep, nMeasurements)
	truePosition = np.empty(nMeasurements)
	trueVelocity = np.empty(nMeasurements)
	measurements = np.empty(nMeasurements)
	for i in range (0, nMeasurements):
	 truePosition[i] = (initialPos + initialVel*measTimes[i] -0.5*9.81*measTimes[i]*measTimes[i])
	 trueVelocity[i] = initialVel - 9.81*measTimes[i]
	 measurements[i] = + truePosition[i] + sigmaMeas * np.random.randn()


	# arrays definition
	posEstimates     = []
	posUncertainties = []
	velEstimates     = []
	velUncertainties = []
	residuals        = []
	highPosConfidenceEnd = []
	lowPosConfidenceEnd  = []
	highVelConfidenceEnd = []
	lowVelConfidenceEnd  = []


	# initialize the filter
	filter()

	# process measurements
	for i in range (0, nMeasurements):
	 res = estimate(measurements[i], filter)
	 posEstimates.append(res[0][0].reshape(()))
	 posUncertainties.append(math.sqrt(res[1][0][0]))
	 velEstimates.append(res[0][1].reshape(()))
	 velUncertainties.append(math.sqrt(res[1][1][1]))


	for i in range(0, len(posEstimates)):
	 highPosConfidenceEnd.append(posEstimates[i] + 3 * posUncertainties[i])
	 lowPosConfidenceEnd.append(posEstimates[i] - 3 * posUncertainties[i])
	 highVelConfidenceEnd.append(velEstimates[i] + 3 * velUncertainties[i])
	 lowVelConfidenceEnd.append(velEstimates[i] - 3 * velUncertainties[i])


	e = plt.figure(figsize=(11.5,2.5))
	plt.scatter(np.linspace(0, nMeasurements*timeStep, nMeasurements), measurements - posEstimates, color = 'purple', label='Residuals',  marker='o')
	plt.legend()
	plt.ylabel('Distance (m)')
	plt.xlabel('Time (sec)')
	plt.grid(True)
	plt.show()

	f = plt.figure(figsize=(11.5,4))
	plt.plot(np.linspace(0, nMeasurements*timeStep, nMeasurements), posEstimates, color='blue', linewidth=2, label='Estimated pos', linestyle='--', marker='o', markersize=7)
	plt.plot(np.linspace(timeStep, nMeasurements*timeStep, nMeasurements), truePosition, color='fuchsia', marker='x',label='True position')
	plt.plot(np.linspace(0, nMeasurements*timeStep, nMeasurements), lowPosConfidenceEnd, color='orange', label='3-sigma confidence')
	plt.plot(np.linspace(0, nMeasurements*timeStep, nMeasurements), highPosConfidenceEnd, color='orange')
	plt.fill_between(np.linspace(0, nMeasurements*timeStep, nMeasurements), lowPosConfidenceEnd, highPosConfidenceEnd, color = 'khaki')
	plt.scatter(np.linspace(0, nMeasurements*timeStep, nMeasurements), measurements, color='cyan', label='Measurements')
	plt.legend()
	plt.ylabel('Height (m)')
	plt.xlabel('Time (sec)')
	plt.grid(True)
	plt.show()


	g = plt.figure(figsize=(11.5,4))
	plt.plot(np.linspace(0, nMeasurements*timeStep, nMeasurements), velEstimates, color = 'black', linewidth=2, label='Estimated vel', linestyle='--', marker='o', markersize=7)
	plt.plot(np.linspace(timeStep, nMeasurements*timeStep, nMeasurements), trueVelocity, color = 'deeppink', marker='x', label='True velocity')
	plt.plot(np.linspace(0, nMeasurements*timeStep, nMeasurements), lowVelConfidenceEnd, color='orange', label='3-sigma confidence')
	plt.plot(np.linspace(0, nMeasurements*timeStep, nMeasurements), highVelConfidenceEnd, color='orange')
	plt.fill_between(np.linspace(0, nMeasurements*timeStep, nMeasurements), lowVelConfidenceEnd, highVelConfidenceEnd, color = 'khaki')
	plt.legend()
	plt.ylabel('Velocity (m/sec)')
	plt.xlabel('Time (sec)')
	plt.grid(True)
	plt.show()
'''