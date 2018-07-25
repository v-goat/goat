package routes

import (
	"github.com/gin-gonic/gin"
)

// Route 路由
var Route *gin.Engine

// New 开始路由
func New() *gin.Engine {
	gin.SetMode(gin.ReleaseMode)
	Route = gin.Default()
	Route.LoadHTMLGlob("public/themes/*")
	AppRoute()
	AdminRoute()
	return Route
}
