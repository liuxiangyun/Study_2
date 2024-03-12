@Entry
@Component
struct Second {
  @State message: string = 'Hello World'

  @Builder ABuilder() {
    Text('this直接引用' + this.message)
  }

  @Builder BBuilder(text: string) {
    Text('参数传递' + text)
  }

  @Builder CBuilder($$: { text: string }) {
    Text('引用传递' + $$.text)
  }

  build() {
    Row() {
      Column() {
        Text(this.buildLog())
        ABuilder()
        this.ABuilder()
        this.BBuilder(this.message)
        Button('切换文案').onClick(() => {
          this.message = 'Hello World' + Math.round(Math.random())
        })
        this.CBuilder({ text: this.message })
      }
      .width('100%')
    }
    .height('100%')
  }

  aboutToAppear() {
    console.error("second aboutToAppear")
  }

  buildLog(): string {
    console.error("second build")
    return this.message
  }

  onPageShow() {
    console.error("second onPageShow")
  }

  onBackPress() {
    console.error("second onBackPress")
  }

  onPageHide() {
    console.error("second onPageHide")
  }

  aboutToDisappear() {
    console.error("second aboutToDisappear")
  }
}

//全局自定义构建函数
@Builder
export function ABuilder() {
  Text('全局自定义构建函数')
}
