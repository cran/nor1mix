## no S4 methodology here; speedup :
.noGenerics <- TRUE

## for R versions < 1.7:
if(paste(R.version$major, R.version$minor, sep=".") < 1.7) {

    ## This is based on rmultz2() from S-news by Alan Zaslavsky & Scott Chasalow
    ## see also /usr/local/app/R/R_local/src/combinat/R/rmultz2.R
    ## Arg.names like  rbinom();  returns  n x p matrix
    rmultinom <- function(n, size, prob) {
        K <- length(prob) # #{classes}
        matrix(tabulate(sample(K, n * size, repl = TRUE, prob) + K * 0:(n - 1),
                        nbins = n * K),
               nrow = n, ncol = K, byrow = TRUE)
    }

}# versions < 1.7
