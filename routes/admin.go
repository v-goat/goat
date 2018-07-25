package routes

import (
	"antgo.io/goat/admin"
)

// AdminRoute 后台路由
func AdminRoute() {
	Route.GET("/admin", admin.Index) // 后台页面
}
