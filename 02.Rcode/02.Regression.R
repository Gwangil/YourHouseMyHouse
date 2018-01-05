### ������ : '�ǰŷ��� ���� ������ ����.R'�� X_all �Ǵ� ��ü �����͸� �ҷ��ͼ� ����.
#install.packages("data.table")
#install.packages('stringr')
library(data.table)
library(stringr)

X_all <- fread("E:/00.��������/90.�����ͼ���/01.�ǰŷ���/all.csv")						# �ǰŷ��� ���� �ڵ带 �̿��ؼ� all.csv�� ������� �ҷ���
colnames(X_all) <- c("si","gu","dong","bungi","bungi_main","bungi_sub","complex",
				"area","yearMonth","day","price","floor","constructed","roadName")	# column���� �������� ��ȯ...R���� �ѱ��� ���ڵ���....�̤�
X_all$yearMonth <- as.Date(paste0(X_all$yearMonth,01),"%Y%m%d")						# yyyymm���� ���� �����Ϳ� ���Ƿ� 01(dd)�� �ٿ� DateŸ������ ��ȯ
X_all$si <- as.factor(X_all$si)											# chr(character)������ factor�� ��ȯ : ���� �����ս� �ӵ����(��.. ���ڿ��̶� ����(factor)�� R���� ����ϴ°� ���� �ٸ�...)
X_all$gu <- as.factor(X_all$gu)											# ���ڿ��� �ϳ��ϳ��� �� �ٸ� ���� ��������
X_all$dong <- as.factor(X_all$dong)											# factor�� �ش� ���� ���(levels)�� �ְ�, �ش� ���� �� ����� �� ��° ���� �����°��� �� �� ���� levels(factorTypeData), as.numeric(factorTypeData)������
X_all$bungi <- as.factor(X_all$bungi)
X_all$bungi_main <- as.factor(X_all$bungi_main)
X_all$bungi_sub <- as.factor(X_all$bungi_sub)
X_all$complex <- as.factor(X_all$complex)
X_all$day <- as.factor(str_sub(X_all$day,1,-3))
X_all$roadName <- as.factor(X_all$roadName)

X_all[which.min(X_all$price),]											# which.min�� �ּҰ��� index�� ã����
X_prac <- X_all[-which.min(X_all$price),]										# X.prac�� price�� �ּҰ��� �ִ� index�� �����ϰ� �Ҵ� -- ���߿� ��հ����� ������ �Ѹ��µ�, �̻�ġ�� ��տ� ��������
str(X_prac)

x <- X_prac[,c(2,3,8,9,10,12,13)];	str(x)									# ��ü���� '��, ��, ����, �ŷ����, �ŷ���, ��, ����⵵'�� column�� x�� �Ҵ�
y <- as.matrix(X_prac[,11]);	str(y)										# y�� price �� �Ҵ�

par(mfrow=c(2,1))														# par : �׷��� �׸��� â �����Ҷ� ���� �Լ� �������� �ɼ����� // mfrow : �� �׷��� â�� ��� ��������, ���⼱ 2�� 1��¥���� ����(���Ʒ��� �ϳ��� ���������� �׷���)
boxplot(y,horizontal=T,ylab="origin")										# ������ ������ ��� Ȯ���ϱ� ���� ���ڱ׸��� �׸� // horizontal �ɼ����� ���ڱ׸��� ���η� ������, ylab���� �̸� �ޱ�
boxplot(log(y),horizontal=T,ylab="transform")									# �񱳸� ���� ������ ���� log��ȯ�Ͽ� �׸��׸� : �� �����ʹ� �������� �����Ͱ� ġ��ġ���� �α׺�ȯ �� �����ʹ� ����� ������
hist(scale(y),prob=T,ylim=c(0,0.5))											# ���������� ������ Ȯ���ϱ� ���� ������׷� �׸�, prob �ɼ��� T�ϸ� �е�, F�ϸ� �󵵼��� �׷��� // scale�� ������ ǥ��ȭ�ϴ� �Լ�
lines(density(scale(y)))												# Ȱ��ȭ �Ǿ��ִ� plotâ�� lines�Լ��� ���� �׷���, density�Լ��� �������� ������ �׷���
lines(seq(-3,3,length=1000),dnorm(seq(-3,3,length=1000)),col=2)						# ���Ժ����� ���ϱ����� dnorm �Լ��� ���Ժ����� pdf���� �� ���Ժ������ �׷�����, seq�Լ��� �������� ���⼱ -3���� 3���� �յ������ 1000�� ����
hist(scale(log(y)),prob=T,ylim=c(0,0.5))										# �α׺�ȯ �� �����ͷ� �Ȱ��� �׷���
lines(density(scale(log(y))))
lines(seq(-3,3,length=1000),dnorm(seq(-3,3,length=1000)),col=2)
y <- log(y)															# ������ �����ͺ��� �α׺�ȯ�� �� �����Ͱ� ���Ժ����� �� ��������Ƿ� �α׺�ȯ���� ����ؼ� �����ǽ�
																# ȸ�ͺм� �Ҷ� ���Ժ����� �����ٴ� ������ �ʿ��ϹǷ� �����͸� ���Ժ����� ����ϰ� ��ȯ�����ִ� ����� ���� ��찡 ����
																# ��ȯ�����ͷ� ���� �� �������� �ٽ� ����ȯ �ؼ� �ؼ��ϴ°� �ʿ�, ���� �����Ͱ� ���������� ġ��ġ�� n������ȯ ����

set.seed(01094844224)													# �����ѹ� �õ弳��
gr <- sample(rep(seq(10),length=length(y)))									# 1~10�� y�� ����ŭ �ݺ�������, sample�� ���� �������� �Ѹ� ���� �ش� ����ġ�� ���� �׷����� �ϱ�����

result <- matrix(NA,10,2)												# NA�� �̷���� 10x2��� ���� : ����� �����ϱ�����, 10���� �׷츸ŭ �ݺ�, �� 2�� �����

for ( i in 1:10) {													# 10-folds Cross Validation�� �ϱ����� 1~10�׷츸ŭ for�� �ݺ�
	x.te <- subset(x,gr==i); x.tr <- subset(x,gr!=i)							# subset�Լ��� �����͸� ���, i��° �׷��� test Set, �������� training Set
	y.te <- subset(y,gr==i); y.tr <- subset(y,gr!=i)

	model <- lm(y.tr~., data=x.tr)										# lm�Լ��� ���߼���ȸ�͸��� ����, '��������~��������1+��������2+...' ó�� formula�������� ��������, ���������� .�� ���� ��� �������� �� ���
	#summary(model)													# summary(����) �ϸ� ���������� �������� ���� Ȯ�ΰ���
	
	pred <- predict(model,x.te)											# predict(����, ������)�Լ��� ���յ� ������ test Set�� �����Ͽ� ������ ���
	result[i,1] <- sqrt(mean((y.te-pred)^2))									# RMSE ��� : ������ ������ ��� �� �ϳ�, ������ �󸶳� ������
	result[i,2] <- exp(y.te[which.max(y.te-pred)])-exp(pred[which.max(y.te-pred)])		# exp�Լ��� �α׺�ȯ�߶� ����ȯ, ���������� ���� ū ������ ���� ���ݰ� ���������� ���̸� ���� ��
}

apply(result,2,mean)													# apply(������,����,�����Լ�)�� result����� column ��� ����, �ι�° �μ��� 1�� �����, 2�� ������
mean(result[,2])														# ������ �ݺ����� ����ũ�� �������ݰ� ���������� ���̰� ���͵��� ���