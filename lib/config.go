package lib

import (
	"encoding/json"
	"io/ioutil"
	"log"
	"os"
	"time"
)

// Configuration 配置
type Configuration struct {
	Debug      bool   `json:"debug"`       //是否使用debug模式
	Domain     string `json:"domain"`      //服务器运行的域名
	Version    string `json:"version"`     //版本号
	Port       string `json:"port"`        //运行端口,默认9001
	DBHost     string `json:"db_host"`     // DBHost 数据库主机
	DBPort     string `json:"db_port"`     // DBPort 数据库端口
	DBName     string `json:"db_name"`     //DBDatabase 数据库数据库
	DBUser     string `json:"db_user"`     //DBUsername 数据库用户名
	DBPassword string `json:"db_password"` //DBPassword 数据库密码
}

// Conf 配置
var Conf Configuration

// GetConfigs 读取配置
func GetConfigs() {
	f, err := os.Open("./config/config.json")
	if err != nil {
		log.Fatal(err)
	}
	b, err := ioutil.ReadAll(f)
	if err != nil {
		log.Fatal(err)
	}
	err = json.Unmarshal(b, &Conf)
	if err != nil {
		log.Fatal(err)
	}
	subVersion := time.Now().Format("1021504")
	Conf.Version = "1.0." + subVersion
}
