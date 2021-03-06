source("settings.R")



############Interactions INI ##########################



int = 3
#interactions with 1 R R
Int <- matrix(rnorm(n*int),ncol=(int))
for(i in 1:(n*(int))){ if(sample(1:100,1) > 97){Int[i]=0/0} }

for(i in 1:n){ Int[i]=1}

colnames(Int) <- paste0("int",1:int)
rownames(Int) <- paste0("ind",1:n)
Int_db <- matrix2databel(Int,filename="INT1RR",type="FLOAT")

######################
int = 3
#interactions with 0 1 R
Int <- matrix(rnorm(n*int),ncol=(int))
for(i in 1:(n*(int))){ if(sample(1:100,1) > 97){Int[i]=0/0} }

for(i in 1:n){ Int[i]=0}
for(i in (n+1):(n*2)){ Int[i]=1}

colnames(Int) <- paste0("int",1:int)
rownames(Int) <- paste0("ind",1:n)
Int_db <- matrix2databel(Int,filename="INT01R",type="FLOAT")

######################
#interactions with 01 1
int = 3
Int <- matrix(rnorm(n*int),ncol=(int))
for(i in 1:(n*(int))){ if(sample(1:100,1) > 97){Int[i]=0/0} }

for(i in 1:n){ Int[i]=0}
for(i in (n+1):(n*2)){ Int[i]=1}
for(i in (n+2):(n*3)){ Int[i]=1}

colnames(Int) <- paste0("int",1:int)
rownames(Int) <- paste0("ind",1:n)
Int_db <- matrix2databel(Int,filename="INT011",type="FLOAT")

######################
#interactions with 1 1
int = 2
Int <- matrix(rnorm(n*int),ncol=(int))
for(i in 1:(n*(int))){ if(sample(1:100,1) > 97){Int[i]=0/0} }

for(i in 1:n){ Int[i]=1}
for(i in (n+1):(n*2)){ Int[i]=1}

colnames(Int) <- paste0("int",1:int)
rownames(Int) <- paste0("ind",1:n)
Int_db <- matrix2databel(Int,filename="INT11",type="FLOAT")

######################
#interactions with 0 1
int = 2
Int <- matrix(rnorm(n*int),ncol=(int))
for(i in 1:(n*(int))){ if(sample(1:100,1) > 97){Int[i]=0/0} }

for(i in 1:n){ Int[i]=0}
for(i in (n+1):(n*2)){ Int[i]=1}

colnames(Int) <- paste0("int",1:int)
rownames(Int) <- paste0("ind",1:n)
Int_db <- matrix2databel(Int,filename="INT01",type="FLOAT")

######################
#interactions with 1 0
int = 2
Int <- matrix(rnorm(n*int),ncol=(int))
for(i in 1:(n*(int))){ if(sample(1:100,1) > 97){Int[i]=0/0} }

for(i in 1:n){ Int[i]=1}
for(i in (n+1):(n*2)){ Int[i]=0}

colnames(Int) <- paste0("int",1:int)
rownames(Int) <- paste0("ind",1:n)
Int_db <- matrix2databel(Int,filename="INT10",type="FLOAT")

######################
#interactions with 1
int = 1
Int <- matrix(rnorm(n*int),ncol=(int))

for(i in 1:n){ Int[i]=1}

colnames(Int) <- paste0("int",1:int)
rownames(Int) <- paste0("ind",1:n)
Int_db <- matrix2databel(Int,filename="INT1",type="FLOAT")

######################
#interactions with 0
int = 1
Int <- matrix(rnorm(n*int),ncol=(int))

for(i in 1:n){ Int[i]=0}

colnames(Int) <- paste0("int",1:int)
rownames(Int) <- paste0("ind",1:n)
Int_db <- matrix2databel(Int,filename="INT0",type="FLOAT")

######################
#interactions with R0
int = 2
Int <- matrix(rnorm(n*int),ncol=(int))

for(i in (n+1):(n*2)){ Int[i]=0}

colnames(Int) <- paste0("int",1:int)
rownames(Int) <- paste0("ind",1:n)
Int_db <- matrix2databel(Int,filename="INTR0",type="FLOAT")

######################
#interactions with R1
int = 2
Int <- matrix(rnorm(n*int),ncol=(int))

for(i in (n+1):(n*2)){ Int[i]=1}

colnames(Int) <- paste0("int",1:int)
rownames(Int) <- paste0("ind",1:n)
Int_db <- matrix2databel(Int,filename="INTR1",type="FLOAT")


######################
#interactions with RR
int = 2
Int <- matrix(rnorm(n*int),ncol=(int))


colnames(Int) <- paste0("int",1:int)
rownames(Int) <- paste0("ind",1:n)
Int_db <- matrix2databel(Int,filename="INTRR",type="FLOAT")

######################
#interactions with R
int = 1
Int <- matrix(rnorm(n*int),ncol=(int))


colnames(Int) <- paste0("int",1:int)
rownames(Int) <- paste0("ind",1:n)
Int_db <- matrix2databel(Int,filename="INTR",type="FLOAT")

############Interactions END ##########################

#r=2
XR <- matrix(rnorm(m*n),ncol=m)

for(i in 1 + r*(0:((m-2)/r)) )
{
	#print(i)
	yIdx=ceiling(i/r)
	#print(i)
	#print(yIdx)
	for(j in 1:n)
	{
		XR[j,i]=1/2*Y[j,yIdx]
		for(k in 1:l)
		{
			XR[j,i]=XR[j,i]-XL[j,k]*0.01
		}
		for(k in 1:(r-2))
		{
			XR[j,i]=XR[j,i]-XR[j,i+k]*0
		}
		#XR[j,i]=XR[j,i]/2.8888
		#XR[j,i] = XR[j,i]*runif(1, 1.0-var, 1.0)

	}
}

for(i in 1:(n*m)){ if(sample(1:100,1) > 85) XR[i]=0/0}

colnames(XR) <- paste("miss",1:m,sep="")
for(i in 1:(m/r)){for(j in 1:r) {colnames(XR)[(i-1)*r+(j)] = paste0("snp",paste(i,j,sep="_")) }}


rownames(XR) <- paste("ind",1:n,sep="")
XR_db <- matrix2databel(XR,filename="XRint01",type="FLOAT")
