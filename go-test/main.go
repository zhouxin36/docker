package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	rand2 "math/rand"
	"net"
	"net/http"
	"runtime"
	"time"
)

var rand uint64

func main() {
	rand2.Seed(time.Now().UnixNano())
	rand = rand2.Uint64()
	mux := http.NewServeMux()
	mux.HandleFunc("/", index)
	mux.HandleFunc("/ip", ip)
	mux.HandleFunc("/html", html)
	log.Fatal(http.ListenAndServe("0.0.0.0:8000", mux))
}

func index(writer http.ResponseWriter, request *http.Request) {
	_, _ = writer.Write([]byte("OK"))
}

func html(writer http.ResponseWriter, request *http.Request) {
	res, err := http.Get("https://cn.bing.com")
	if err != nil {
		_, _ = fmt.Fprint(writer, "访问失败，无法访问外网:"+err.Error())
		return
	}
	defer res.Body.Close()
	bytes, _ := ioutil.ReadAll(res.Body)
	_, _ = writer.Write(bytes)
}

type status struct {
	Ncpu int
	Addr []string
	Rand uint64
}

func ip(w http.ResponseWriter, req *http.Request) {
	var stat status
	stat.Ncpu = runtime.NumCPU()
	addrs, _ := net.InterfaceAddrs()
	stat.Rand = rand
	for _, v := range addrs {
		stat.Addr = append(stat.Addr, v.String())
	}
	fmt.Println(stat)
	_ = json.NewEncoder(w).Encode(stat)
}
