sources = chunk.c debug.c main.c memory.c
objs = $(sources:%.c=%.o)
exe = clox

.PHONY: all
all: run

$(exe): $(objs)
	gcc $(objs) -o $@

chunk.c: memory.h value.h common.h
debug.c: chunk.h common.h
memory.c: common.h
value.c: memory.h common.h
main.c: chunk.h debug.h common.h
%.c: %.h
	@touch $@

%.o: %.c
	gcc -c $<

.PHONY: clean
clean:
	-rm -f $(exe)
	-rm -f $(objs)

.PHONY: run
run: $(exe)
	./$(exe)
