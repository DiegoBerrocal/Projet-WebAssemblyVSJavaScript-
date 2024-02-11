#comptage_occurences makefiles
cpp/comptage_occurences.js : cpp/comptage_occurences.cpp
	cd cpp && emcc comptage_occurences.cpp -s WASM=1 -o comptage_occurences.js -O3 -s ALLOW_MEMORY_GROWTH=1

cpp/comptage_occurences.exe: cpp/comptage_occurences.cpp
	cd cpp && g++ -O3 -o comptage_occurences.exe comptage_occurences.cpp

comptage_occurences_test:	cpp/comptage_occurences.js js/comptage_occurences.js cpp/comptage_occurences.exe 
	dir cpp\comptage_occurences.exe cpp\comptage_occurences.js cpp\comptage_occurences.wasm js\comptage_occurences.js
	node js\comptage_occurences.js
	node cpp\comptage_occurences.js
	@echo "Temps d'execution pour le fichier WebAssembly (WASM):"
	powershell -Command "Measure-Command {node cpp\comptage_occurences.js}"
	@echo "Temps d'execution pour le fichier JavaScript (JS):"
	powershell -Command "Measure-Command {node js\comptage_occurences.js}"

#comparaison_somme makefiles
cpp/comparaison_somme.js : cpp/comparaison_somme.cpp
	cd cpp && emcc comparaison_somme.cpp -s WASM=1 -o comparaison_somme.js -O3 -s ALLOW_MEMORY_GROWTH=1

cpp/comparaison_somme.exe: cpp/comparaison_somme.cpp
	cd cpp && g++ -O3 -o comparaison_somme.exe comparaison_somme.cpp

comparaison_somme_test: cpp/comparaison_somme.js js/comparaison_somme.js cpp/comparaison_somme.exe 
	dir cpp\comparaison_somme.exe cpp\comparaison_somme.js cpp\comparaison_somme.wasm js\comparaison_somme.js
	node js\comparaison_somme.js
	node cpp\comparaison_somme.js
	@echo "Temps d'execution pour le fichier WebAssembly (WASM):"
	powershell -Command "Measure-Command {node cpp\comparaison_somme.js}"
	@echo "Temps d'execution pour le fichier JavaScript (JS):"
	powershell -Command "Measure-Command {node js\comparaison_somme.js}"

#cubes_parfaits makefiles
cpp/cubes_parfaits.js : cpp/cubes_parfaits.js
	cd cpp && emcc cubes_parfaits.cpp -s WASM=1 -o cubes_parfaits.js -O3 -s ALLOW_MEMORY_GROWTH=1

cpp/cubes_parfaits.exe: cpp/cubes_parfaits.cpp
	cd cpp && g++ -O3 -o cubes_parfaits.exe cubes_parfaits.cpp

cubes_parfaits_test: cpp/cubes_parfaits.js js/cubes_parfaits.js cpp/cubes_parfaits.exe 
	dir cpp\cubes_parfaits.exe cpp\cubes_parfaits.js cpp\cubes_parfaits.wasm js\cubes_parfaits.js
	node js\cubes_parfaits.js
	node cpp\cubes_parfaits.js
	@echo "Temps d'execution pour le fichier WebAssembly (WASM):"
	powershell -Command "Measure-Command {node cpp\cubes_parfaits.js}"
	@echo "Temps d'execution pour le fichier JavaScript (JS):"
	powershell -Command "Measure-Command {node js\cubes_parfaits.js}"

clean:
	del /f	cpp\comptage_occurences.js cpp\comptage_occurences.wasm cpp\comptage_occurences.exe
	del /f cpp\comparaison_somme.js cpp\comparaison_somme.wasm cpp\comparaison_somme.exe
	del /f cpp\cubes_parfaits.js cpp\cubes_parfaits.wasm cpp\cubes_parfaits.exe