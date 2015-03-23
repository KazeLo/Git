# Author : A40021 KazeLo
# using setpoint-current count error rate 

MFC_setpoint_path <- "D:/LED/WorkingSpace/TS1/TS1_data/CSV/24.MFC_group_MO1/"
MFC_setpoint_list <- list.files(path=MFC_setpoint_path , pattern="*setpoint")

dataset <- length(MFC_setpoint_list)

MFC_setpoint_data <- data.frame()
length_event <- c()
length_list <- c()

for (i in 1:dataset){ #import TMAL data

    MFC_setpoint_data<-read.csv(paste(MFC_setpoint_path,MFC_setpoint_list[i],sep=""))    
    data_length<-nrow(MFC_setpoint_data) #count data length   
    
    length_list <- c(length_list,data_length)
    if(data_length<600){
        length_event <- c(length_event,1) #串接向量        
    }else{
        length_event <- c(length_event,0)
    }
    print(MFC_setpoint_list[i])
}

write.csv(length_list,"event_VL04_result.csv")
write.csv(length_event,"event_VL04.csv")
