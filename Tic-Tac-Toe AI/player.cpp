#include "player.h"

using namespace std;

void player::printMoves(int * pMoves) {

	cout << "Possible Moves: ";

	for (int i = 1; i <= pMoves[0]; i++) {

		cout << pMoves[i] << ", ";

	}

	cout << endl;

}