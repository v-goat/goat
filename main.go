package main

import (
	"antgo.io/goat/lib"
	"antgo.io/goat/routes"
)

func init() {
	lib.GetConfigs()
	lib.LogBegin()
}

func main() {
	routes.New().Run(":3333")
}
