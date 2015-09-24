library(datasets);library(ggplot2);library(dplyr);library(tidyr);library(GGally)
dt<-select(mtcars,-qsec) ##removing irrelevant column
dt<-mutate(dt,cyl=factor(cyl),am=factor(am),vs=factor(vs)) ##adjusting column type

cor(select(dt,-c(cyl,am))) ##getting correlation matrix for only numeric columns.



g<-ggplot(data=mtcars,aes(y=mpg,x=as.factor(am),fill=as.factor(am)))
g<-g+geom_violin()
##g<-g+facet_grid(.~cyl) # having cyl as column
g<-g+xlab("Transmission type") ##labeling x axis
g<-g+ylab("Miles/(US) gallon") ## labeling y axis
g<-g+ggtitle("Comparison of Miles/galon for diffrenct cars\nbased on transmission type and number of cylinders")
g<-g+scale_x_discrete(breaks=c(0,1),labels=c("Automaitc","Manaul"))
g<-g+scale_fill_discrete(name="Transmission type",breaks=c(0,1),labels=c("Automaitc","Manaul")) ## setting correct names for legens.
g

=============
        
        
g<-ggplot(data=dt,aes(x=hp,y=mpg,colour=am))
g<-g+geom_point(size=6,colour="black")+geom_point(size=4)
g<-g+xlab("Horsepower")+ylab("Miles per gallon")+ggtitle("Plot of mpg vs hp \ncolor coded by transmission")
g<-g+scale_x_discrete(breaks=c(0,1),labels=c("Automaitc","Manaul"))
g<-g+scale_fill_discrete(name="Transmission type",breaks=c(0,1),labels=c("Automaitc","Manaul"))
