# Code adapted from LorenzExample.jl posted in Slack by Professor Paszek

using DifferentialEquations
using Plots
gr(size=(500,500), show = true)  #use the gr backend for plotting

#Function for question 2E to find steady state variables
#u[1] = x; u[2] = y; u[3] = z
function Question2E!(du,u,p,t)
  Ax = 0.039
  Ay = 0.0043
  Bx = 6.1
  By = 5.7
  Dy = 1.05
  Dz = 1.04
  Zx = 1.3e-5
  Yz = 11e-3
  Xz = 0.12
  Xy = 7.9e-4
  Nzx = 2.32
  Nxy = 2.0
  Nxz = 2.0
  Nyz = 2.0
  S = 35000

 du[1] = (Ax+Bx*S)/(1+S+(u[3]/Zx)^Nzx) - u[1]                #dx/dt
 du[2] = (Ay +By*S)/(1+S+(u[1]/Xy)^Nxy) - Dy*u[2]        #dy/dt
 du[3] = (1)/(1+(u[1]/Xz)^Nxz+(u[2]/Yz)^Nyz) - Dz*u[3]         #dz/dt
end

u0 = [0.0;0.0;0.0]                      #intial conditions
tspan = (0.0,100.00)                     #start and end time
prob = ODEProblem(Question2E!,u0,tspan)     #Create an ODE problem for the Question2E fxn
sol = solve(prob)                       #Solve the system

SSIdx=length(sol.t)
Xss=sol[1,SSIdx]
Yss=sol[2,SSIdx]
Zss=sol[3,SSIdx]
print("Steady State of x is as follows:")
print(Xss)
print(" Steady State of y is as follows:")
print(Yss)
print(" Steady State of z is as follows:")
print(Zss)


#Choosing S


#cell 1
SS1=[Xss,Yss,Zss]
prob = ODEProblem(Question2E!,SS1,tspan,100) #Create an ODE problem for the Question2E fxn
sol_cell1 = solve(prob)                       

#cell 2
SS2=1.25*[Xss,Yss,Zss]
prob = ODEProblem(Question2E!,SS2,tspan,100) #Create an ODE problem for the Question2E fxn
sol_cell2 = solve(prob)    

#cell 3
SS3=0.75*[Xss,Yss,Zss]
prob = ODEProblem(Question2E!,SS3,tspan,100) #Create an ODE problem for the Question2E fxn
sol_cell3 = solve(prob) 

plot!(sol_cell1.t,sol_cell1[3,:],label=["Cell 1"])   
plot!(sol_cell2.t,sol_cell2[3,:],label=["Cell 2"])  
plot!(sol_cell3.t,sol_cell3[3,:],label=["Cell 3"])  