# APCSFinalProject
Link to Document: https://docs.google.com/document/d/1bxJpWQPdoD__LaG-hNE4-uMIQQZWE-ane4298DZbVOA/edit?usp=sharing

Group Name: GMs of CS

Group Member Names: Adam Avnet and Justin Zou

Brief Description: This will be a recreation of the classic board game, chess. It will have all of the pieces and the board. There will be complete functionality for two players to play a game. Players will click on a piece and then on the square they want to move it to. Illegal moves will not be allowed. The program will recognize check, checkmate, and drawn positions.


Development Log:

Justin 5/25/2021:
Worked on displaying the board, displaying all the pieces and finding the sprites

Adam 5/25/21:
Worked on building the basics of the board and piece classes. Created the shapes/colors for the board

Adam 5/26/21:
Cleaned up unnecessary code. Added the concept of generic pieces to symbolize empty squares. Set up availableSquares method for pawns. Started on the general availableSquares method which will be the basis of movement

Justin 5/26/2021:
Worked a bit on trying to figure out movement and how it would work

Adam 5/27/21:
Figured out how to select pieces and define eligible squares. Created basic movement mechanism. Designed the basic pawn movement (no promotion or en passant) and the rook movement.

Justin 5/27/2021:
Worked with Adam on movement code. Did the bishop and some basic knight movement. Both are still works in progress.

Adam 5/28/21:
Finished basic movement for all of the pieces.

Justin 5/28/2021
Fixed up castling, worked on a color indicator for turns, and worked a bit on checked.

Adam 5/29/21:
Made it so you can't move when your king is in check and you can't put your king into check.

Justin 5/29/2021:
Made it so the pawn can choose what to promote to as well as trying to find a fix for the castle and check.

Justin 5/30/2021:
Spent a long time working on castling into check;started a bit on checkmate.

Justin 5/31/2021:
Worked on EnPassant and changed the UML diagram for the new updated version.

Adam 6/1/21:
Integrated castling and checks so you cannot castle into check. Started doing checkmate.

Justin 6/1/2021:
Made a button to reset the game and fixed promotion issues with check.

Adam 6/2/21:
I mostly fixed the checkmate function. Checkmate now works but it messes up castling by not allowing you to castle if your king was ever in check.

Justin 6/2/2021:
I worked on the Scirpt for the presentation. Made buttons and promotion more presentable and started work on dead pieces on the side as a nice feature to have.

Adam 6/3/21
I worked on checkmate and it seems to always work now. I changed the way promotion worked so it would be more intuitive for users and cannot be broken by bad user action. I implemented en passant. I added notation coordinates to the sides of the board.

Justin 6/3/21
I worked on displaying dead pieces on the side of the board, updated the UML, and tested the game.

Justin 6/4/2021
I finished having numbers displayed next to the pawns while working with Adam.

Adam 6/5/21:
I closed a loophole in checkmate where it sometimes wouldn't be triggered. I cleaned up displaying dead pieces for white. I added stalemate to the game.

Justin 6/5/2021
I finish position of dead pieces for black and added a small timer that only shows the time.

Adam 6/6/21:
I made the positioning of the dead pieces nicer

Justin 6/6/2021
Made timer look better and started a bit of work on showing moves when you select a piece

Justin 6/7/2021
Made it so you can see all the available squares when selecting a piece.

Adam 6/7/21
Made an outline for the presentaion. Finished making possible moves available. Fixed a small bug in en passant.
