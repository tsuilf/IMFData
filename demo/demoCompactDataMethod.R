databaseID <- 'IFS'
startdate='2001-01-01'
enddate='2016-12-31'
checkquery = FALSE

IFS.available.codes <- DataStructureMethod('IFS')

## Germany, Norminal GDP in Euros, Norminal GDP in National Currency
queryfilter <- list(CL_FREA="", CL_AREA_IFS="GR", CL_INDICATOR_IFS =c("NGDP_EUR","NGDP_XDC"))
GR.NGDP.query <- CompactDataMethod(databaseID, queryfilter, startdate, enddate, checkquery)
GR.NGDP.query[,1:5]
GR.NGDP.query$Obs[[1]]
GR.NGDP.query$Obs[[2]]

## Quarterly, Germany, Norminal GDP in Euros, Norminal GDP in National Currency
queryfilter <- list(CL_FREA="Q", CL_AREA_IFS="GR", CL_INDICATOR_IFS =c("NGDP_EUR","NGDP_XDC"))
Q.GR.NGDP.query <- CompactDataMethod(databaseID, queryfilter, startdate, enddate, checkquery)
Q.GR.NGDP.query[,1:5]
Q.GR.NGDP.query$Obs[[1]]

## Quarterly, USA
queryfilter <- list(CL_FREA="Q", CL_AREA_IFS="US", CL_INDICATOR_IFS = "")
Q.US.query <- CompactDataMethod(databaseID, queryfilter, startdate, enddate, checkquery)
Q.US.query[,1:5]
CodeSearch(IFS.available.codes, "CL_INDICATOR_IFS", "FITB_3M_PA") # Reverse look up meaning of code

## Quarterly, USA, GDP related
IFS.available.codes <- DataStructureMethod('IFS')
ALLGDPCodeValue <- CodeSearch(IFS.available.codes, "CL_INDICATOR_IFS","GDP")$CodeValue
queryfilter <- list(CL_FREA="Q", CL_AREA_IFS="US", CL_INDICATOR_IFS =ALLGDPCodeValue[1:10]) # Looks like I can have 17 code at once maximum
Q.US.GDP.query <- CompactDataMethod(databaseID, queryfilter, startdate, enddate, checkquery)
Q.US.GDP.query[,1:5]
Q.US.GDP.query$Obs[[1]]
Q.US.GDP.query$Obs[[2]]

## Quarterly, US, NGDP_SA_AR_XDC
queryfilter <- list(CL_FREA="Q", CL_AREA_IFS="US", CL_INDICATOR_IFS ="NGDP_SA_AR_XDC")
Q.US.NGDP.query <- CompactDataMethod(databaseID, queryfilter, startdate, enddate, checkquery)
Q.US.NGDP.query[,1:5]
Q.US.NGDP.query$Obs[[1]]

## Monthly, US, NGDP_SA_AR_XDC
queryfilter <- list(CL_FREA="M", CL_AREA_IFS="", CL_INDICATOR_IFS ="NGDP_SA_AR_XDC")
M.NGDP.query <- CompactDataMethod(databaseID, queryfilter, startdate, enddate, checkquery)
M.NGDP.query$Obs # NULL

## Example for DOT dataset
DOT.available.codes <- DataStructureMethod('DOT')
names(DOT.available.codes)
queryfilter <- list(CL_FREQ = "", CL_AREA_DOT="US", CL_INDICATOR_DOT = "", CL_COUNTERPART_AREA_DOT="")
US.query <- CompactDataMethod('DOT', queryfilter, startdate, enddate, FALSE)
US.query[1:5,1:(length(US.query)-1)]
US.query$Obs[[1]] # Monthly. US. TMG_CIF_USD CH

