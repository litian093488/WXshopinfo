//index.js
//获取应用实例
const app = getApp()

var aMap = require('../../libs/amap-wx.js');

Page({
  data: {
  },

  // 选择位置
  selectLocation: function (e) {
    var that = this
    wx.chooseLocation({
      success: function (res) {
        // console.log(res.name)
        that.setData({
          location: {
            name: res.name,
            address: res.address,
            longitude: res.longitude,
            latitude: res.latitude
          }
        })
      },
      fail: function (error) {
        console.log(error)
      },
      complete: function (e) {
        console.log(e)
      }
    })
  },

// 获取位置信息显示在底部, ***bug=更换位置后不点击,提交的地址还是上一个地址***
  select: function (e) {
    var address = e.currentTarget.dataset.address;
    var longitude = e.currentTarget.dataset.longitude;
    var latitude = e.currentTarget.dataset.latitude;
    var name = e.currentTarget.dataset.name
    this.setData({
      ok_address: address
    })
    console.log("=2=" + address)
    this.setData({
      longitude: longitude
    })
    console.log("=3=" + longitude)
    this.setData({
      latitude:latitude
    })
    console.log("=4="+latitude)
    this.setData({
      name:name
    })
    console.log("=5="+name)
  },

  /*前台填写判断 */
  formSubmit: function (e) {
    if (e.detail.value.shopname.length == 0) {
      wx.showToast({
        title: '请勿调皮！',
        image: '/img/fail.svg',
        duration: 1500
      })
      return false
    }
    if (e.detail.value.tastegood.length == 0) {
      wx.showToast({
        title: '特色呢?',
        image: '/img/fail.svg',
        duration: 1000
      })
      return false
    }
    if (e.detail.value.address.length == 0) {
      wx.showToast({
        title: '请填写地址!',
        image: '/img/fail.svg',
        duration: 1000
      })
      return false
    }
    if (e.detail.value.contact.length == 0) {
      wx.showToast({
        title: '联系方式?',
        image: '/img/fail.svg',
        duration: 1000
      })
      return false
    }
    if (e.detail.value.introduce.length == 0) {
      wx.showToast({
        title: '说明呢?',
        image: '/img/fail.svg',
        duration: 1000
      })
      return false
    }
    if (e.detail.value.alipay.length == 0) {
      wx.showToast({
        title: '请填写支付宝获取佣金!',
        image: '/img/fail.svg',
        duration: 1000
      })
      return false
    }

    var that = this
    wx.request({
      
      // url为https类型。

      url: 'https://www.legendman.top/WXxiaochengxu/saveWXinfo',  
      header: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      method: "POST",
      data: {
        shopname: e.detail.value.shopname,
        qzpd: e.detail.value.qzpd,
        tastegood: e.detail.value.tastegood,
        provence: e.detail.value.provence,
        city: e.detail.value.city,
        address: e.detail.value.address,
        contact: e.detail.value.contact,
        introduce: e.detail.value.introduce,
        alipay: e.detail.value.alipay,
        ok_address: this.data.ok_address,
        longitude: this.data.longitude,
        latitude: this.data.latitude,
        name: this.data.name
      },
      
      success: function (res) {
        if (res.data.status == 0) {
          wx.showToast({
            title: '提交失败！',
            icon: 'loading',
            duration: 1500
          })
        } else {
          wx.showToast({
            title: '提交成功！',
            image: '/img/success.svg',
            duration: 1500
          })
          that.setData({
            // 每次提交完成后清空input框
            // form_info:''
          })
        }
      }
    })
  },
})