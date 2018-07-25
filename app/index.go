package app

import "github.com/gin-gonic/gin"

// Index 首页页面
func Index(v *vgoat) {
	v.JSON(200, &gin.H{})
}
