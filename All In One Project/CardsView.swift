//
//  CardsView.swift
//  All In One Project
//
//  Created by constantine kos on 12.01.2021.
//

import SwiftUI

struct CardsView: View {
    var body: some View {
        VStack {
            SimpleFlipper()
            
            
            ExampleCard()
                .frame(width: UIScreen.main.bounds.width - 100, height: 200)
        }
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
    }
}



struct ExampleCard: View {
    @State var flipped = false // state variable used to update the card

    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(self.flipped ? .pink : .purple) // change the card color when flipped
            .padding()
            .rotation3DEffect(self.flipped ? Angle(degrees: 180): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
            .animation(.default) // implicitly applying animation

            .overlay(
                HStack {
                    Text("1234 5874 1234 1223")
                }
            )

            .onTapGesture {
                // explicitly apply animation on toggle (choose either or)
                //withAnimation {
                    self.flipped.toggle()
                //}
            }

    }
}


struct SimpleFlipper : View {
      @State var flipped = false

      var body: some View {

            let flipDegrees = flipped ? 180.0 : 0

            return VStack{
                  Spacer()

                  ZStack() {
                        Text("Front").placedOnCard(Color.yellow).flipRotate(flipDegrees).opacity(flipped ? 0.0 : 1.0)
                        Text("Back").placedOnCard(Color.blue).flipRotate(-180 + flipDegrees).opacity(flipped ? 1.0 : 0.0)
                  }
                  .animation(.easeInOut(duration: 0.8))
                  .onTapGesture { self.flipped.toggle() }
                  Spacer()
            }
      }
}

extension View {

      func flipRotate(_ degrees : Double) -> some View {
            return rotation3DEffect(Angle(degrees: degrees), axis: (x: 1.0, y: 0.0, z: 0.0))
      }

      func placedOnCard(_ color: Color) -> some View {
            return padding(5).frame(width: 250, height: 150, alignment: .center).background(color)
      }
}
