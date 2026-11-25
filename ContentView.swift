import SwiftUI

struct ContentView: View {
    
    
    //delcaring arrays for each of the VibeCalculators options
    
    let moods = ["low", "down","okay", "good", "great"]
    let energyLevel = ["1", "2", "3", "4", "5"]
    let stressLevel = ["Low", "Medium", "High"]
    
    //declaration of selectors for the vibeCalc
    @State var moodSelection = false
    @State var moodValue: Double = 0
    
    @State var energySelection = false
    @State var energyValue: Double = 0
    
    @State var stressSelection = false
    @State var stressValue: Double = 0
    
    @State var capacityScore: Double = 0
    
    var body: some View {
        //greeting and date
//        VStack {
//            Text(Date.now, format: .dateTime.weekday().day().month())
//            Text("Good Morning, User!").font(Font.title2.bold())
//        }
//        
//        HStack(spacing: 12) {
//            //looping through moods array and taking id - 'index' of option and creating a button
//            ForEach(moods, id: \.self) {
//                mood in Button(mood) {
//                    var moodSelection = true
//                    
//                }
//            }
//        }
//        HStack(spacing: 12) {
//            //looping through moods array and taking id - 'index' of option and creating a button
//            ForEach(energyLevel, id: \.self) {
//                energy in Button(energy) {
//                    
//                }
//            }
//        }
//        HStack(spacing: 12) {
//            //looping through moods array and taking id - 'index' of option and creating a button
//            ForEach(stressLevel, id: \.self) {
//                stress in Button(stress) {
//                    
//                }
//            }
//        }
        
        
       
        
        
//// m/e/s -> selector
                VStack {
                    Text("Mood - How you feel?").padding(.bottom)
                    HStack {
                        //low button
                        Button {

                             moodSelection.toggle()
                            if moodSelection {
                                moodValue = 1
                            }
                            
                        } label: {
                            VStack{
                                Text("😔")
                                Text("Low")
                            }
                        };
                        Button {
                            moodSelection.toggle()
                           if moodSelection {
                               moodValue = 2
                           }
                          
                        } label: {
                            VStack{
                                Text("😕")
                                Text("Down")
                            }
                        };
                        Button {
                            moodSelection.toggle()
                           if moodSelection {
                               moodValue = 3
                           }
                          
                        } label: {
                            VStack{
                                Text("😐")
                                Text("Okay")
                            }
                        };
                        Button {
                            moodSelection.toggle()
                           if moodSelection {
                               moodValue = 4
                           }
                          
                        } label: {
                            VStack{
                                Text("🙂")
                                Text("Good")
                            }
                        };
                        Button {
                            moodSelection.toggle()
                           if moodSelection {
                               moodValue = 5
                           }
                          
                        } label: {
                            VStack{
                                Text("😁")
                                Text("Great")
                            }
                        }
        
                    }.padding(.bottom)
        
                    VStack{
                        Text("Energy Level").padding(.bottom)
                        HStack{
                            Button {
                                energySelection.toggle()
                                if energySelection {
                                    energyValue = 1
                                }
                            } label: {
                                VStack{
                                    Text("1")
                                }
                            };
                            Button {
                                energySelection.toggle()
                                if energySelection {
                                    energyValue = 2
                                }
                            } label: {
                                VStack{
                                    Text("2")
                                }
                            };
                            Button {
                                energySelection.toggle()
                                if energySelection {
                                    energyValue = 3
                                }
                            } label: {
                                VStack{
                                    Text("3")
                                }
                            };
                            Button {
                                energySelection.toggle()
                                if energySelection {
                                    energyValue = 4
                                }
                            } label: {
                                VStack{
                                    Text("4")
                                }
                            };
                            Button {
                                energySelection.toggle()
                                if energySelection {
                                    energyValue = 5
                                }
                            } label: {
                                VStack{
                                    Text("5")
                                }
                            }
                        }
                    }
                    VStack{
                        Text("Stress Level").padding(.bottom)
                        HStack{
                            Button {
                                stressSelection.toggle()
                                if stressSelection {
                                    stressValue = 1
                                }
                            } label: {
                                VStack{
                                    Text("Low")
                                }
                            };
                            Button {
                                stressSelection.toggle()
                                if stressSelection {
                                    stressValue = 2
                                }
                            } label: {
                                VStack{
                                    Text("Medium")
                                }
                            };
                            Button {
                                stressSelection.toggle()
                                if stressSelection {
                                    stressValue = 3
                                        
                                }
                            } label: {
                                VStack{
                                    Text("High")
                                }
                            }
                        }
                    }
                    Button {
                        vibeCalc()
                    } label: {
                        Text("Calculate")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    
                    
                }
    }
    
    //vibe calculator function
    
    //enums for vibe calculator
    
//    enum Moods: CaseIterable {
//        case low, down, okay, good, great
//    }
//
//    enum EnergyLevels: CaseIterable {
//        case one, two, three, four, five
//    }
//    
//    func Mood() {
//        for mood in Moods.allCases {
//            print(mood)
//        }
//    }
    
    
    func vibeCalc() {
    //take in mood, energy, stress selections where 'seletion var is true'
    //depending on the selection
    // if mood, energy and stress are selected than calculate capacityScore
        //when capacityScore is selected 'out of 5' run 'taskAllocator' to show which type of day it is
        if moodSelection == true && energySelection == true && stressSelection == true{
            
            capacityScore = (energyValue * 0.45) + ((6 - stressValue ) * 0.3) + (moodValue * 0.25)
            taskAllocator()
        } else {
            // if mod or energy or stress selection has not been input then show error prompt to select all inputs
            print("Please select a mood, energy and stress level")
        }
        //runs reset function to return selection back to dalse and zero
        resetVibeCalc()
        
    }
    //reset function to revert m/e/s selections back to false and 0 to restart calculator
    func resetVibeCalc() {
        moodSelection = false;
        energySelection = false;
        stressSelection = false;
        moodValue = 0;
        energyValue = 0;
        stressValue = 0;
        capacityScore = 0;
    }
    //allocator to show the type of tasks/allocate tasks
    func taskAllocator() {
        if capacityScore > 3.8 && capacityScore <= 5.0 {
            print("You're vibing, here's your high tasks")
        } else if capacityScore >= 2.5 && capacityScore < 3.8{
            print("You're having a decent, here's your medium tasks")
        } else {
            print("Not such a great one, here's your low tasks")
        }
    }
    
}

   
    


