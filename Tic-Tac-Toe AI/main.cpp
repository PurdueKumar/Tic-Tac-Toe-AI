//#include "ai.h"
#include "rando.h"
#include "ai.h"
#include "game.h"
#include "player.h"
#include "human.h"
#include <iostream>
#include <string.h>
#include <fstream>
#include <ctime>


using namespace std;

int main() {

	srand(time(NULL));

	game test;

	rando r1;
	rando r2;
	ai ai1(9,50,9,1);
	ai ai2(9, 50, 9, 2);
	human h1;

	int move1;
	int move2;
	int stat = 0;
	char cont = 'y';
	int count = 0;

	int p1w = 0;
	int p2w = 0;
	int draw = 0;

	int gameMoves1[5];
	int gameMoves2[5];
	int gameGrids1[5][9];
	int gameGrids2[5][9];
	int i1, i2;
	int * grid;
	int * pMoves;
	int wingrid[9];
	int winmove;

	ofstream x;
	ofstream y;
	ofstream wx;
	ofstream wy;

	wx.open("winx.csv");
	wy.open("winy.csv");
	x.open("xdata.csv");
	y.open("ydata.csv");

	while (count < 100) {

		test.newGame();

		i1 = 0;
		i2 = 0;

		while (stat == 0) {

			grid = test.copyGrid();
			pMoves = test.possibleMoves();
			move1 = h1.move(pMoves, grid);
			winmove = move1;
			gameMoves1[i1] = move1;

			for (int i = 0; i < 9; i++) {

				gameGrids1[i1][i] = grid[i];
				wingrid[i] = grid[i];

			}

			i1++;	

			delete pMoves;
			delete grid;

			test.getMoves(move1, 1);

			stat = test.checkStat();

			test.printGrid();

			if (stat != 0) {

				break;

			}


			grid = test.copyGrid();

			pMoves = test.possibleMoves();
			move2 = ai2.move(pMoves, grid);
			winmove = move2;
			test.getMoves(move2, 2);
			gameMoves2[i2] = move2;
			for (int i = 0; i < 9; i++) {
				
				if (grid[i] == 1) {
					gameGrids2[i2][i] = 2;
					wingrid[i] = 2;

				}

				else if (grid[i] == 2) {

					gameGrids2[i2][i] = 1;
					wingrid[i] = 1;
				}

				else {

					gameGrids2[i2][i] = 0;
					wingrid[i] = 0;

				}

					
				
			}

			i2++;
		
			delete pMoves;
			delete grid;

			stat = test.checkStat();

			test.printGrid();
		}

		//test.printGrid();

		switch (stat) {

		case 1:

			cout << "player 1 wins!" << endl;
			p1w++;

			for (int i = 0; i < 9; i++) {

				wx << wingrid[i];

			
				if (winmove != i) {

					wy << 0;

				}

				else {

					wy << 1;

				}

				if (i != 8) {

					wx << ",";
					wy << ",";
				}


			}

			wx << endl;
			wy << endl;

			break;
		case 2:
			cout << "player 2 wins!" << endl;
			p2w++;

			for (int i = 0; i < 9; i++) {

				wx << wingrid[i];


				if (winmove != i) {

					wy << 0;

				}

				else {

					wy << 1;

				}

				if (i != 8) {

					wx << ",";
					wy << ",";
				}


			}

			wx << endl;
			wy << endl;

			break;
		case 3:
			cout << "draw" << endl;
			draw++;
			break;
		}



		//cout << "continue? (y/n)" << endl;
		//std::cin >> cont;
		count++;

		for (int i = 0; i < i1; i++) {

			for (int j = 0; j < 9; j++) {

				x << gameGrids1[i][j];

				if (gameMoves1[i] != j) {

					y << 0;

				}

				else if (stat == 1) {

					y << 1;

				}

				else if (stat == 2) {

					y << -1;

				}

				else {

					y << 0.5;

				}

				if (j != 8) {

					x << ",";
					y << ",";
				}

			}
			x << endl;
			y << endl;

		}

		for (int i = 0; i < i2; i++) {

			for (int j = 0; j < 9; j++) {

				x << gameGrids2[i][j];

				if (gameMoves2[i] != j) {

					y << 0;

				}

				else if (stat == 1) {

					y << -1;

				}

				else if (stat == 2) {

					y << 1;

				}

				else {

					y << 0.5;

				}

				if (j != 8) {

					x << ",";
					y << ",";
				}

			}
			x << endl;
			y << endl;
		}

		stat = 0;

	}

	x.close();
	y.close();
	wx.close();
	wy.close();
	cout << "player1 won: " << p1w << " times" << endl;
	cout << "player2 won: " << p2w << " times" << endl;
	cout << "draw: " << draw << " times" << endl;
	ai1.printr();
	std::system("pause");
}