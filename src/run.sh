#!/usr/bin/env bash
set -Ceu
#---------------------------------------------------------------------------
# MONOとNuGetを使ってCommandLineParserを入手して使う。
# CreatedAt: 2020-10-28
#---------------------------------------------------------------------------
Run() {
	THIS="$(realpath "${BASH_SOURCE:-0}")"; HERE="$(dirname "$THIS")"; PARENT="$(dirname "$HERE")"; THIS_NAME="$(basename "$THIS")"; APP_ROOT="$PARENT";
	cd "$HERE"
#	csc -nologo Program.cs Sub.cs
#	csc -nologo *.cs -out:prog.exe
	csc -nologo -recurse:*.cs -nullable:enable -langversion:latest -r:CommandLine.dll
	mono Program.exe
	mono Program.exe -a ABC -b -c A,B,C -d X a.txt
	mono Program.exe -Z
	# バージョン表示がセマンティック・バージョニングじゃない
	mono Program.exe --help
	mono Program.exe --version
	# 以下、うまく取得できない。CommandLineParser v2.8.0
	mono Program.exe -a ABC -b -c A,B,C a.txt
	mono Program.exe -a ABC -b -c A,B,C -- a.txt
}
Run "$@"
