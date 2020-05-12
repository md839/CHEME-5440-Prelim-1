# Code adapted from LorenzExample.jl posted in Slack by Professor Paszek

using DifferentialEquations
using Plots
gr(size=(500,500), show = true)  #use the gr backend for plotting

#Function for question 2D
#u[1] = x; u[2] = y; u[3] = z
function Question2D!(du,u,p,t)
  Ax = 3.9*10^-2
  Ay = 4.3*10^-3
  Bx = 6.1
  By = 5.7
  Dy = 1.05
  Dz = 1.04
  Zx = 1.3*10^-5
  Yz = 11*10^-3
  Xz = 12*10^-2
  Xy = 7.9*10^-4
  Nzx = 2.32
  Nxy = 2
  Nxz = 2
  Nyz = 2
  S = 0.02

 du[1] = (Ax+Bx*S)/(1+S+(u[3]/Zx)^Nzx) - u[1]                #dx/dt
 du[2] = (Ay +By*S)/(1+S+(u[1]/Xy)^Nxy) - Dy*u[2]        #dy/dt
 du[3] = (1)/(1+(u[1]/Xz)^Nxz+(u[2]/Yz)^Nyz) - Dz*u[3]         #dz/dt
end

u0 = [0.0;0.0;0.0]                      #intial conditions
tspan = (0.0,50.0)                     #start and end time
prob = ODEProblem(Question2D!,u0,tspan)     #Create an ODE problem for the Question2D fxn
sol = solve(prob)                       #Solve the system

#Plot the results; the vars=(0,1) argument specifies to plot X (column 1 of sol)
#vs t (column 0 of sol)
plt1 = plot(sol,vars=(0,1), xaxis="t", yaxis = "X" )
display(plt1)

