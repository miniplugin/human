reciprocal: main.o reciprocal.o
	g++ $(CFLAGS) -o reciprocal main.o reciprocal.o
main.o: main.c reciprocal.hpp
	gcc $(CFLAGS) -c main.c
reciprocal.o: reciprocal.cpp reciprocal.hpp
	g++ $(CFLAGS) -c reciprocal.cpp
clean:
	rm -f *.o reciprocal


# ----- 기본적인 Makefile 구조 -----------
# Target: Dependencies
# [Tab] Command
# --------------------------------------


# ------ 기본 매크로들 -------------------
# $(CC) - 항상 C 컴파일러
# $(LD) - 항상 링커로 인식
# make -p 하면 매크로 설명이 나옴

# $* - 현재 타겟보다 최근에 변경된 현재 필요 항목의 이름(확장자 제외)
main.o: io.h main.c
	gcc -c $*.c
	# $*는 main.c 를 의미한다.
	# main.o보다 main.c가 더 최신파일일 경우라면. 
	# 고쳐진 부분이 없으면 컴파일 하지 말라는 뜻.
	# 질문: io.h를 말하는지 main.c를 말하는지 어떻게 아는가?
	
# $@ - 현재 타겟
# $^ - 현재 타겟보다 최근에 변경된 필요 항목들의 리스트
