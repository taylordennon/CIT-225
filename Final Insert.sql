-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`gym`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gym` (
  `gym_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`gym_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`instructor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`instructor` (
  `instructor_id` INT NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(10) NOT NULL,
  `gym_id` INT NOT NULL,
  PRIMARY KEY (`instructor_id`),
  INDEX `fk_instructor_gym_idx` (`gym_id` ASC) VISIBLE,
  CONSTRAINT `fk_instructor_gym`
    FOREIGN KEY (`gym_id`)
    REFERENCES `mydb`.`gym` (`gym_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`membership`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`membership` (
  `membership_id` INT NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `duration` VARCHAR(45) NOT NULL,
  `price` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`membership_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`members`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`members` (
  `member_id` INT NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(10) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `join_date` DATE NOT NULL,
  `membership_id` INT NOT NULL,
  PRIMARY KEY (`member_id`),
  INDEX `fk_members_membership1_idx` (`membership_id` ASC) VISIBLE,
  CONSTRAINT `fk_members_membership1`
    FOREIGN KEY (`membership_id`)
    REFERENCES `mydb`.`membership` (`membership_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`gym_has_membership`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gym_has_membership` (
  `gym_id` INT NOT NULL,
  `membership_id` INT NOT NULL,
  INDEX `fk_gym_has_membership_membership1_idx` (`membership_id` ASC) VISIBLE,
  INDEX `fk_gym_has_membership_gym1_idx` (`gym_id` ASC) VISIBLE,
  CONSTRAINT `fk_gym_has_membership_gym1`
    FOREIGN KEY (`gym_id`)
    REFERENCES `mydb`.`gym` (`gym_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gym_has_membership_membership1`
    FOREIGN KEY (`membership_id`)
    REFERENCES `mydb`.`membership` (`membership_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`workout_plans`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`workout_plans` (
  `workout_plans_id` INT NOT NULL AUTO_INCREMENT,
  `workout_type` VARCHAR(45) NOT NULL,
  `description` VARCHAR(500) NOT NULL,
  `duration` INT NOT NULL,
  PRIMARY KEY (`workout_plans_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`members_has_workout_plans`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`members_has_workout_plans` (
  `member_id` INT NOT NULL,
  `workout_plans_id` INT NOT NULL,
  INDEX `fk_members_has_workout_plans_workout_plans1_idx` (`workout_plans_id` ASC) VISIBLE,
  INDEX `fk_members_has_workout_plans_members1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_members_has_workout_plans_members1`
    FOREIGN KEY (`member_id`)
    REFERENCES `mydb`.`members` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_members_has_workout_plans_workout_plans1`
    FOREIGN KEY (`workout_plans_id`)
    REFERENCES `mydb`.`workout_plans` (`workout_plans_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`instructor_has_workout_plans`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`instructor_has_workout_plans` (
  `instructor_id` INT NOT NULL,
  `workout_plans_id` INT NOT NULL,
  INDEX `fk_instructor_has_workout_plans_workout_plans1_idx` (`workout_plans_id` ASC) VISIBLE,
  INDEX `fk_instructor_has_workout_plans_instructor1_idx` (`instructor_id` ASC) VISIBLE,
  CONSTRAINT `fk_instructor_has_workout_plans_instructor1`
    FOREIGN KEY (`instructor_id`)
    REFERENCES `mydb`.`instructor` (`instructor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_instructor_has_workout_plans_workout_plans1`
    FOREIGN KEY (`workout_plans_id`)
    REFERENCES `mydb`.`workout_plans` (`workout_plans_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

use mydb;

insert into gym (name, address, phone_number)
values ('Golds Gym', '123 E 5th W', '8123784191'),
('Golds Gym', '4567 Washington St', '1234567890');

insert into membership (type, duration, price)
values ('Gold', 12, 200),
('Silver', 12, 150),
('Bronze', 12, 100);

insert into members (fname, lname, phone_number, email, gender, join_date, membership_id)
values ('Taylor', 'Spurling', '8123711447', 'taylorspurling@gmail.com', 'm', '1998-09-07', 1),
('Brooke', 'Spurling', '6573829186', 'brookespurling@gmail.com', 'f', '1998-02-14', 2),
('Bob', 'Fisher', '8763459201', 'bobfisher@gmail.com', 'm', '1965-10-11', 3);

insert into gym_has_membership (gym_id, membership_id)
values (1,1),
(1,2),
(1,3),
(2,1),
(2,2),
(2,3);

insert into instructor (fname, lname, phone_number, gym_id)
values ('Jessica', 'Johnson', '7648901294', 1),
('Beck', 'Brown', '1284923049', 1),
('Rhett', 'Reynolds', '4582934726', 2),
('Gus', 'Smith', '5361783958', 2);

insert into workout_plans (workout_type, description, duration)
values ('cardio', 'run 3 miles, 3x15 birbies', 45),
('legs', '3x12 squats', 30),
('arms', '3x10 bench press', 30);

insert into members_has_workout_plans (member_id, workout_plans_id)
values (1,3), (2,1), (3,2);

insert into instructor_has_workout_plans (instructor_id, workout_plans_id)
values (1,1), (1,3), (2,1), (2,2), (3,1), (3,2), (3,3), (4,1);


select * from gym_has_membership;

select * from gym;