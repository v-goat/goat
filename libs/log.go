package libs

import (
	"fmt"
	"log"
	"os"
)

const (
	red = uint8(iota + 91)
	green
	yellow
	blue
	magenta //洋红
)

var Debug *log.Logger
var Success *log.Logger
var Error *log.Logger
var Warn *log.Logger
var Log *log.Logger

func New() {
	fmt.Println(colour("[success]", green))
	if Conf.Debug {
		Debug = log.New(os.Stdout, colour("[debug]", magenta), log.LstdFlags|log.Lshortfile)
		Success = log.New(os.Stdout, colour("[success]", green), log.LstdFlags|log.Lshortfile)
		Error = log.New(os.Stdout, colour("[error]", red), log.LstdFlags|log.Lshortfile)
		Warn = log.New(os.Stdout, colour("[warn]", yellow), log.LstdFlags|log.Lshortfile)
		Log = log.New(os.Stdout, colour("[log]", blue), log.LstdFlags|log.Lshortfile)
		return
	}
	debugLogFile, err := os.Create("./debug.log")
	if err != nil {
		log.Fatalln("create debug.log file error !")
	}
	defer debugLogFile.Close()
	errorLogFile, err := os.Create("./error.log")
	if err != nil {
		log.Fatalln("create error.log error !")
	}
	defer errorLogFile.Close()
	warnLogFile, err := os.Create("./warn.log")
	if err != nil {
		log.Fatalln("create warn.log file error !")
	}
	defer warnLogFile.Close()
	defaultLogFile, err := os.Create("./do.log")
	if err != nil {
		log.Fatalln("create do.log file error !")
	}
	defer defaultLogFile.Close()
	Debug = log.New(debugLogFile, "", log.LstdFlags|log.Lshortfile)
	Error = log.New(errorLogFile, "", log.LstdFlags|log.Lshortfile)
	Warn = log.New(warnLogFile, "", log.LstdFlags|log.Lshortfile)
	Log = log.New(defaultLogFile, "", log.LstdFlags|log.Lshortfile)
}

// colour 上色
func colour(s string, color uint8) string {
	return fmt.Sprintf("\x1b[%dm%s\x1b[0m", color, s)
}
