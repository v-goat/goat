package routes

import (
	"antgo.io/goat/app"
)

// AppRoute 前台路由
func AppRoute() {
	Route.GET("/", app.Index)            // 首页页面
	Route.POST("/sign-up", app.DoSignUp) // 注册处理
	Route.POST("/sign-in", app.DoSignIn) // 登录处理
}
