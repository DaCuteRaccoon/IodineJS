if [ "`md5sum IodineJS/*`" != "`cat sums`" ]; then
	cd IodineJS

	clang++-7 -std=c++17 -c api.cpp -o api.so

	clang++-7 -std=c++17 main.cpp api.so -o ../main

	cd ..
fi

./main

rm sums

md5sum IodineJS/* >> sums
