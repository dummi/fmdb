PROJECTNAME:=fmdb

CC:=ios-clang
CPP:=ios-clang++

CFLAGS += -fobjc-arc -include fmdb_Prefix.pch -I./src -I.

CPPFLAGS += -fobjc-arc -include fmdb_Prefix.pch -I./src -I.

LDFLAGS += -framework Foundation
LDFLAGS += -lsqlite3

# LDFLAGS += -framework AppKit

all: $(PROJECTNAME)

OBJS+=  \
	./src/FMDatabase.o \
	./src/fmdb.o \
	./src/FMResultSet.o \
	./src/FMDatabaseAdditions.o \
	./src/FMDatabasePool.o \
	./src/FMDatabaseQueue.o

$(PROJECTNAME): \
	./src/FMDatabase.o \
	./src/fmdb.o \
	./src/FMResultSet.o \
	./src/FMDatabaseAdditions.o \
	./src/FMDatabasePool.o \
	./src/FMDatabaseQueue.o
	mkdir -p xcbuild
	$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.o,$^) -o xcbuild/$@

./src/FMDatabase.o: ./src/FMDatabase.m
	$(CC) -c $(CFLAGS)  $< -o $@

./src/fmdb.o: ./src/fmdb.m
	$(CC) -c $(CFLAGS)  $< -o $@

./src/FMResultSet.o: ./src/FMResultSet.m
	$(CC) -c $(CFLAGS)  $< -o $@

./src/FMDatabaseAdditions.o: ./src/FMDatabaseAdditions.m
	$(CC) -c $(CFLAGS)  $< -o $@

./src/FMDatabasePool.o: ./src/FMDatabasePool.m
	$(CC) -c $(CFLAGS)  $< -o $@

./src/FMDatabaseQueue.o: ./src/FMDatabaseQueue.m
	$(CC) -c $(CFLAGS)  $< -o $@

clean:
	find . -name \*.o|xargs rm -rf
	rm -rf xcbuild
