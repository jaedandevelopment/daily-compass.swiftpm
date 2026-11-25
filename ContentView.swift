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
    
    @State var taskBudget = 100
    
    
//
    
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
        taskBudget = 100;
    }
    //allocator to show the type of tasks/allocate tasks
    func taskAllocator() {
        if capacityScore > 3.8 && capacityScore <= 5.0 {
            print("You're vibing, here's your high tasks")
            print (moodValue, energyValue, stressValue)
            priorityTasks()
            if taskBudget >= 50 && taskBudget >= 0 {
                 print("You're doing great, you can afford to do more tasks!")
                for task in Tasks {
                    //this checks to to see if taskbudget is less than or equal to the next task in tasklist.
                    //if this is <= to the current remaining task budget than the loop stops and no more tasks are allocated
                    if taskBudget <= task.budget {
                        break
                    }
                    // added () around task.level or argument to check to see if task.level isActive and is med or high
                    if task.isActive && (task.level == "high" || task.level == "med") {
                        print("High Tasks", task.taskName, "Remaining Budget", taskBudget)
                        taskBudget = taskBudget - task.budget
                    }
                }
                print("remaining budget: ", taskBudget)
            }
            print("Remaining task budget:", taskBudget)
        } else if capacityScore >= 2.5 && capacityScore < 3.8{
            print("You're having a decent, here's your medium tasks")
            priorityTasks()
            if taskBudget > 50 && taskBudget >= 0 {
                 print("You have some room, here are some other tasks")
                for task in Tasks {
                    //this checks to to see if taskbudget is less than or equal to the next task in tasklist.
                    //if this is <= to the current remaining task budget than the loop stops and no more tasks are allocated
                    if taskBudget <= task.budget {
                        break
                    }
                    // added () around task.level or argument to check to see if task.level isActive and is med or high
                    if task.isActive &&  task.level == "med" {
                        print("Medium Tasks:", task.taskName, "Remaining Budget:", taskBudget)
                        taskBudget = taskBudget - task.budget
                        
                    }
                }
                print("remaining budget: ", taskBudget)
            }
        } else {
            print("Not such a great one, here's your priority tasks")
            priorityTasks()
        }
    }
    
    //function to apply all priority tasks by default where 'priority' is set to true
    func priorityTasks() {
        //loops through tasklist and shows all tasks where priority and isActive is true
        for task in Tasks {
            //checks to see if task is priority and isActive
            //currently only applies task which have level of low,
            //may change this to allow for 'med' or 'high' priority tasks to be added
            if task.priority && task.isActive && task.level == "low" {
                taskBudget = taskBudget - task.budget
                print("Priority Tasks:", task.taskName)
//                print(taskBudget, "new task budget")
            }
        }
    }
    
    struct TaskList: Identifiable {
        let id = UUID() // generates a automatic id 'hash' doesn't need to be declared for array object)
        let taskName: String
        var isActive: Bool
        var budget: Int
        var level: String
        var priority: Bool
    }
    
    var Tasks: [TaskList] = [
        
        TaskList(taskName: "make bed", isActive: true, budget: 5, level: "low", priority: true),
        TaskList(taskName: "make breakfast", isActive: false, budget: 10, level: "low", priority: true),
        TaskList(taskName: "do laundry", isActive: false, budget: 10, level: "low", priority: true),
        TaskList(taskName: "drink 3L water", isActive: true, budget: 5, level: "low", priority: true),
        TaskList(taskName: "meal prep", isActive: true, budget: 15, level: "med", priority: true),
        TaskList(taskName: "grocery shopping", isActive: false, budget: 20, level: "med", priority: false),
        TaskList(taskName: "walk the dog", isActive: false, budget: 25, level: "med", priority: true),
        TaskList(taskName: "clean kitchen", isActive: true, budget: 20, level: "med", priority: true),
        TaskList(taskName: "edit video", isActive: false, budget: 30, level: "high", priority: false),
        TaskList(taskName: "study for exam", isActive: true, budget: 45, level: "high", priority: true),
        TaskList(taskName: "create new yearly goals", isActive: false, budget:35, level: "high", priority: false),
        TaskList(taskName: "learn japanese", isActive: true, budget: 40, level: "high", priority: false),
        
    ]
    
     
}

   
    


