x1 = 2
x2 = 2
t = x1+x2
n = 2
mle = n/(t+n)
L = 100000

count1 = 0
count2 = 0
H = c()
#parametric bootstrapping
for (k in 1:L){
  y1 = rgeom(1, mle)
  y2 = rgeom(1, mle)
  H = c(H, y2/(y1+y2))
  if (y2 >= (y1+y2)*x2/t){
    count1 = count1 + 1
  }
}

#Conditional p-value
for (kk in 1:L){
  z2 = sample(0:t, 1, replace=T)
  if (z2 >= x2){
    count2 = count2 + 1
  }
}

print(count1/L)
print(count2/L)
#Analytical conditional p-value
print((t-x2+1)/(t+1))
