library(datasets);library(ggplot2);library(dplyr);library(tidyr);library(GGally)
dt<-select(mtcars,-qsec) ##removing irrelevant column
dt<-mutate(dt,cyl=factor(cyl),am=factor(am),vs=factor(vs)) ##adjusting column type

cor(select(dt,-c(cyl,am))) ##getting correlation matrix for only numeric columns.



g<-ggplot(data=mtcars,aes(y=mpg,x=as.factor(am),fill=as.factor(am)))
g<-g+geom_violin()
g<-g+facet_grid(.~cyl) # having cyl as column
g<-g+xlab("Transmission type") ##labeling x axis
g<-g+ylab("Miles/(US) gallon") ## labeling y axis
g<-g+ggtitle("Comparison of Miles/galon for diffrenct cars\nbased on transmission type and number of cylinders")
g<-g+scale_x_discrete(breaks=c(0,1),labels=c("Automaitc","Manaul"))
g<-g+scale_fill_discrete(name="Transmission type",breaks=c(0,1),labels=c("Automaitc","Manaul")) ## setting correct names for legens.
g

mpg ~ am + hp + wt + qsec

fig2<-ggplot(data=dt,aes(y=mpg,x=am,fill=am))+geom_violin()+xlab("Transmission type")+ylab("Miles/(US) gallon")+ggtitle("Fig.2:Comparison of mileages per gallon and transmission types")
fig2<-fig2+scale_x_discrete(breaks=c(0,1),labels=c("Automaitc","Manaul"))+guides(fill=FALSE)
fig3<-ggplot(data=dt,aes(y=mpg,x=hp,color=am))+geom_point(alpha=.3)+geom_smooth(alpha=.2,size=1,method="lm")+xlab("Horspower")+ylab("Miles/(US) gallon")+ggtitle("Fig.3:Comparison of mileages per gallon and horsepower\n for each transmission types")+scale_color_discrete(name="Trans.",breaks=c(0,1),labels=c("Auto.","Manaul"))
fig4<-ggplot(data=dt,aes(y=mpg,x=wt,color=am))+geom_point(alpha=.3)+geom_smooth(alpha=.2,size=1,method="lm")+xlab("Weigth (kib)")+ylab("Miles/(US) gallon")+ggtitle("Fig.4:Comparison of mileages per gallon and weigth\n for each transmission types")+scale_color_discrete(name="Trans.",breaks=c(0,1),labels=c("Auto.","Manaul"))
fig5<-ggplot(data=dt,aes(y=mpg,x=qsec,color=am))+geom_point(alpha=.3)+geom_smooth(alpha=.2,size=1,method="lm")+xlab("1/4 mile time (seconds)")+ylab("Miles/(US) gallon")+ggtitle("Fig.4:Comparison of mileages per gallon and 1/4 mile time \n for each transmission types")+scale_color_discrete(name="Trans.",breaks=c(0,1),labels=c("Auto.","Manaul"))
multiplot(fig2,fig4,fig3,fig5,cols=2)

=============
        
        
g<-ggplot(data=dt,aes(x=hp,y=mpg,colour=am))
g<-g+geom_point(size=6,colour="black")+geom_point(size=4)
g<-g+xlab("Horsepower")+ylab("Miles per gallon")+ggtitle("Plot of mpg vs hp \ncolor coded by transmission")
g<-g+scale_x_discrete(breaks=c(0,1),labels=c("Automaitc","Manaul"))
g<-g+scale_fill_discrete(name="Transmission type",breaks=c(0,1),labels=c("Automaitc","Manaul"))
