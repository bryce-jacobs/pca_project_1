#1

movies <- read.csv('ml-100k/u.item', header = FALSE, sep= '|')
View(movies)
ratings <- read.table("ml-100k/u.data")
View(ratings)

#2
genre <- read.csv('ml-100k/u.genre', header = FALSE, sep= '|')
View(genre)

#3
singles <- movies[, c(1, 6:24)]

#4
names(ratings) [2] <- "movieID"
View(ratings)
names(singles) [1] <- "movieID"
View(singles)
all <- merge(ratings, singles, by ="movieID", all = TRUE)

#5
movies <- read.csv('ml-100k/u.item', header = FALSE, sep= '|')

names(movies) [1] <- "movieID"
names(movies) [2] <- "movieTitle"
names(movies) [3] <- "releaseDate"
names(movies) [4] <- "videoReleaseDate"
names(movies) [5] <- "IMDBurl"
names(movies) [7] <- "Action"
names(movies) [11] <- "Comedy"
names(movies) [17] <- "Horror"
names(movies) [20] <- "Romance"
    
ratings <- read.table("ml-100k/u.data")
names(ratings)[1] <- "userID"
names(ratings)[2] <- "movieID"
names(ratings)[3] <- "rating"
names(ratings)[4] <- "timeStamp"

genre <- read.csv('ml-100k/u.genre', header = FALSE, sep= '|')
singles <- movies[, c(1, 6:24)]

all <- merge(ratings, singles, by ="movieID", all = TRUE)
View(all)

Comedy <- table(all$rating[all$Comedy ==1])
Action <- table(all$rating[all$Action ==1])
total <- rbind(Action, Comedy)
Horror <- table(all$rating[all$Horror ==1])
total <- rbind(total, Horror)
Romance <- table(all$rating[all$Romance ==1])
total <- rbind(total, Romance)

print(total)