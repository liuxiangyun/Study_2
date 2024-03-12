import router from '@ohos.router'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State isShowHello: boolean = true

  build() {
    Row() {
      Column() {

        if (this.isShowHello) {
          Hello({ text: this.buildLog() })
        }

        Button(this.isShowHello ? 'show hello' : 'hide hello').onClick(() => {
          this.isShowHello = !this.isShowHello
        })

        Button('enter second page').onClick(() => {
          router.replaceUrl({ url: 'pages/Second' })
        }).margin({ top: vp2px(2) })
        Button('enter third page').onClick(() => {
          router.pushUrl({ url: 'pages/Third' })
        }).margin({ top: vp2px(2) })
      }
      .width('100%')
    }
    .height('100%')
  }

  aboutToAppear() {
    console.warn("index aboutToAppear")
  }

  buildLog(): string {
    console.warn("index build")
    return this.message
  }

  onPageShow() {
    console.warn("index onPageShow")
  }

  onBackPress() {
    console.warn("index onBackPress")
  }

  onPageHide() {
    console.warn("index onPageHide")
  }

  aboutToDisappear() {
    console.warn("index aboutToDisappear")
  }
}

@Component
export struct Hello {
  text: string

  build() {
    Text(this.buildLog())
      .fontSize(50)
      .fontWeight(FontWeight.Bold)
  }

  buildLog(): string {
    console.log("child build")
    return this.text
  }

  aboutToAppear() {
    console.log('child aboutToAppear')
  }

  aboutToDisappear() {
    console.log('child aboutToDisappear')
  }
}