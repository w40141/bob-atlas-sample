-- Create "test" table
CREATE TABLE `test` (`id` int NOT NULL, `name` varchar(255) NULL) CHARSET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
-- Create "test2" table
CREATE TABLE `test2` (`id` int NOT NULL, `name` varchar(255) NULL) CHARSET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
-- Create "users" table
CREATE TABLE `users` (`id` int NOT NULL AUTO_INCREMENT, `name` varchar(255) NOT NULL, `email` varchar(255) NOT NULL, PRIMARY KEY (`id`), UNIQUE INDEX `email` (`email`)) CHARSET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
-- Create "user_logs" table
CREATE TABLE `user_logs` (`id` int NOT NULL, `user_id` int NOT NULL, `body` text NOT NULL, PRIMARY KEY (`id`), INDEX `user_fk` (`user_id`), CONSTRAINT `user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION) CHARSET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
