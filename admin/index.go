package admin

import "github.com/gin-gonic/gin"

// Index 后台页面
func Index(v *vgoat) {
	v.JSON(200, &gin.H{})
}
