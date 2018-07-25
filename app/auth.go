package app

import "antgo.io/goat/lib"

//SignUp 注册页面
func SignUp(v *vgoat) {
	version := lib.Conf.Version
	res := map[string]string{"message": "pong", "version": version}
	View(v, "test.html", res)
}

// DoSignUp 注册处理
func DoSignUp(v *vgoat) {
	version := lib.Conf.Version
	res := map[string]string{"message": "pong", "version": version}
	Success(v, res)
}

// DoSignIn 登录
func DoSignIn(v *vgoat) {
	res := map[string]string{"message": "pong"}
	Success(v, res)
}
