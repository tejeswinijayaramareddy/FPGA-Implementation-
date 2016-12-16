Game environment can be beneficial in enhancing the learning experience for children. Based on Csikszentmihalyi’s Flow Theory, psychologists and researchers have identified that being in the state of flow, a mental state in which a person performing an activity is fully immersed and focused in the activity, support the learning process as well as create a positive experience for the learners [Paras, 1]. This is quite significant for games for it fosters play, which produces a state of flow, thus increases motivation and improves the learning experience [Jeanne 2]. In this project, the goal is to build game module utilizing the DE2-115 board assembly and its peripherals, such as the push buttons, the slide switches, the 7-segment displays, and the LCD module. 


Word Guessing Game 

The objective is to build a word guessing game. This game is proposed to have a player login at the beginning, and the player can play with either the child mode or the difficult mode. The game is scalable in the sense the player can pick total number of rounds to play. When game starts, the system randomly selects a word from the word bank and displays it on the 7-segment displays with one of the vowel letters missing, and the player has to guess the correct missing vowel letter within the time limit to score. The child mode has time limit of 30 seconds, while the difficult level only has 10 seconds. The random selection is achieved using a 15-bits LFSR counter at free-running mode. Only the lower 5 bits are used for pseudo-randomness. To enter the vowel letter, the player presses on a push button to 
2 
toggle through A, E, I, O, U. The player will be able to check his or her score by turning on a slide switch, at which the game is also paused. 

Utilization of the Peripheral on the DE2 board
1. Seven-Segment Displays 
          a. HEX0 - HEX3: Displays will be used for displaying the letters to the player 
          b. HEX4 - Displays login pass/fail 
          c. HEX5:  Displays the vowel letter selection 
          d. HEX7 - HEX6: Displays the time remaining and the player score 

2. Button 
        a. KEY0: Reset 
        b. KEY1: Submit answer 
        c. KEY2: Login  
        d. KEY3: Toggle answer input: A, E, I, O, U, one at a time 

3. Slide Switches 
        a. SW0 - SW3 to enter login account number and password 
        b. SW10 – SW15 to set number of rounds to play 
        c. SW16 sets difficulty level 
        d. SW17 sets display to show either score or the count down time remaining 
     
4. LFSR 
        a. Count-down timer 
        b. Random Word Selector 
        
5. ROM 
        a. ROM stores the login and password 
        b. ROM stores the word bank 
        
6. RAM 
        a. RAM stores the player scores 
        
7. High Level State Machine 
        a. HLSM will be used to implement the main controller 
