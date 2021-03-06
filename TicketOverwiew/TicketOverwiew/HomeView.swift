//
//  HomeView.swift
//  TicketOverwiew
//
//  Created by Jakub Slawecki on 21/02/2020.
//  Copyright © 2020 Jakub Slawecki. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var control: TicketCardView_Control
    @Binding var showCreateTicket: Bool
    //change cardData to real tickets
    var tickets = cardData
    
    var body: some View {
        
        ZStack {
            ScrollView(.vertical) {
                
                ScrollViewTitleView(showCreateTicket: $showCreateTicket)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .blur(radius: control.anyTicketTriggered ? 20 : 0)
                
                ForEach(self.tickets) { ticket in
                    ExpandableCardView(ticket: ticket)
                            .environmentObject(self.control)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 30)
                }
                
            }
            
            VStack {
                SystemMaterialView(style: .regular)
                    .frame(height: self.control.anyTicketTriggered ? 0 : 40)
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
        }
    
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            HomeView(showCreateTicket: .constant(false))
                .environmentObject(TicketCardView_Control())
                .environment(\.colorScheme, .light)
         
        }
        
    }
    
}

struct ScrollViewTitleView: View {
    @Binding var showCreateTicket: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("MON, FEBUARY 31")
                .font(.caption)
                .fontWeight(.semibold)
                .padding(.bottom, -5)
                .foregroundColor(Color(.secondaryLabel))
            
            HStack(alignment: .center) {
                Text("Title")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(.label))
                Spacer()
                
                ShowActionButton(systemSymbol: "plus") {
                    self.showCreateTicket.toggle()
                }
                
            }
            
        }
        .padding(.bottom, -5)
        
    }
    
}


//MARK: Fake Data

//Ticket to -> Card
struct Ticket : Identifiable {
    var id = UUID()
    
    var subtitle: String
    var title: String
    var briefSummary: String
    var description: String
    var image: String
}

let desPlaceholer = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Enim eu turpis egestas pretium aenean pharetra magna ac. Quis enim lobortis scelerisque fermentum. Phasellus faucibus scelerisque eleifend donec pretium. Nec ullamcorper sit amet risus nullam eget. Convallis convallis tellus id interdum velit."

let cardData: [Ticket] = [
    Ticket(subtitle: "24.02.2020", title: "Title", briefSummary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.", description: desPlaceholer, image: "img2"),
    Ticket(subtitle: "21.02.2020", title: "Title 2", briefSummary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor", description: desPlaceholer, image: "img3"),
    Ticket(subtitle: "21.02.2020", title: "Title 3", briefSummary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor", description: desPlaceholer, image: "img4"),
    Ticket(subtitle: "20.02.2020", title: "Title 4", briefSummary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor", description: desPlaceholer, image: "img1"),
]
