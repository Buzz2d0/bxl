package main

import (
	"embed"
	"encoding/json"
	"fmt"
	"io/fs"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

//go:embed static
var staticFS embed.FS

func ViewServe(addr string) {
	r := gin.Default()

	sfs, _ := fs.Sub(staticFS, "static")
	r.StaticFS("/", http.FS(sfs))

	if err := r.Run(addr); err != nil {
		log.Printf("[Main] Gin engine error: %v", err)
	}

}

func BServe(addr string) {
	r := gin.Default()
	data := map[string]interface{}{
		"foo":   "bar",
		"name":  "bar",
		"user":  "bababaab",
		"email": "beef@bbq.com",
	}
	// 1. 标准的jsonp
	r.GET("jsonp", func(c *gin.Context) {
		c.JSONP(200, data)
	})
	// 2. content-type 为 text/html
	r.GET("jsonp_html", func(c *gin.Context) {
		c.Header("Content-Type", "text/html")

		jsonBytes, err := json.Marshal(data)
		if err != nil {
			c.Status(500)
			return
		}

		d := string(jsonBytes)
		callback := c.DefaultQuery("callback", "")
		if callback != "" {
			d = fmt.Sprintf("%s(%s)", callback, d)
		}
		c.String(200, d)
	})
	// 3. content-type 为 json
	r.GET("jsonp_json", func(c *gin.Context) {
		c.Header("Content-Type", "application/json")

		jsonBytes, err := json.Marshal(data)
		if err != nil {
			c.Status(500)
			return
		}

		d := string(jsonBytes)
		callback := c.DefaultQuery("callback", "")
		if callback != "" {
			d = fmt.Sprintf("%s(%s)", callback, d)
		}
		c.String(200, d)
	})

	if err := r.Run(addr); err != nil {
		log.Printf("[Main] Gin engine error: %v", err)
	}
}

func main() {
	go ViewServe(":8080")
	BServe(":8081")
}
