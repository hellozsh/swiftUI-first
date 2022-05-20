/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI


//In HikeView, change the default value for showDetail to true, and pin the preview to the canvas.
// 右边预览图的那个小📌
//This makes it possible for you to see the graph in context while you work on the animation in another file.

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        
//        AnyTransition.slide
//        AnyTransition.move(edge: .trailing)
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity))
    }
}

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = true

    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                Button {
                    withAnimation() {
                        showDetail.toggle()
                    }
                    
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
//                    以下有4个动画，当最后.spring()打开时候，会继承放大缩小和转90度动画，如果第二行.animation(nil, value: showDetail)打开， 第一个转90度动画就会无效
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
//                        .animation(nil, value: showDetail)
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
//                        .animation(.spring().delay(4), value: showDetail)
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
                    .transition(.moveAndFade)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: ModelData().hikes[0])
                .padding()
            Spacer()
        }
    }
}
