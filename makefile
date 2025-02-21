P=Main
MAIN_CLASS=principal.$(P)
SRC_DIR=./src
OUT_DIR=./bin
LIB_DIR=./lib
DOC_DIR=html
JAR_FILE = $(P).jar

compilar:limpiar
	mkdir $(OUT_DIR)
	find $(SRC_DIR) -name *.java | xargs javac -cp $(OUT_DIR):$(LIB_DIR) -d $(OUT_DIR)

jar:compilar
	@echo "Manifest-Version: 1.0" > manifest.txt
	@echo "Main-Class: $(MAIN_CLASS)" >> manifest.txt
	@echo "Class-Path: ." >> manifest.txt
	@echo "" >> manifest.txt
	jar cvfm $(JAR_FILE) manifest.txt  -C  $(OUT_DIR) .
	rm -f manifest.txt
ejecutar:compilar
	java -cp $(OUT_DIR) $(MAIN_CLASS)
limpiar:
	rm -rf bin

javadoc:
	find . -type f -name "*.java" | xargs javadoc -d $(DOC_DIR) -encoding utf-8 -docencoding utf-8 -charset utf-8
debug: compilar
	find $(SRC_DIR) -name *.java | xargs javac -g -cp $(OUT_DIR):$(LIB_DIR) -d $(OUT_DIR)
	cd bin; jdb -sourcepath ../src
runjar: jar
	@echo "Manifest-Version: 1.0" > manifest.txt
	@echo "src.principal.Main-Class:" $(MAIN_CLASS) >> manifest.txt
	@echo "Class-Path: . ">> manifest.txt
	@echo "" >> manifest.txt
	java -jar $(JAR_FILE)