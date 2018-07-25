package app

import (
	"github.com/gin-gonic/gin"
)

// DoSignUp 注册
func DoSignUp(v *vgoat) {
	v.JSON(200, &gin.H{"message": "pong"})
}

// DoSignIn 登录
func DoSignIn(v *vgoat) {
	v.JSON(200, &gin.H{})
}
