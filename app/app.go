package app

import (
	"encoding/json"
	"net/http"

	"github.com/gin-gonic/gin"
)

type vgoat = gin.Context

type response struct {
	Code int
	Msg  string
	w    http.ResponseWriter
	Data interface{}
}

func (r *response) Invalide(w http.ResponseWriter, v interface{}) {

	w.Header().Set("Content-type", "application/json")
	w.WriteHeader(401)
	r.Code = 10000
	r.Data = v
	json.NewEncoder(w).Encode(r)
	return
}

func (r *response) Success(w http.ResponseWriter, v interface{}) {
	w.Header().Set("Content-type", "application/json")
	r.Code = 10000
	r.Data = v
	json.NewEncoder(w).Encode(r)
	return
}

func (r *response) Error(w http.ResponseWriter, v interface{}) {
	w.Header().Set("Content-type", "application/json")
	r.Code = 10000
	r.Data = v
	json.NewEncoder(w).Encode(r)
	return
}
