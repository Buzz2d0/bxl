package main

import (
	"reflect"
	"testing"
	"text/template"
	"unsafe"
)

func Test_JSEscapeString(t *testing.T) {
	for _, v := range []string{
		"test",
		"alert(1);test",
		"alert(1),test",
	} {
		t.Log(template.JSEscapeString(v))
	}
}

// [Golang中[]byte与string转换](https://segmentfault.com/a/1190000037679588)

// StringToBytes converts string to byte slice without a memory allocation.
func StringToBytes(s string) []byte {
	return *(*[]byte)(unsafe.Pointer(
		&struct {
			string
			Cap int
		}{s, len(s)},
	))
}

// BytesToString converts byte slice to string without a memory allocation.
func BytesToString(b []byte) string {
	return *(*string)(unsafe.Pointer(&b))
}

func String2Bytes(s string) []byte {
	sh := (*reflect.StringHeader)(unsafe.Pointer(&s))
	bh := reflect.SliceHeader{
		Data: sh.Data,
		Len:  sh.Len,
		Cap:  sh.Len,
	}
	return *(*[]byte)(unsafe.Pointer(&bh))
}

func Bytes2String(b []byte) string {
	return *(*string)(unsafe.Pointer(&b))
}

func Test_StringToBytes(t *testing.T) {
	b := StringToBytes("abc")
	t.Log(b)
	b[0] = 'c' // panic
	t.Log(b)

	b = []byte("abc")
	t.Log(b)
	b[0] = 'c'
	t.Log(b)
}

func Test_String2Bytes(t *testing.T) {
	b := String2Bytes("abc")
	t.Log(b)
	b[0] = 'c' // panic
	t.Log(b)
}
