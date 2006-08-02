## These are defined as norMix() calls in  ../R/zMarrWand-dens.R
library("nor1mix")

ii <- c(32, 39, 40, 40, 48, 48, 49, 56, 57, 58, 65)
pp <- 0.486 + ii / 100000

e <- norMix(mu = c(-0.825,0.275), sig2 = c(0.773,0.773), w = c(1, 3)/4)
qnorMix(e, pp)
## failed for version <= 1.0-5
