## From: Krishna Kumar <kriskumar@earthlink.net>
## To: lorenzo.isella@gmail.com
## Cc: r-sig-finance@stat.math.ethz.ch
## Subject: Re: [R-sig-finance] Distribution Fitting and fitdistr()
## Date: Mon, 24 Apr 2006 23:09:09 -0400

##    ...............
##    ...............

## The package nor1Mix has density , distribution and rng for mixtures but
## no fitting so here is a  fitting function..

mydistr<-function(x,mu,sig,wt)
{
sum(wt*dnorm(x,mu,sig))
}

mydistrmle<-function(x, y = x) {

#mu goes from x1:3 sig goes x 4:6 and wt goes x 7:9
        f = -sum(log(mydistr(y, c(x[1],x[2],x[3]),
c(x[4],x[5],x[6]),     c(x[7],x[8],x[9])  )))
        cat("\n Function value:  ", -f)
        cat("\n  Estimated parameters:       ",
c(x[1],x[2],x[3]),c(x[4],x[5],x[6]),c(x[7],x[8],x[9]), "\n")

        f
    }



#generate 1000 samples from norMix  mixture MW.nm2
x<-rnorMix(1000,MW.nm2)
hist(rnorMix(1000,MW.nm2))
#  Give it a starting values
mu<-c(-0.2,0.4,0.9)
sigma<-c(0.2, 0.2, 0.6)
wt<-c(0.3,0.3,0.2)
r<-optim(c(mu,sigma,wt),mydistrmle,control=list(maxit=50000))
print(matrix(r$par,3,3))
print(MW.nm2)

## You will have to add additional constraints on the "wt" etc.  ( see
## ?constrOptim)

## Further I don't think there is a guaranteed unique decomposition of
## variance between the three gaussians. Just try different starting values
## and also is there a reason to stop at 3 gaussians ?..

## Krishna

## _______________________________________________
## R-sig-finance@stat.math.ethz.ch mailing list
## https://stat.ethz.ch/mailman/listinfo/r-sig-finance

