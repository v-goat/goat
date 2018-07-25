package app

import (
	"github.com/gin-gonic/gin"
)

type vgoat = gin.Context

type response = gin.H

type responseData struct {
	Code int
	Msg  string
	Data interface{}
}

// Success 正确响应
func Success(v *vgoat, data interface{}) {
	res := &gin.H{"Code": 10000, "Data": data}
	v.JSON(200, res)
}

// Error 错误响应
func Error(v *vgoat, data interface{}) {
	res := &gin.H{"Code": 40000, "Data": data}
	v.JSON(200, res)
}

// View 渲染视图
func View(v *vgoat, name string, data interface{}) {
	res := &gin.H{"Code": 40000, "Data": data}
	v.HTML(200, name, res)
}
